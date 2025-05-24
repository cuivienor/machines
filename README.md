# Personal Machines Ansible Repository

This repository manages configuration for personal machines using Ansible.

## Setup

1. Copy the vault password file:
   ```bash
   cp .vault_pass.example .vault_pass
   # Edit .vault_pass with your vault password
   ```

2. Set the user password in the vault:
   ```bash
   # Edit the vault file and set your desired password
   ansible-vault edit group_vars/all/vault.yml
   ```

3. Update inventory with your machine IPs and connection details:
   ```bash
   vim inventory.yml
   ```

## Usage

Run the user setup playbook:
```bash
ansible-playbook playbooks/user-setup.yml
```

Run the complete site configuration:
```bash
ansible-playbook playbooks/site.yml
```

Test connectivity:
```bash
ansible all -m ping
```

## Structure

- `roles/user_management/` - Role for creating users and configuring sudo
- `playbooks/` - Ansible playbooks
- `group_vars/all/` - Variables and vault files
- `inventory.yml` - Machine inventory

## Adding New Machines

1. Add the machine to `inventory.yml`
2. Ensure SSH access is configured
3. Run the playbooks