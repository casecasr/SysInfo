﻿function Get-RAMDisk {
<#
.SYNOPSIS

Gets the information about a RAM disk on a computer running on
a Windows operating system.

.DESCRIPTION

Gets the information about a a RAM disk on a computer running on
a Windows operating system and converts all codes in results into
human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.INPUTS

System.Array. Get-RAMDisk can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-RAMDisk returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-RAMDisk

.EXAMPLE

PS C:\> Get-RAMDisk -ComputerName Server1

.EXAMPLE

PS C:\> Get-RAMDisk -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-RAMDisk -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-RAMDisk -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-RAMDisk -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-RAMDisk -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-RAMDisk

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-RAMDisk

.EXAMPLE

PS C:\> "Server1" | Get-RAMDisk

.EXAMPLE

PS C:\> "192.168.0.5" | Get-RAMDisk

.LINK

https://www.sconstantinou.com/get-ramdisk
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    if ($ComputerName -eq ''){

        $RAMDisk = Get-LogicalDisk | Where-Object {$_.DriveType -eq 'RAM Disk'}
    }
    else{

        $RAMDisk = Get-LogicalDisk -ComputerName $ComputerName | Where-Object {$_.DriveType -eq 'RAM Disk'}
    }

    Write-Output $RAMDisk
}