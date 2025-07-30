# Quick/dirty script to update specific "Contact information" fields through the PowerShell/Microsoft Graph API
# Can be done interactively (one-by-one) or you can have it skim through a CSV file; This example uses a CSV file

# Import your CSV file and save it as a variable 
# Note: You could  pipe the output of Import-CSV directly into the "update" command, but it's risky to run a large change/update command without testing with a couple users; Sticking to a variable is safest IMO

# Enter FULL path of CSV file
$accounts = Import-CSV ""

# First log into/connect to the Office 365 Instance
Connect-MgGraph -Scopes "User.ReadWrite.All"

# Writing just the "Accounts" var lists the items as imported by the CSV
# THIS ASSUMES THE COLUMN HEADER IS CALLED 'Email'!!!
# Can change "JobTitle" to any property you want (reference: https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser?view=graph-powershell-1.0#updateexpanded)
$accounts | Update-MGSUser -UserID "$($_.Email)" -JobTitle "$($_.Title)"