$user = "auto"
$pass = "C4nv14%%19"
$maxlimit = 100000
$secstr = New-Object -TypeName System.Security.SecureString
$pass.ToCharArray() |  ForEach-Object {$secstr.AppendChar($_)}
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $user, $secstr
New-SSHSession -ComputerName 10.222.31.223 -Credential $cred | Out-Null
$sessions = Invoke-SSHCommand -Index 0 -Command "show security flow session summary node primary" | Select-Object -Property Output -ExpandProperty Output | Select-String -Pattern "Sessions-in-use"
$arreg = $sessions -split ' '
# $arreg[1]
if ($arreg[1] -gt $maxlimit) {
    Write-Host clear security flow session interface reth0.0
    Write-Host clear security flow session interface reth5.0
}else{
    Write-Host El numero de sesiones actuales es $arreg[1]
}

 