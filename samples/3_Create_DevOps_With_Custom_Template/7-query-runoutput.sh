
logc show image generation run output
az resource show \
        --ids "/subscriptions/$subscriptionID/resourcegroups/$aibResourceGroup/providers/Microsoft.VirtualMachineImages/imageTemplates/$aibTemplateName/runOutputs/$runOutputName"  \
        --api-version=2019-05-01-preview
