#! /usr/bin/env bash

d_com1="docker run -d --name"
d_com2="sleep 6000000"
d_com3="docker stop ubuntu centos7 fedora"

echo "Start all containers"
$d_com1 ubuntu pycontribs/ubuntu $d_com2
$d_com1 centos7 pycontribs/centos':'7 $d_com2
$d_com1 fedora pycontribs/fedora $d_com2

echo "Start play"
ansible-playbook site.yml -i inventory/prod.yml --ask-vault-pass

echo "Stop all containers"
$d_com3
