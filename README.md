# Azure VM Image Builder - Learning
Repo for code related to learning AIB

Custom learning.... 


# Milestone 3 - Use AIB via DevOps with a custom Image Template
- Manually Create custom AIB template definition and publish to new Resource Group
- Manually create custom image
- Manually provision VM from template to prove it works
- Add customisations to template:
  - Add BGInfo extension
  - Set Environment Variable to match Image version & definition used(? Or avail in AZ VM Portal?) 
  - Add Chocolatey
  - Add a software package?
    - (e.g. NotepadPlusPlus From Choco)
    - Azure DevOps Agent (PreConfigured)
- Use custom template in Devops pipeline
- Add Devops task to automatically create AIM Template first


- [Azure VM Image Builder - Learning](#azure-vm-image-builder---learning)
- [Milestone 3 - Use AIB via DevOps with a custom Image Template](#milestone-3---use-aib-via-devops-with-a-custom-image-template)
  - [Quick Start notes](#quick-start-notes)


## Quick Start notes
- Run code in Bash cloudshell
- Run each script in number order
- Using **2017-training** subscription: 51efccaf-6cf9-48be-b56e-67feab10aa68
  - Nb. Image Builder providers already registered in this subscription


