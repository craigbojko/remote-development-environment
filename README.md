# RaspberryPi Development Environment

Ansible playbook project to setup a RaspberryPi development environment. The idea is to have a simple way to setup a RaspberryPi with all the tools needed to develop software, which will allow for software development via any device that can SSH into the RaspberryPi (think iPad, Chromebook, etc).

## Tools

- [Ansible](https://www.ansible.com/)

## Usage

1. Install Ansible on your local machine
2. Clone this repository
3. Update the `hosts` file with the IP address of your RaspberryPi (sample file provided)
4. Run the playbook

```bash
ansible-playbook -i hosts playbook.yml --extra-vars "@vars/...yml"
```

or

```bash
./run.sh
```

## Environment

- Git
- Vim
- NVM
- Node.js (LTS) via NVM
- Resilio Sync

## TODO

- [ ] VS Code via code-server
- [ ] Docker
