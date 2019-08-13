#!/usr/bin/pwsh 
param( 
  [string]$ip_firewall, 
  [string]$username, 
  [string]$password 
)
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false -Scope User -ParticipateInCEIP:$false | Out-Null 
Connect-VIServer -Server $ip_firewall -Protocol https -User $username -Password $password | Out-Null

