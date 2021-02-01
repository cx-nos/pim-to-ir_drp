# DRP per vni migration
1. `ansible-playbook playbooks/3_configure_host.yml -i inventories/INT/pim-to-ir_drp_inventory-vni_inventory-vni-<vni_number>.yml -e "@inventories/INT/extra_vars.yml" -e "configs_dir='pim-to-ir_drp/configs-vni-<vni_number>'"`
1. `ansible-playbook playbooks/3_configure_host.yml -i inventories/INT/software-upgrade_inventory-vni-<vni_number>.yml -e "@inventories/INT/extra_vars.yml" -e "configs_dir='pim-to-ir_drp/configs-vni-<vni_number>'"`

# Gracefull all vnis at once migration
1. `ansible-playbook playbooks/0_grab_show_run.yml -i inventories/INT/hosts.yml -e "@inventories/INT/extra_vars.yml" --ask-vault-pass`
1. `ansible-playbook playbooks/1_generate_configs.yml -i inventories/INT/hosts.yml -e "@inventories/INT/extra_vars.yml" --ask-vault-pass`
1. `ansible-playbook playbooks/2_checkpoint_config.yml -i inventories/INT/pim-to-ir_drp_inventory.yml -e "@inventories/INT/extra_vars.yml" --ask-vault-pass`
1. `ansible-playbook playbooks/3_configure_host.yml -i inventories/INT/pim-to-ir_drp_inventory.yml -e "@inventories/INT/extra_vars.yml" --ask-vault-pass`
1. `ansible-playbook playbooks/4_rollback_execute.yml -i inventories/INT/pim-to-ir_drp_inventory.yml -e "@inventories/INT/extra_vars.yml" --ask-vault-pass`

# Lab commands
1. `ansible-playbook playbooks/0_grab_show_run.yml -i inventories/STAN-1/hosts.yml -e "@inventories/STAN-1/extra_vars.yml"`
1. `ansible-playbook playbooks/0_show_version.yml -i inventories/STAN-1/hosts.yml -e "@inventories/STAN-1/extra_vars.yml"`
1. `ansible-playbook playbooks/1_generate_configs.yml -i inventories/STAN-1/hosts.yml -e "@inventories/STAN-1/extra_vars.yml"`
1. `ansible-playbook playbooks/2_checkpoint_config.yml -i inventories/STAN-1/pim-to-ir_drp_inventory.yml -e "@inventories/STAN-1/extra_vars.yml"`
1. `ansible-playbook playbooks/3_configure_host.yml -i inventories/STAN-1/pim-to-ir_drp_inventory.yml -e "@inventories/STAN-1/extra_vars.yml"`
1. `ansible-playbook playbooks/4_rollback_execute.yml -i inventories/STAN-1/pim-to-ir_drp_inventory.yml -e "@inventories/STAN-1/extra_vars.yml"`

# Preparation steps 
1. Notepad the intentory in cspcalpha host:
	* `nslookup SKO-DATA-AC-**<pod_number>** | grep Address | tail -n 1 >> **<pod_number>**-hosts.out`
	* `nslookup SKO-DATA-AG-**<pod_number>** | grep Address | tail -n 1 >> **<pod_number>**-hosts.out`
1. Notepad it to fit the ansible_host syntax:
	* `SKO-DATA-AC-XXX ansible_host=XXX`
1. Insert all lines in proper group in the inventories/INT/hosts file
1. Launch the general_analytics.py script with `show nve vni` from SKO-DATA-AC/AG-**<pod_number>** to grap all streched vni's
1. Get the list and insert it in inventories/INT/extra_vars.yml:
[**<pod_number>**]
vni_list:
...
1. Change the vni list in 1_per_vni_grabber.sh file 


