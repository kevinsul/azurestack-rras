param
    (
        [Parameter(Mandatory=$true)]
        [String] $TargetRRASIP,

        [String] $TargetIPRange
        
    )

$TargetIPRange = $TargetIPRange + ':100'

Install-WindowsFeature Routing -IncludeManagementTools

Install-RemoteAccess -VpnType VpnS2S

sleep 10

Add-VpnS2SInterface -Name "remote" $TargetRRASIP -Protocol IKEv2 -AuthenticationMethod PSKOnly -SharedSecret "ilovestack!" -IPv4Subnet $TargetIPRange 

Set-VpnS2SInterface remote -InitiateConfigPayload $false

