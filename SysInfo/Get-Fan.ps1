﻿function Get-Fan {
    
    $Properties = ((Get-CimClass -ClassName Win32_Fan).CimClassProperties).Name

    $Fan = Get-CimInstance -ClassName Win32_Fan -Property $Properties | Select-Object -Property $Properties

    foreach ($_ in $Fan){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Write-Output $Fan
}