vni_list=(2010032 2010054 2011030 2211155 2211156 2211157 2211163 2211164 2640702 2640704 2640714 8013270 8071521 8163854 8990996 8990997 8990998 8990999 9012216 9013248 9013250 9033522 9063820 9072916 9072926 9073948 9140173 9161198 9161987 9640157 9640503 9640505 9640537 9640539 9640563 9640571 9640587 9640645 9640651 9640655 9990132)
env='INT'

ansible_exec='/usr/bin/ansible-playbook'
playbooks_dir='/home/cspc/ansible/pim-to-ir_drp/playbooks'
inventory='/home/cspc/ansible/pim-to-ir_drp/inventories/'${env}'/hosts.yml'
extra_vars='/home/cspc/ansible/pim-to-ir_drp/inventories/'${env}'/extra_vars.yml'

for t in ${vni_list[@]}; do
  export ANSIBLE_HOST_KEY_CHECKING=False; $ansible_exec $playbooks_dir/1_generate_configs_per_vni.yml -i $inventory -e "@$extra_vars" -e "vni=$t"
done

