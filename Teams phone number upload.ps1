# Quick/dirty script to mass-upload phone numbers to Microsoft Teams by CSV file
# Note: Teams requires US country code, so this will prepend '+1' to ALL numbers uploaded
# Also requires a Teams/Global Admin account

# Connect to MS Teams instance (requires 'MicrosoftTeams' pwsh module)
Connect-MicrosoftTeams

# CSV file with numbers and emails
$numbersEmails=(Import-csv '.\Downloads\userList.csv')

# Location ID could be grabbed by logging into Teams Admin > finding the "Locations" and copying the ID from the web address
$locationID='$TeamsLocationID'
$numbersEmails | %{Set-CsPhoneNumberAssignment -PhoneNumber $_.'Direct Number (DID)' -LocationId $locationID -Identity $_.Email}
$phoneType = 'CallingPlan'
$numbersEmails | %{Set-CsPhoneNumberAssignment -PhoneNumber $_.'Direct Number (DID)' -LocationId $locationID -Identity $_.Email -PhoneNumberType $phoneType}
$numbersEmails | %{Set-CsPhoneNumberAssignment -PhoneNumber "+1 $($_.'Direct Number (DID)')" -LocationId $locationID -Identity $_.Email -PhoneNumberType $phoneType -Verbose}