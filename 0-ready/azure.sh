#! /bin/bash

az group create \
    --name sprint-RG \
    --location koreacentral


az vm create \
    --resource-group sprint-RG \
    --name sprint-jumpbox \
    --size Standard_D4s_v3 \
    --image Ubuntu2204 \
    --location koreacentral \
    --storage-sku Standard_LRS \
    --authentication-type password \
    --admin-username sprint \
    --admin-password password2024! \
    --public-ip-sku Standard \
    --custom-data cloud-init.txt

az vm open-port --resource-group sprint-RG --name sprint-jumpbox --port 80 --priority 110
az vm open-port --resource-group sprint-RG --name sprint-jumpbox --port 5000 --priority 120