 ansible-playbook playbooks/3_configure_host.yml -i inventories/INT/software-upgrade_inventory-vni-<vni_number>.yml -e "@inventories/INT/extra_vars.yml" -e "configs_dir='pim-to-ir_drp/configs-vni-<vni_number>'"

 ansible-playbook playbooks/3_configure_host.yml -i inventories/INT/software-upgrade_inventory-vni-<vni_number>.yml -e "@inventories/INT/extra_vars.yml" -e "configs_dir='pim-to-ir_drp/configs-vni-<vni_number>'"


----
ansible-playbook playbooks/0_grab_show_run.yml -i inventories/INT/hosts.yml -e "@inventories/INT/extra_vars.yml"
ansible-playbook playbooks/1_generate_configs.yml -i inventories/INT/hosts.yml -e "@inventories/INT/extra_vars.yml"
ansible-playbook playbooks/2_checkpoint_config.yml -i inventories/INT/pim-to-ir_drp_inventory.yml -e "@inventories/INT/extra_vars.yml"
ansible-playbook playbooks/3_configure_host.yml -i inventories/INT/pim-to-ir_drp_inventory.yml -e "@inventories/INT/extra_vars.yml"
ansible-playbook playbooks/4_rollback_execute.yml -i inventories/INT/pim-to-ir_drp_inventory.yml -e "@inventories/INT/extra_vars.yml"
