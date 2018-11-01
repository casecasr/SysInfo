﻿function Get-Fan {
<#
.SYNOPSIS

Gets the properties of a fan device in the computer system.

.DESCRIPTION

Gets the properties of a fan device in the computer system
and converts all codes in results into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.INPUTS

System.Array. Get-Fan can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-Fan returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-Fan

.EXAMPLE

PS C:\> Get-Fan -ComputerName Server1

.EXAMPLE

PS C:\> Get-Fan -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-Fan -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-Fan -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-Fan -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-Fan -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-Fan

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-Fan

.EXAMPLE

PS C:\> "Server1" | Get-Fan

.EXAMPLE

PS C:\> "192.168.0.5" | Get-Fan

.EXAMPLE

PS C:\> Get-Fan -ComputerName Server1 -Protocol DCOM

.LINK

https://www.sconstantinou.com/get-fan
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    $ClassName = 'Win32_Fan'

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","DeviceID","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    $Fan = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $Properties

    foreach ($_ in $Fan){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Write-Output $Fan
}