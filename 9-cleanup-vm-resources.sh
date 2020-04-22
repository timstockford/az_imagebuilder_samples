#!/bin/bash
# adapted from https://raw.githubusercontent.com/deltadan/az-cli-kung-fu/master/4-load-array-stop-vm.azcli


deletechoice=0

logc filtering resources with the following name: $vmName
JMESQuery="[?contains(name,'$vmName')].id"

#Load listFoo and create output file
echo -e "\e[31mThe following resources will be deleted!"
az resource list -g $aibResourceGroup --query $JMESQuery --output tsv

logc This script doesnt take nested resource dependancy sequencing in to account, and therefore may need to be run several times to remove all resources.
# confirmation required to delete resources
echo -e "\e[31mDo you wish to delete the above resources? (Select number)\e[0m"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) deletechoice=1; break;;
        No ) break;;
    esac
done


# if yes was selected
if [ $deletechoice -eq 1 ]
    
then
    logc deleting resources
    listFoo=$(az resource list -g $aibResourceGroup --query $JMESQuery --output tsv | sed "s/.*/& /" | tr -d '\n' | rev | cut -c 2- | rev)

    #Pass listFoo to the command and execute loop
    array=($listFoo)
    for res in "${array[@]}"
    do
        logc deleting $res
        az resource delete --ids "$res" --verbose
    done
fi

