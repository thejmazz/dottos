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
    bastion_user=${2:-core}
    target_user=${3:-core}

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
    ssh $target_user@$private_ip -J $bastion_user@$bastion_ip
}

# Retrieves an un-associated floating ip if available, or allocates 1 from pool
function os_get_fip () {
    # TODO store pool name somewhere alongside project configuration
    # NOTE `openstack floating ip pool list` not working
    pool=${1:-"Kidnet External"}

    fip=$(
        openstack floating ip list --format value -c 'Floating IP Address' -c 'Fixed IP Address' | \
        awk '/None/{print $1}' | \
        head -n 1
    )

    if [[ $(echo $fip) == "" ]]; then
        fip=$(openstack floating ip create --format value -c 'floating_ip_address' "$pool")
    fi

    if [[ "$?" != "0" ]]; then
        echo "Error reqesting floating ip, you have likely exhausted the pool"
    fi

    if [[ "$fip" != "" ]]; then
        echo $fip
    fi
}

# deletes all un-assigned floating ips
function os_clean_fips () {
    fips=( $(openstack floating ip list --format value -c 'Floating IP Address' -c 'Fixed IP Address' | awk '/None/{print $1}') )

    for fip in "${fips[@]}"; do
        openstack floating ip delete $fip && echo "Deleted $fip"
    done
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
