Credit: James Tyler (www.powershellengineer.com)
"Learn PowerShell in Less Than 2 Hours"
https://youtu.be/ZOoCaWyifmI

#cmdlet (Verb-Noun)
Write-Host "Hello World!"
Write-Host "Hello World!" -NoNewline

#Use Get-Command to find Cmdlets
Get-Command -CommandTyper Cmdlet

#PowerShell Modules
Get-Help *

#Get-Help (similar to man in Unix systems)
Get-Help Write-Host -Detailed
Get-Help Write-Host -Full

#Pipeline (piping - or combining - commands)
"May peace be with you!" | Out-File others.txt

#cat (reads the file)
cat .\others.txt

#rm (deletes the file)
rm .\others.txt

#Variables (i.e. container)
$FavCharacter = "jordan"
$FavCharacter #To Confirm

#Pipe a variable
$FavCharacter | Out-File favcharacter.txt

#Arithmetic with variables
$x = 5
$y = 3
$x + $y

#PowerShell Variable/Data Types
$FavCharacter = "" #{none}=string, 5=int32 "integer", 5.5=double "floating point", $true="boolean"   
$FavCharacter.GetType() #ensure variables get set correctly
$FavCharacter.Length
$FavCharacter | Select-Object -Property *

#Use Get-Member to get all of the different possible 'methods' of an object
Get-Member -InputObject $FavCharacter

#Arrays (a collection of variables evoked into one variable)
$Angel = @('Michael','Gabriel','Raphael')
$Angel
$Angel.GetType()                      
$Angel[0]
$DivineCouncil
$DivineCouncil = @{"Invitation" = "Gabriel"; "Invitation2" = "Michael"; "Guest" = "Lucifer"}
$DivineCouncil.GetEnumerator() | sort -Property value -descending                                                                       

#Hashtables
Write-Host "1. Yes"
Write-Host "2. No"
Write-Host "3. Sometimes"
Write-Host "4. (More grace please)"
$FavSystem =  Read-Host -Prompt "Are you resting?"

#If... then... else conditionals (part 1)
$Redemption = "901"
If ($Redemption -eq 901)
   { Write-Host "You have chosen well!" }  #if condition inside () is 'Redemption'  

#If... then... else conditionals (part 2)
$Redemption = "Redemption (CG)"
If ($Redemption -eq 'Redemption (CG)')  {
#if condition inside () is 'Redemption'
      Write-Host "You have chosen well!"
   } Else {
      Write-Host "You're a Redemption apprentice!"
   }  

#If... then... else conditionals (part 3)
$Redemption = 1
If($Redemption -ge 0 -and $Redemption -le 1) {
      Write-Host "This set was the Redemption (Alpha)"
}  Elseif ($Redemption -ge 1 -and $Redemption -le 3) {
      Write-Host "This set was the Redemption (Beta)"
}

#If... then... else conditionals (part 4)
$Redemption = 1
If($Redemption -ge 0 -and $Redemption -le 1) {
      Write-Host "This set was the Redemption (Alpha)"
}  Elseif ($Redemption -ge 1 -and $Redemption -le 3) {
      Write-Host "This set was the Redemption (Beta)"
}

#Switch Statements
$Redemption = "Magic"
Switch($Redemption) {
   "Magic" { Write-Host "Magic the Gathering!"; break }
   "D&D" { Write-Host "Dungeons & Dragons!"; break }
   "Diablo" { Write-Host "Diablo!"; break }
}
 
#Foreach Loops
$Redemption = @('Alpha','Beta','Standard')
Foreach ($Deck in $Redemption) {
   Write-Host $Deck "deck type format:"
}

#While Loops
$Disciples = @('Peter','James','John','Mary')
$counter = 0
While($counter -ne 4) {
      Write-Host $Disciples[$counter] "They were called!"
      $Disciples[$counter].Length
      $counter++;
}

#Do While Loops
$Disciples = @('Peter','James','John','Mary')
$counter = 0
Do {
   Write-Host $Disciples[$counter] "They were called!"
   $counter++
} While ($counter -ne 4)

#Defining Custom Functions
function Test-SpaceX {
   ping SpaceX.com
}
Test-SpaceX -PingCount 10

#Defining Custom Advanced Functions
function Test-SpaceX {
   [CmdletBinding()] #turns into adv. function
   param(
      [Parameter(Mandatory)]
      [int32]$PingCount 
   )
   Test-Connection spacex.com -Count $PingCount
}
Test-SpaceX

#Error Handling
function Test-SpaceX {
   [CmdletBinding()] #turns into adv. function
   param(
      [Parameter(Mandatory)]
      [int32]$PingCount 
   )
   Test-Connection spacex.com -Count $PingCount
   Write-Error -Message "It's a trap!" -ErrorAction Stop
}
try { Test-SpaceX -ErrorAction Stop } catch { Write-Output "Launch Problem!" Write-Output $_ }

#Create a file with New-Item
New-Item -path C:\Temp\vscode\thebook.txt -type "file" -value "thebook!"

#Create a folder with New-Item
New-Item -path C:\Temp\vscode\ -name "scrolls" -value "thewritings!"

#Copy/Move/Delete file with Copy-Item
Copy-Item C:\Temp\vscode\thebook.txt -destination C:\Temp\
Move-Item C:\Temp\thebook.txt -destination C:\Temp\vscode\
Remove-Item .\thebook.txt -force #(CD to current dir)

#Confirm if a file is there with Test-Path
Test-Path "C:\Temp\vscode\thebook.txt"

#Rename something with Rename-Item
Rename-Item -path .\thebook.txt -newname therevelation.txt

#Load AD Cmdlets with Import-Module ActiveDirectory
Import-Module ActiveDirectory

#Get user information with Get-ADUser
Get-ADUser jderamo
$user = Get-ADUser jdermao
$user
$user.DistinguishedName #CN, OU, DC...
$user.GivenName
$user.GivenName | Out-File followers.txt

#Change user information with Set-ADUser
Set-AdUser -Identity jdermao -SurName Doe

#Add a user to a group with Add-ADGroupNumber (*Turn on Advanced Features in AD)
Add-ADGroupMember -Identity Followers -Members -jderamo
Remove-ADGroupMember -Identity Followers -Members -jderamo

#Add a new user with New-ADUser
New-ADUser -Name "sderamo" -GivenName "S" -Surname "Deramo" -SamAccountName "sderamo" -UserPrincipalName "sderamo@news0ng.org" -Path "OU=Adminstration,OU=Staff,OU=news0ng,DC=news0ng,DC=org" -AccountPassword(ConvertTo-SecureString "news0ngmEMber1!" -AsPlainText -Force) -Enabled $true

#Reset a password of a user
Set-ADAccountPassword -Identity sderamo -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "news0ngmEMber1!" -force)
