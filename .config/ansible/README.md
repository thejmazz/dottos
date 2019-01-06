# ansible

Roles to bootstrap my development environment on Ubuntu 18.04.

```
ansible-playbook --connection=local -i "127.0.0.1," --extra-vars='{"neovim_users": ["root","julian"]}' bootstrap.yml
ansible --connection=local -i "127.0.0.1," --become all -m include_role -a name=tmux
```
