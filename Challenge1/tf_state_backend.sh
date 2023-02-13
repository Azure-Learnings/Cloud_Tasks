#!/bin/bash
RESOURCE_GROUP_NAME=sumit-3-tier
STORAGE_ACCOUNT_NAME=tfstate$RANDOM
CONTAINER_NAME=3-tier-tfstate
# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location westeurope
# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob
# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME