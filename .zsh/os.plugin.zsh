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
    # assumes one subnet for private ips
    subnet_prefix=$(
        openstack subnet list -f json | \
        jq -r '.[].Subnet' | \
        sed -r s'/([0-9]+)\.([0-9]+)\.([0-9]+)\.[0-9]+\/24/\1\.\2\.\3/'
    )

    server_ips=$(
        openstack server list -f json | \
        jq -r '.[] | select(.Name == "'$1'").Networks' | \
        sed -r s'/[a-zA-Z0-9]+=//' | sed s'/, /\n/'
    )

    private_ip=$(echo $server_ips | grep $subnet_prefix)

    # TODO dont depend on rc-os-bastion ssh config
    ssh ubuntu@$private_ip -o ProxyCommand='ssh rc-os-bastion -W %h:%p'
}

compctl -K os_projects osp
compctl -K os_servers ossh
