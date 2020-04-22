
# update/upgrade of image templates not currently supported
logc delete existing template image if it already exists
az image builder delete -g $aibResourceGroup -n $aibTemplateName

logc submit the image confiuration to the VM Image Builder Service
logc This may take 1-3mins
az resource create \
    --resource-group $aibResourceGroup \
    --properties @$USR_TMPDIR/$aibTemplateFullName \
    --is-full-object \
    --resource-type Microsoft.VirtualMachineImages/imageTemplates \
    -n $aibTemplateName
# wait approx 1-3mins, depending on external links

# start the image build
logc This will take approx 15-30 mins (varies by region)
az resource invoke-action \
     --resource-group $aibResourceGroup \
     --resource-type  Microsoft.VirtualMachineImages/imageTemplates \
     -n $aibTemplateName \
     --action Run 

# wait approx 15mins