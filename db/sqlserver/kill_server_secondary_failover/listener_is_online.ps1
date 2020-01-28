param($Server,$AvailabilityGroup) # parameter to set the primary node and availability group names

# retrieving the availability group listener name
$SqlGetListener = "SELECT dns_name, port
FROM sys.availability_group_listeners AS l
INNER JOIN sys.availability_groups AS a ON l.group_id = a.group_id
WHERE a.name = '$AvailabilityGroup'"

$Listener = Invoke-SqlCmd -ServerInstance $Server -Database master -Query $SqlGetListener

# testing connection to the listener
$Connected = Test-NetConnection -ComputerName $Listener.dns_name -Port $Listener.port
