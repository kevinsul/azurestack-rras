# azurestack-rras

***This template is intended for use in and Azure Stack environment.***

The purpose of this template is to demonstrate the ability to interconnect two Azure Stack VNets to one another within the same Azure Stack environment.  It is currently not possible to inteconnect Azure Stack VNets to one another using the built-in Virtual Network Gateway:  https://docs.microsoft.com/en-us/azure-stack/user/azure-stack-network-differences.  Support for this is coming soon but for now one must use NVA appliances to create a VPN tunnel between two Azure Stack VNets.  In this template, two Windows Server 2016 VMs are deployed with RRAS installed.  The two RRAS servers are configured to implement a S2SVPN IKEv2 tunnel between two VNETs.  The appropriate NSG and UDR rules are created to allow routing between the subents on each VNET designated as 'internal'.  

![alt text](https://github.com/kevinsul/azurestack-rras/blob/master/stack-rras1.JPG)

Requirements:

- ASDK or Azure Stack Integrated System with latest updates applied.
- Required Azure Stack Marketplace items:
    -  Windows Server 2016 Datacenter (latest build recommended)
    -  Custom Script Extension
    
The only parameters this template requires is for naming the Administrator account for the RRAS servers and password for the Administrator accounts.  If you wish to provide custome values for the VNET IP ranges, subnets, names, etc., the variables (and in some cases explicit values within the various sections of the template) within the template can be modified accordingly.  Be careful to keep these values within legal ranges as deployment may fail.

Also note the custom powershell script that is executed via the customer script extension on each RRAS VM.  This script installs RRAS and all required dependent services and features, and configures the IKEv2 IPSec tunnel between the two RRAS servers with a shared key.
