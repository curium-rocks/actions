#!/bin/bash
json_str=$1
for row in $(echo "${json_str}" | jq -r '.[] | @base64'); do
    _jq() {
     echo ${row} | base64 --decode | jq -r ${1}
    }
   echo $(_jq '.hostname')  ansible_connection=$(_jq '.connection') ansible_user=$(_jq '.username')
done

echo ''
echo '[services]'
for row in $(echo "${json_str}" | jq -r '.[] | @base64'); do
    _jq() {
     echo ${row} | base64 --decode | jq -r ${1}
    }
   echo $(_jq '.hostname')  ansible_connection=$(_jq '.connection') ansible_user=$(_jq '.username')
done