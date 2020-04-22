
# Setup script variables
aibTemplateFullName=${aibTemplateName}.json

aibDate=$(date +'%d-%m-%Y')
# JSON AIB Template published location
# ** must be available at runtime, so don't forget to commit & push any template changes first!
templateurl=https://raw.githubusercontent.com/timstockford/az_imagebuilder_templates/master/templates/$aibTemplateFullName
curl $templateurl -o $USR_TMPDIR/$aibTemplateFullName


sed -i -e "s/<subscriptionID>/$subscriptionID/g" $USR_TMPDIR/$aibTemplateFullName
sed -i -e "s/<rgName>/$aibResourceGroup/g" $USR_TMPDIR/$aibTemplateFullName
sed -i -e "s/<region>/$location/g" $USR_TMPDIR/$aibTemplateFullName
sed -i -e "s/<sigName>/$sigName/g" $USR_TMPDIR/$aibTemplateFullName
sed -i -e "s/<imageDefName>/$imageDefName/g" $USR_TMPDIR/$aibTemplateFullName
sed -i -e "s/<runOutputName>/$runOutputName/g" $USR_TMPDIR/$aibTemplateFullName
sed -i -e "s/<date>/$aibDate/g" $USR_TMPDIR/$aibTemplateFullName
sed -i -e "s/<aibTemplatePath>/$aibTemplateFullName/g" $USR_TMPDIR/$aibTemplateFullName
