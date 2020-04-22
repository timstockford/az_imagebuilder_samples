
# TODO: Add detection to determine if role already exists

# download preconfigured template
# Template Copied from https://raw.githubusercontent.com/danielsollondon/azvmimagebuilder/master/solutions/12_Creating_AIB_Security_Roles/aibRoleImageCreation.json
templateurl=https://raw.githubusercontent.com/timstockford/az_imagebuilder_samples/master/samples/3_Create_DevOps_With_Custom_Template/templates/aibRoleImageCreation.json
curl $templateurl -o $USR_TMPDIR/aibRoleImageCreation.json

# update the definition
sed -i -e "s/<subscriptionID>/$subscriptionID/g" $USR_TMPDIR/aibRoleImageCreation.json
sed -i -e "s/<rgName>/$aibResourceGroup/g" $USR_TMPDIR/aibRoleImageCreation.json

logc Customised $USR_TMPDIR/aibRoleImageCreation.json

