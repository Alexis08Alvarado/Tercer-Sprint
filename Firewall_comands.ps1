#!/usr/bin/pwsh 
param( 
  [string]$ip_firewall, 
  [string]$username, 
  [string]$password 
)
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false -Scope User -ParticipateInCEIP:$false | Out-Null 
New-SSHSession -ComputerName $ip_firewall -Credential $username $password | Out-Null
Invoke-SSHCommand -Index 0 -Command "show security flow session summary node primary"
