param(
        [string]$Server,
        [string]$ListenerName,
        [int]$Port
    )
    $ErrorActionPreference = "Stop"
try{  
        # testing connection to listener
    $Connected = Test-NetConnection -ComputerName $ListenerName -Port $Port
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