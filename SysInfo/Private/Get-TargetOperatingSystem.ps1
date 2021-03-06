﻿Function Get-TargetOperatingSystem 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-TargetOperatingSystem -Code Value
      Converts code to the associated string value

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      System.Sting
  #>

  param ([Parameter(Mandatory = $true,HelpMessage = 'Code received from the system')][uint16]$Code)

  if ($Code -ne '')
  {
    switch ($Code){
      0 
      {
        'Unknown'
      }
      1 
      {
        'Other'
      }
      2 
      {
        'MACOS'
      }
      3 
      {
        'ATTUNIX'
      }
      4 
      {
        'DGUX'
      }
      5 
      {
        'DECNT'
      }
      6 
      {
        'Digital Unix'
      }
      7 
      {
        'OpenVMS'
      }
      8 
      {
        'HPUX'
      }
      9 
      {
        'AIX'
      }
      10 
      {
        'MVS'
      }
      11 
      {
        'OS400'
      }
      12 
      {
        'OS/2'
      }
      13 
      {
        'JavaVM'
      }
      14 
      {
        'MSDOS'
      }
      15 
      {
        'WIN3x'
      }
      16 
      {
        'WIN95'
      }
      17 
      {
        'WIN98'
      }
      18 
      {
        'WINNT'
      }
      19 
      {
        'WINCE'
      }
      20 
      {
        'NCR3000'
      }
      21 
      {
        'NetWare'
      }
      22 
      {
        'OSF'
      }
      23 
      {
        'DC/OS'
      }
      24 
      {
        'Reliant UNIX'
      }
      25 
      {
        'SCO UnixWare'
      }
      26 
      {
        'SCO OpenServer'
      }
      27 
      {
        'Sequent'
      }
      28 
      {
        'IRIX'
      }
      29 
      {
        'Solaris'
      }
      30 
      {
        'SunOS'
      }
      31 
      {
        'U6000'
      }
      32 
      {
        'ASERIES'
      }
      33 
      {
        'TandemNSK'
      }
      34 
      {
        'TandemNT'
      }
      35 
      {
        'BS2000'
      }
      36 
      {
        'LINUX'
      }
      37 
      {
        'Lynx'
      }
      38 
      {
        'XENIX'
      }
      39 
      {
        'VM/ESA'
      }
      40 
      {
        'Interactive UNIX'
      }
      41 
      {
        'BSDUNIX'
      }
      42 
      {
        'FreeBSD'
      }
      43 
      {
        'NetBSD'
      }
      44 
      {
        'GNU Hurd'
      }
      45 
      {
        'OS9'
      }
      46 
      {
        'MACH Kernel'
      }
      47 
      {
        'Inferno'
      }
      48 
      {
        'QNX'
      }
      49 
      {
        'EPOC'
      }
      50 
      {
        'IxWorks'
      }
      51 
      {
        'VxWorks'
      }
      52 
      {
        'MiNT'
      }
      53 
      {
        'BeOS'
      }
      54 
      {
        'HP MPE'
      }
      55 
      {
        'NextStep'
      }
      56 
      {
        'PalmPilot'
      }
      57 
      {
        'Rhapsody'
      }
      58 
      {
        'Windows 2000'
      }
      59 
      {
        'Dedicated'
      }
      60 
      {
        'VSE'
      }
      61 
      {
        'TPF (61)'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
