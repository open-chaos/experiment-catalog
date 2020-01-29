param(
    [string]$Server
)

Get-Service -ComputerName $Server -Name MSSQLSERVER | Stop-Service -Force *>$null