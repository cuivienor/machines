# Personal Machines Ansible Repository

This repository manages configuration for personal machines using Ansible.

## Fresh Arch Linux Installation Setup

For a brand new Arch Linux installation, follow these steps:

1. **Install required packages:**
   ```bash
   sudo pacman -S ansible git python
   ```

2. **Clone this repository:**
   ```bash
   git clone https://github.com/yourusername/machines.git
   cd machines
   ```

3. **Install required Ansible collections:**
   ```bash
   ansible-galaxy collection install community.crypto
   ```

4. **Create vault password file:**
   ```bash
   echo "your_vault_password_here" > .vault_pass
   chmod 600 .vault_pass
   ```

5. **Configure vault variables:**
   ```bash
   ansible-vault create group_vars/all/vault.yml
   # Add the following content:
   # vault_user_password: "your_desired_user_password"
   # vault_ssh_key_passphrase: "your_ssh_key_passphrase"
   ```

6. **Update inventory for local machine:**
   ```bash
   # The inventory.yml is already configured for WSL/local use
   # For other machines, update the hosts section
   ```

7. **Run the playbook:**
   ```bash
   ansible-playbook playbooks/site.yml --ask-become-pass
   ```

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