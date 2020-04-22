
# set your subscription (nb. defaults to current active subscription)
az account list -o table
echo Using active subscription
subscriptionID=$(az account show | grep id | tr -d '",' | cut -c7-)

az feature register --namespace Microsoft.VirtualMachineImages --name VirtualMachineTemplatePreview

az feature show --namespace Microsoft.VirtualMachineImages --name VirtualMachineTemplatePreview | grep state

# register and enable for shared image gallery
az feature register --namespace Microsoft.Compute --name GalleryPreview
az feature show --namespace Microsoft.Compute --name GalleryPreview | grep state

# wait until it says registered

# check you are registered for the providers
az provider show -n Microsoft.VirtualMachineImages | grep registrationState
az provider show -n Microsoft.Storage | grep registrationState
az provider show -n Microsoft.Compute | grep registrationState
az provider show -n Microsoft.KeyVault | grep registrationState


echo "Run this if VirtualMachinesImages provider not registered"
echo "az provider register -n Microsoft.VirtualMachineImages"
echo "Monitor with: az provider show -n Microsoft.VirtualMachineImages | grep State"
echo ""
echo "It may take a few minutes for the VirtualMachineTemplatePreview provider to be registered too"
echo "Monitor with az feature show --namespace Microsoft.VirtualMachineImages --name VirtualMachineTemplatePreview | grep state"
echo ""
echo "To monitor the GalleryPreview status run: az feature show --namespace Microsoft.Compute --name GalleryPreview | grep state"
echo ""
echo ""
echo ""
echo "Once the feature 'VirtualMachineTemplatePreview' is registered, invoking 'az provider register -n Microsoft.VirtualMachineImages' is required to get the change propagated"
echo "Once the feature 'GalleryPreview' is registered, invoking 'az provider register -n Microsoft.Compute' is required to get the change propagated"