# homelab
Various Ansible playbooks to automate my homelab

For every new Debian/Ubuntu host - physical/VM/CT:

ansible-playbook standard_host.yml -i inventory.yml --limit <host>

To deploy some service:

ansible-playbook services.yml -i inventory.yml --tags "docker,samba"