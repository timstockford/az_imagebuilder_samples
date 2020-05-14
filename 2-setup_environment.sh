
# set your subscription (nb. defaults to current active subscription)
az account list -o table
echo Using active subscription
subscriptionID=$(az account show | grep id | tr -d '",' | cut -c7-)


# Release pipeline Deployment Environment
deployenv=dev


# Check if the directory does not exist and create
if [ ! -d "$HOME/tmp" ]
then
    echo "Creating $HOME/tmp"
    mkdir $HOME/tmp
fi
# Set User Based tmp folder to store temporary files
USR_TMPDIR=$HOME/tmp

#Console logging function (used in later scripts)
function logc() { echo -e "\e[92m$*\e[0m" ; }

# Setup environment variables
aibResourceGroup=${deployenv}-aibImageLibrary

# location of resource group
location=westeurope

# name of the Image Builder template name to use
# nb. without .json e.g. "aibTemplateSIGWin"
#aibTemplateName=aibTemplateSIGWinSample
aibTemplateName=aibTemplateSIGWinBase

# name of the shared image gallery, e.g. myCorpGallery
sigName=${deployenv}_vmImageLibrary

# Set image definition marketplace properties
 imageDefPublisher=HomeITWindowsServer
 imageDefOffer=2019-Datacenter
 imageDefSku=Base

# name of the image definition to be created, e.g. ProdImages
imageDefName=win2019base

# name of the image to be created
# imageName=aibCustomImgWini01

# image distribution metadata reference name
runOutputName=${imageDefName}ro
