 ansible-playbook playbooks/no_scheduler_stage_2/3_configure_host.yml -i inventories/STAN-1/software-upgrade_inventory-vni-1002.yml -e "@playbooks/no_scheduler_stage_2/extra_vars.yml" -e "configs_dir='pim-to-ir_drp/configs-vni-1002'"

 ansible-playbook playbooks/no_scheduler_stage_2/3_configure_host.yml -i inventories/STAN-1/software-upgrade_inventory-vni-1002.yml -e "@playbooks/no_scheduler_stage_2/extra_vars.yml" -e "configs_dir='pim-to-ir_drp/configs-vni-1002'"


----
ansible-playbook playbooks/no_scheduler_stage_2/0_grab_show_run.yml -i inventories/STAN-1/hosts.yml -e "@playbooks/no_scheduler_stage_2/extra_vars.yml"
ansible-playbook playbooks/no_scheduler_stage_2/1_generate_configs.yml -i inventories/STAN-1/hosts.yml -e "@playbooks/no_scheduler_stage_2/extra_vars.yml"
ansible-playbook playbooks/no_scheduler_stage_2/2_checkpoint_config.yml -i inventories/STAN-1/software-upgrade_inventory.yml -e "@playbooks/no_scheduler_stage_2/extra_vars.yml"
ansible-playbook playbooks/no_scheduler_stage_2/3_configure_host.yml -i inventories/STAN-1/software-upgrade_inventory.yml -e "@playbooks/no_scheduler_stage_2/extra_vars.yml"
ansible-playbook playbooks/no_scheduler_stage_2/4_rollback_execute.yml -i inventories/STAN-1/software-upgrade_inventory.yml -e "@playbooks/no_scheduler_stage_2/extra_vars.yml"
