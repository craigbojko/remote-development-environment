# Ansible Vault

## Encrypting/Decrypting

To decrypt the vault file, use the following and provide the password:

```bash
ansible-vault decrypt vars/k3s-secrets.yaml
```

To encrypt the vault file, use the following and provide a new password:

```bash
ansible-vault encrypt vars/k3s-secrets.yaml
```

## Creating New Vaults

Use `ansible-vault create vars/<filename>.yaml` to create a new encrypted vault file.

### K3S Secrets

The k3s-secrets file contains a generated token for the k3s cluster. This token is used to connect new nodes to the server.
