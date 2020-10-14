vni_list=(1001 1002 1003 1004)
ansible_exec='/usr/bin/ansible-playbook'
playbooks_dir='/home/cspc/ansible/playbooks/no_scheduler_stage_2'
inventory='/home/olvs/ansible/inventories/INT/hosts.yml'
extra_vars='/home/cspc/ansible/playbooks/no_scheduler_stage_2/extra_vars.yml'

for t in ${vni_list[@]}; do
  export ANSIBLE_HOST_KEY_CHECKING=False; $ansible_exec $playbooks_dir/1_generate_configs_per_vni.yml -i $inventory -e "@$extra_vars vni=$t"
done

