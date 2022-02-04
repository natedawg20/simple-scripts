<# 
	Interfacing with the [console] cmdlet, this script performs a 'system beep' with a pitch between 750 and 1500, and the time span is between .25 and 6 seconds
#>
Write-Host "Starting 'Troublemaker'... ;-)"
Start-Sleep -Seconds 2
Start-Process -WindowStyle Hidden powershell.exe '
    $HOST.UI.RawUI.WindowTitle="Troublemaker : ] "
    while($true)
    {
	    write-Host -ForegroundColor green "Beep"
	    [console]::beep((get-random -Minimum 750 -Maximum 1500),500)
	    start-sleep -Seconds (Get-Random -Minimum .25 -Maximum 6)
    }
'