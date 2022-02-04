# homelab
Various Ansible playbooks to automate my homelab

Run the following command for every new Debian/Ubuntu host - physical/VM/CT:

    ansible-playbook standard_host.yml -i inventory.ini --limit <host>

Run the following command to deploy some service(s):

    ansible-playbook services.yml -i inventory.ini --tags "<comma delimited tags>"

Run the following command to deploy some service(s) to a specific host:

    ansible-playbook services.yml -i inventory.ini --tags "<comma delimited tags>" --limit <host>