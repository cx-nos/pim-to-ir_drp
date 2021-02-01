# DRP - per vni migration
1. ansible-playbook playbooks/3_configure_host.yml -i inventories/INT/pim-to-ir_drp_inventory-vni_inventory-vni-<vni_number>.yml -e "@inventories/INT/extra_vars.yml" -e "configs_dir='pim-to-ir_drp/configs-vni-<vni_number>'"
1. ansible-playbook playbooks/3_configure_host.yml -i inventories/INT/software-upgrade_inventory-vni-<vni_number>.yml -e "@inventories/INT/extra_vars.yml" -e "configs_dir='pim-to-ir_drp/configs-vni-<vni_number>'"

# Gracefull migration
1. ansible-playbook playbooks/0_grab_show_run.yml -i inventories/INT/hosts.yml -e "@inventories/INT/extra_vars.yml" --ask-vault-pass
1. ansible-playbook playbooks/1_generate_configs.yml -i inventories/INT/hosts.yml -e "@inventories/INT/extra_vars.yml" --ask-vault-pass
1. ansible-playbook playbooks/2_checkpoint_config.yml -i inventories/INT/pim-to-ir_drp_inventory.yml -e "@inventories/INT/extra_vars.yml" --ask-vault-pass
1. ansible-playbook playbooks/3_configure_host.yml -i inventories/INT/pim-to-ir_drp_inventory.yml -e "@inventories/INT/extra_vars.yml" --ask-vault-pass
1. ansible-playbook playbooks/4_rollback_execute.yml -i inventories/INT/pim-to-ir_drp_inventory.yml -e "@inventories/INT/extra_vars.yml" --ask-vault-pass

# Lab commands 
ansible-playbook playbooks/0_grab_show_run.yml -i inventories/STAN-1/hosts.yml -e "@inventories/STAN-1/extra_vars.yml"
ansible-playbook playbooks/0_show_version.yml -i inventories/STAN-1/hosts.yml -e "@inventories/STAN-1/extra_vars.yml"
ansible-playbook playbooks/1_generate_configs.yml -i inventories/STAN-1/hosts.yml -e "@inventories/STAN-1/extra_vars.yml"
ansible-playbook playbooks/2_checkpoint_config.yml -i inventories/STAN-1/pim-to-ir_drp_inventory.yml -e "@inventories/STAN-1/extra_vars.yml"
ansible-playbook playbooks/3_configure_host.yml -i inventories/STAN-1/pim-to-ir_drp_inventory.yml -e "@inventories/STAN-1/extra_vars.yml"
ansible-playbook playbooks/4_rollback_execute.yml -i inventories/STAN-1/pim-to-ir_drp_inventory.yml -e "@inventories/STAN-1/extra_vars.yml"
