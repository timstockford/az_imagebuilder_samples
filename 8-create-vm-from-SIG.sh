# setup SIG Image Version ResourceID
image="/subscriptions/$subscriptionID/resourceGroups/$aibResourceGroup/providers/Microsoft.Compute/galleries/$sigName/images/$imageDefName/versions/latest"

# generate vm name & password
vmName=$imageDefName$((10 + RANDOM % 99))
vmpassword="$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 20)"
vmuser=azureaibuser

logc VM Name: $vmName
logc VM Username: $vmuser
logc VM Password: $vmpassword

# create VM
logc creating VM
az vm create \
  --resource-group $aibResourceGroup \
  --name $vmName \
  --admin-username $vmuser \
  --image $image \
  --location $location \
  --admin-password $vmpassword

