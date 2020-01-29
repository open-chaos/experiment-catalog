param(
    [string]$Server
)

Get-Service -ComputerName $Server -Name MSSQLSERVER | Start-Service *>$null