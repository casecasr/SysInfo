﻿function Get-NetworkDrive {
<#
.SYNOPSIS

Gets the information about a network drive on a computer
system running Windows.

.DESCRIPTION

Gets the information about a network drive on a computer
system running Windows and converts all codes in results
into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.INPUTS

System.Array. Get-NetworkDrive can accept a string value
to determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-NetworkDrive returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-NetworkDrive

.EXAMPLE

PS C:\> Get-NetworkDrive -ComputerName Server1

.EXAMPLE

PS C:\> Get-NetworkDrive -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-NetworkDrive -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-NetworkDrive -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-NetworkDrive -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-NetworkDrive -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-NetworkDrive

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-NetworkDrive

.EXAMPLE

PS C:\> "Server1" | Get-NetworkDrive

.EXAMPLE

PS C:\> "192.168.0.5" | Get-NetworkDrive

.EXAMPLE

PS C:\> Get-NetworkDrive -ComputerName Server1 -Protocol DCOM

.LINK

https://www.sconstantinou.com/get-networkdrive
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    $NetworkDrive = Get-LogicalDisk -ComputerName $ComputerName -Protocol $Protocol | Where-Object {$_.DriveType -eq 'Network Drive'}

    Write-Output $NetworkDrive
}