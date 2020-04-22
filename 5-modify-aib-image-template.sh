
# Setup script variables
aibTemplateFullName=${aibTemplateName}.json

aibDate=$(date +'%d-%m-%Y')
# download the example and configure it with your vars
# curl https://raw.githubusercontent.com/danielsollondon/azvmimagebuilder/master/quickquickstarts/10_Creating_a_Custom_Windows_Managed_Image/helloImageTemplateWin.json -o helloImageTemplateWin.json
templateurl=https://raw.githubusercontent.com/timstockford/az_imagebuilder_samples/master/samples/3_Create_DevOps_With_Custom_Template/templates/$aibTemplateFullName
curl $templateurl -o $USR_TMPDIR/$aibTemplateFullName


sed -i -e "s/<subscriptionID>/$subscriptionID/g" $USR_TMPDIR/$aibTemplateFullName
sed -i -e "s/<rgName>/$aibResourceGroup/g" $USR_TMPDIR/$aibTemplateFullName
sed -i -e "s/<region>/$location/g" $USR_TMPDIR/$aibTemplateFullName
sed -i -e "s/<sigName>/$sigName/g" $USR_TMPDIR/$aibTemplateFullName
sed -i -e "s/<imageDefName>/$imageDefName/g" $USR_TMPDIR/$aibTemplateFullName
sed -i -e "s/<runOutputName>/$runOutputName/g" $USR_TMPDIR/$aibTemplateFullName
sed -i -e "s/<date>/$aibDate/g" $USR_TMPDIR/$aibTemplateFullName
sed -i -e "s/<aibTemplatePath>/$aibTemplateFullName/g" $USR_TMPDIR/$aibTemplateFullName
