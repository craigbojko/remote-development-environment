# Adding Ansible Galaxy Roles

To add remote roles from Ansible Galaxy, you can use the `ansible-galaxy` command. This command will download the role from the Ansible Galaxy repository and place it in the `~/.ansible/roles` directory. You can then use the role in your playbooks.

To add a role, use the following command:

```bash
ansible-galaxy install <role_name>
```

To list all the roles installed on your system, use the following command:

```bash
ansible-galaxy list
```

## Installed Roles

The following roles are required for this project:

- `ansible-role-install-resilio` - Installs Resilio Sync on a server.

> Installed by running `ansible-galaxy install git+https://github.com/klems/ansible-role-install-resilio.git`
