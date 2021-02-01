vni_list=(2010025 2030061 2030062 2040037 2040038 2040039 2041140 2041141 2041142 2041143 2041144 2041145 2041146 2041147 2041148 2041149 2041150 2041151 2041152 2041153 2041154 2041155 2041156 2041157 2041158 2041159 2041160 2041161 2041162 2041163 2211094 2211095 2211096 2211097 2211098 2211099 2642267 8010016 8011126 8013002 8013253 8013254 8013266 8013274 8013276 8013277 8013281 8013282 8013401 8161321 8161322 8161792 8161793 9012203 9012208 9012218 9012224 9012226 9012278 9012280 9012293 9012295 9012296 9012298 9012299 9013005 9013006 9013204 9013210 9013214 9013226 9013238 9013248 9013250 9032546 9032552 9033016 9033526 9033530 9033538 9033540 9033804 9042640 9063818 9063820 9063822 9063824 9063826 9063828 9072928 9072958 9073010 9073011 9073938 9073940 9073948 9073950 9081102 9081502 9130176 9140173 9140980 9140981 9140982 9140983 9140987 9140988 9151978 9160169 9160269 9161311 9161323 9161610 9161611 9161618 9161987 9161988 9171624 9171626 9171627 9181036 9391798 9640004 9640111 9640172 9640500 9640501 9640502 9640503 9640504 9640506 9640508 9640509 9640510 9640512 9640514 9640516 9640517 9640518 9640519 9640525 9640527 9640531 9640537 9640539 9640541 9640571 9640587 9640645 9640671 9640677 9641100 9642222 9643216 9643218 9643228 9643230 9643232 9643234 9643240 9643242 9643244 9643246 9643344 9643346 9643542 9643936 9643944 9643946)
env='INT'
path='/home/olvs/ansible/pim-to-ir_drp'

ansible_exec='/usr/bin/ansible-playbook'
playbooks_dir=''${path}'/playbooks'
inventory=''${path}'/inventories/'${env}'/hosts.yml'
extra_vars=''${path}'/inventories/'${env}'/extra_vars.yml'

for t in ${vni_list[@]}; do
  export ANSIBLE_HOST_KEY_CHECKING=False; $ansible_exec $playbooks_dir/1_generate_configs_per_vni.yml -i $inventory -e "@$extra_vars" -e "vni=$t"
done

