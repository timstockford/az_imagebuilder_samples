# Create RG
logc create resource group 
az group create -n $aibResourceGroup -l $location

# Create SIG & Image definition
logc create SIG
az sig create \
    -g $aibResourceGroup \
    --gallery-name $sigName

logc create SIG image definition
az sig image-definition create \
   -g $aibResourceGroup \
   --gallery-name $sigName \
   --gallery-image-definition $imageDefName \
   --publisher homeIT \
   --offer winsvr \
   --sku 2019 \
   --os-type Windows

# Create and assign role definition
logc create role definition
# Note: Role scoped to Resouce Group
az role definition create --role-definition $USR_TMPDIR/aibRoleImageCreation.json

logc grant role definition to the AIB SPN
az role assignment create \
    --assignee cf32a0cc-373c-47c9-9156-0db11f6a6dfc \
    --role "Azure Image Builder Service Image Creation Role" \
    --scope /subscriptions/$subscriptionID/resourceGroups/$aibResourceGroup


# staging storage account
#stagingStorageAcc=aibstagstor$(date +'%s')

#logc create storage account and blob in resource group
#az storage account create -n $stagingStorageAcc -g $aibResourceGroup -l $location --sku Standard_LRS