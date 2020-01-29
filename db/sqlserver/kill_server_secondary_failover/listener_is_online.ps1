param(
        [string]$Server,
        [string]$AvailabilityGroup
    )
    $ErrorActionPreference = "Stop"
try{  
    # import sqlserver module
    import-module sqlserver    
    # retrieving the availability group listener name
    $SqlGetListener = "SELECT dns_name, port
    FROM sys.availability_group_listeners AS l
    INNER JOIN sys.availability_groups AS a ON l.group_id = a.group_id
    WHERE a.name = '$AvailabilityGroup'"
    $Listener = Invoke-SqlCmd -ServerInstance $Server -Database master -Query $SqlGetListener
    # testing connection to listener
    $Connected = Test-NetConnection -ComputerName $Listener.dns_name -Port $Listener.port
    # if TCP test returns true...return 0
    if($Connected.TcpTestSucceeded -eq $true){
        return 0
    }
    else{
        return 1
    }
}
catch{
    return 1
}