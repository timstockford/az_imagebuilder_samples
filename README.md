# Azure ImageBuilder (AIB) Templates

This project extends the basic samples provided in the AIB documentation with a variety of Azure Image Builder templates.

The scripts included in this project (when executed in order) should setup the necessary pre-requisities within Azure and deploy the necessary resources to build your template images.


It is based on the samples published at [@danielsollondon/azvmimagebuilder](https://github.com/danielsollondon/azvmimagebuilder)

- [Azure ImageBuilder (AIB) Templates](#azure-imagebuilder-aib-templates)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installing](#installing)
    - [Updating the scripts for your environment](#updating-the-scripts-for-your-environment)
  - [Contributing](#contributing)
  - [License](#license)
  - [Related Links](#related-links)
    - [You Tube Videos](#you-tube-videos)
  - [Acknowledgments](#acknowledgments)

## Getting Started

### Prerequisites

All the scripts in this Repo are Bash Shell scripts, and can be run in Azure Cloud Shell or run on your linux distro.

Note: The URL's to the Image Builder JSON templates are hardcoded to my repo, so make sure you modify the following scripts to point to your own repo:


### Installing

To use the scripts, just clone the git repo locally.
You can do this many ways, but I personally use git desktop

If you want to use these scripts on Azure cloud shell, as Git is installed by default, you can use the following command to clone the scripts to your clouddrive:

```
git clone https://github.com/timstockford/az_imagebuilder_templates ~/clouddrive/az_imagebuilder_templates

```
nb. cloned to "clouddrive" to ensure persistence of files between sessions, and for easier file manageda bility through Azure Portal.

See [Persist files in Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/persisting-shell-storage) for furhter information.


### Updating the scripts for your environment

Once you have cloned the scripts, they should work as-is.  However you may wish to make the following customisations:

 - **Subscription to be used**

Modify [1-register_image_builder.sh](1-register_image_builder.sh) & [2-setup_environment.sh](2-setup_environment.sh) and set the *subscriptionID* variable.

```
subscriptionID=$(az account show | grep id | tr -d '",' | cut -c7-)
```
This above code extracts the guid of the current active subscription, which is used by default

  - Template URL's
  
  By default it will use the templates located in the source repo.  Modify the *templateurl* variable in [3-create-aib-customrole-template.sh](3-create-aib-customrole-template.sh) & [5-modify-aib-image-template.sh](5-modify-aib-image-template.sh).
  ```
templateurl=https://raw.githubusercontent.com/timstockford/az_imagebuilder_templates/master/templates/aibRoleImageCreation.json
```

 - **Resource & Image naming**
 
 Most of the variables used by the scripts are contained within [2-setup_environment.sh](2-setup_environment.sh).  These can be modified as desired, and shouldn't impact any of the other scripts.

 - **VM Naming**
 The main thing to be carfeul is that if using [6-createimage.sh](6-createimage.sh) to create the VM, the virtual machine name doesn't inadvertatnly end up longer than 15 chars (otherwise the vm creation will fail).  The VM name is generated based on the template name and two random digits.  This can be adjusted by modifying the *vmName* variable 
 ```
vmName=$imageDefName$((10 + RANDOM % 99))
```

## Contributing

Please feel free to raise an issue on Github if you have any corrections or suggested improvements, or alternatively submit a pull request with your updates.

## License

This project is licensed under the MIT License - see the [LICENSE.md](./LICENSE.md) file for details

## Related Links

- Azure Docs: https://aka.ms/azvmimagebuilder
- Quick Starts: https://aka.ms/azvmimagebuilderdemos
- End to End Solutions with Image Builder: https://aka.ms/azvmimagebuildersolns
- Feedback: https://aka.ms/aibfeedback

### You Tube Videos
- [Introduction to the Azure VM Image Builder](https://youtu.be/nalr2rHRDew)
- [Create a Custom VM Image Pipeline with Azure VM Image Builder and Azure DevOps](https://youtu.be/lqIA0VHe5Do)


## Acknowledgments

* [@danielsollondon](https://github.com/danielsollondon) - For his great documentation and working examples for Azure Image Builder
* [@PurpleBooth](https://gist.github.com/PurpleBooth) for the [README.md Template](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
* Hat tip to anyone whose code was used
* etc
