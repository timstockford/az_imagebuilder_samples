

templateurl=https://raw.githubusercontent.com/timstockford/az_imagebuilder_templates/master/templates/aibRoleImageCreation.json
curl $templateurl -o $USR_TMPDIR/aibRoleImageCreation.json

# update the definition
sed -i -e "s/<subscriptionID>/$subscriptionID/g" $USR_TMPDIR/aibRoleImageCreation.json
sed -i -e "s/<rgName>/$aibResourceGroup/g" $USR_TMPDIR/aibRoleImageCreation.json

logc Customised $USR_TMPDIR/aibRoleImageCreation.json

