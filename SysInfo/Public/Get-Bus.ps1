﻿function Get-Bus {
<#
.SYNOPSIS

Gets the information of a physical bus as seen by a computer
running a Windows operating system.

.DESCRIPTION

Gets the information of a physical bus as seen by a computer
running a Windows operating system and converts all codes in
results into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.INPUTS

System.Array. Get-Bus can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-Bus returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-Bus

.EXAMPLE

PS C:\> Get-Bus -ComputerName Server1

.EXAMPLE

PS C:\> Get-Bus -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-Bus -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-Bus -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-Bus -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-Bus -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-Bus

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-Bus

.EXAMPLE

PS C:\> "Server1" | Get-Bus

.EXAMPLE

PS C:\> "192.168.0.5" | Get-Bus

.EXAMPLE

PS C:\> Get-Bus -ComputerName Server1 -Protocol DCOM

.LINK

https://www.sconstantinou.com/get-bus
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    $ClassName = 'Win32_Bus'

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    $Bus = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $Properties

    foreach ($_ in $Bus){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.BusType = Get-BusType ($_.BusType)
    }

    Write-Output $Bus
}