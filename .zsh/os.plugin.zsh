# needs jq and gnu sed (and openstack client obviously)

export OS_HOME=~/.os

function osp {
    source $OS_HOME/$1-openrc.sh

    openstack server list -f value -c Name > $OS_HOME/servers
}

function os_projects {
    reply=($(ls $OS_HOME | grep "\-openrc.sh$" | sed s'/^\(.*\)-openrc.sh/\1/'))
}

function os_servers {
    reply=($(cat $OS_HOME/servers))
    # TODO use async and cache in file each time this function is called
    # reply=($(openstack server list -f value -c Name))
}

function ossh {
    # TODO cache these values ahead of time, or perhaps use an Ansible inventory
    # TODO handle direct ssh w/o bastion

    # TODO get bastion name somehow
    bastion_name=bastion

    # Assumes one subnet for private ips
    subnet_prefix=$(
        openstack subnet list -f json | \
        jq -r '.[].Subnet' | \
        sed -r s'/([0-9]+)\.([0-9]+)\.([0-9]+)\.[0-9]+\/24/\1\.\2\.\3/'
    )

    # Assumes floating IP pool giving out IPs from same prefix as first in list
    floating_ip_prefix=$(
        openstack floating ip list -f value -c 'Floating IP Address' | \
        head -n 1 | \
        sed -r s'/([0-9]+)\.([0-9]+)\.([0-9]+)\.[0-9]+/\1\.\2\.\3/'
    )

    server_ips=$(
        openstack server list -f json | \
        jq -r '.[] | select(.Name == "'$1'").Networks' | \
        sed -r s'/[a-zA-Z0-9_]+=//' | sed s'/, /\n/'
    )

    private_ip=$(echo $server_ips | grep $subnet_prefix)

    bastion_ips=$(
        openstack server list -f json | \
        jq -r '.[] | select(.Name == "'$bastion_name'").Networks' | \
        sed -r s'/[a-zA-Z0-9_]+=//' | sed s'/, /\n/'
    )

    bastion_ip=$(echo $bastion_ips | grep $floating_ip_prefix)

    # TODO use labels to determine core vs ubuntu, etc
    ssh core@$private_ip -J core@$bastion_ip
}

alias ossafip="openstack server add floating ip"
alias ossrfip="openstack server remove floating ip"
alias ossasg="openstack server add security group"
alias ossrsg="openstack server remove security group"
alias osfl="openstack flavor list"
alias ossl="openstack server list"
alias ossc="openstack server create"
alias ossd="openstack server delete"
alias osil="openstack image list"
alias osfipl="openstack floating ip list"
alias ossgl="openstack security group list"

compctl -K os_projects osp
compctl -K os_servers ossh
compctl -K os_servers ossd
