{ PS 25: PowerShell Basic & Automation Course }

Credit:
   James Tyler (www.powershellengineer.com)
Resources:
   "Learn PowerShell in Less Than 2 Hours" (https://youtu.be/ZOoCaWyifmI)
   "AZ-040T00" https://learn.microsoft.com/en-us/training/courses/az-040t00

***Special Announcement: (https://m-lp.co/jashvik)***

#Pre-requisites
   -Run PS ISE in Administrator Mode
   -Update-Help #Downloads the newest help files for PowerShell modules
   -Install seperate PS pacakge #https://aka.ms/powershell-release?tag=stable

#Check PS Version
$PSVersionTable.PSVersion

#ExecutionPolicy
Get-ExecutionPolicy
Set-ExecutionPolicy RemoteSigned #or Restricted (needed to run scripts on local/servers)

#Ping
ping udemy.com

#Comment: line of code that is not executed (Important for notes and instructions)

#cmdlet (Verb-Noun)
Write-Host "Hello World!"
Write-Host "Hello World!" -NoNewline
"Hello World!" | Out-File C:\Temp\vscode\hello_world.ps1

#Use Get-Command to find Cmdlets
   #Cmdlets are native PowerShell commands, not stand-alone executables. Cmdlets are collected into PowerShell modules that can be loaded on demand
Get-Command -CommandType Cmdlet

#PowerShell Modules
Get-Help *

#Get-Help (similar to man in Unix systems)
Get-Help Write-Host -Detailed
Get-Help Write-Host -Full

#Pipeline (piping - or combining - commands)
"Be kind to each other!" | Out-File others.txt

#cat (reads the file)
cd C:\temp\vscode\
cat .\hello_world.ps1

#rm (deletes the file)
rm .\others.txt

#Create/invoke a variable (i.e. 'containers')
$FavCharacter = "jordan"
$FavCharacter #To Confirm

#Pipe a variable
$FavCharacter | Out-File favcharacter.txt
ls #list directory

#PowerShell variable/data types
$FavCharacter = "" #{none}=string, 5=int32 "integer", 5.5=double "floating point", $true="boolean"   
$FavCharacter.GetType() #ensure variables get set correctly

#Arithmetic with variables
$x = 5
$y = 3
$x + $y

#Error
$x * $FavCharacter

$FavCharacter.Length
$FavCharacter | Select-Object -Property * #string only provides length properties

#NOTE: everything in PS is an object (Ex. bike 'class': wheel, brakes, etc. are properties)

#Use Get-Member to get all different 'methods' of an object
Get-Member -InputObject $FavCharacter

#Arrays (a collection of variables evoked into one variable)
$Angel = @('Michael','Gabriel','Raphael')
$Angel
$Angel.GetType()
$Angel[0] #add to each line-item
$Angel[1].Length

#Hashtables
$BigCats
$BigCats = @{"Feline" = "Lions", "Tigers", "Jaguars"}
$BigCats.Feline += "Leopards" #(for single line hash; +/- to add or remove)
$BigCats.Add("Canine", "Lynx") #BARD: Add an additional property name called Feline, with a property value of Leopards to a hashtable named $BigCats
$BigCats.Set_Item("Canine", "Coyote")
$BigCats.GetEnumerator() | Sort-Object -Property name #default is ascending
$BigCats.GetEnumerator() | sort -Property value -descending
$BigCats.Remove("Feline")

#Collecting user input with Read-Host
Read-Host #sets a variable and waits for input
$FavSystem = Read-Host -Prompt "What is your favorite new Action Movie?" #great way to save input for later

   #Favorite movie cmdlet:
   Write-Host "What is your favorite new Action Movie?"
   Write-Host "1. RRR"
   Write-Host "2. Ponniyin Selvan: I"
   Write-Host "3. Jalsa"
   Write-Host "4. (I don't like Action Movies)"
   $FavSystem =  Read-Host -Prompt "What is your favorite new Action Movie?"

#If... then... else conditionals (if switch)
$ActionMovies = "RRR" #or numeric 999
If ($ActionMovies -eq "RRR")
   { Write-Host "You have chosen well!" }  #if condition inside () is 'ActionMovies'  

#If... then... else conditionals (else switch)
$ActionMovies = "Ponniyin Selvan: I"
If ($ActionMovies -eq 'Ponniyin Selvan: I')  {
#if condition inside () is 'ActionMovies'
      Write-Host "You have chosen well!"
   } Else { #if above condition isn't met
      Write-Host "You're on the right track!"
   }  

#If... then... else conditionals (elseif switch)
$ActionMovies = 3
If($ActionMovies -ge 0 -and $ActionMovies -le 1) { #greater than and less than
      Write-Host "RRR was the best Action Movie"
}  Elseif ($ActionMovies -ge 1 -and $ActionMovies -le 3) {
      Write-Host "RRR was not the best Action Movie"
}

#Switch Statements
$ActionMovies = "RRR"
Switch($ActionMovies) {
   "RRR" { Write-Host "Action Drama!"; break }
   "Ponniyin Selvan: I" { Write-Host "Epic Journey!"; break } #po-neean sellvan
   "Jalsa" { Write-Host "Thriller!"; break }
}

#For Loops
   #The For loop is а counting loop, and it's mostly used when you need to repeat a task a certain number of times, process a collection, or specify items by an index number.
$MovieGenre = @('Action','Drama','Comedy','Thriller')
For($counter =0;$counter -le 3;$counter++){ #forloops of four different conditions; first element is 0 or 'Action'; #counter takes value and adds +; #$counter = $counter + 1;
   Write-Host "The best movie genre, is" $MovieGenre[$counter]
} 

#Foreach Loops
   #The foreach statement (also known as a foreach loop) is a language construct for stepping through (iterating) a series of values in a collection of items.
$ActionMovies = @('RRR','Ponniyin Selvan: I','Jalsa')
Foreach ($Title in $ActionMovies) {
   Write-Host $Title "is the best action movie of the year?"
}

#While Loops
   #The while statement (also known as a while loop) is a language construct for creating a loop that runs commands in a command block as long as a conditional test evaluates to true.
$Disciples = @('Peter','James','John','Mary')
$counter = 0
While($counter -ne 4) {
      Write-Host $Disciples[$counter] "was called!"
      $Disciples[$counter].Length #invoke elements of array with counter
      $counter++; #infinite while loop if conditions aren't met
}

#Do While Loops
   #In a Do-While loop, the condition is evaluated after the script block has run. As in a While loop, the script block is repeated as long as the condition evaluates to true.
$Disciples = @('Peter','James','John','Mary')
$counter = 0
Do {
   Write-Host $Disciples[$counter] "was called!"
   $counter++
} While ($counter -ne 4)

#Defining Custom Functions
function Test-SpaceX { #tests if SpaceX if responding to pings
   ping SpaceX.com
}

#Test-Connection with PingCount
function Test-SpaceX { #tests if SpaceX if responding to pings
   param(
      $PingCount
   )
   Test-Connection spacex.com -Count $PingCount #test connection vs. ping
}
Test-SpaceX -PingCount 10

#Defining Custom Advanced Functions
function Test-SpaceX {
   [CmdletBinding()] #turns into adv. function
   param( #defines custom parameter inside the function
      [Parameter(Mandatory)]
      [int32]$PingCount 
   )
   Test-Connection spacex.com -Count $PingCount #connection is an object parameter
}
Test-SpaceX

#Error Handling
Throw "It's a trap!"

#Tri-catch!
function Test-SpaceX {
   [CmdletBinding()] #turns into adv. function
   param(
      [Parameter(Mandatory)]
      [int32]$PingCount 
   )
   Test-Connection spacex.com -Count $PingCount #enter count
   Write-Error -Message "It's a trap!" -ErrorAction Stop
}
try { Test-SpaceX -ErrorAction Stop } catch { Write-Output "Launch Problem!" Write-Output $_ } #if error action occurs, catch it, and per syntax write output of error actions; $_. is a variable or placeholder, .dot command introduces a property

#Create a file with New-Item
New-Item -path C:\Temp\vscode\scrolls.txt -type "file" -value "scrolls"

#Create a folder with New-Item
New-Item -path C:\Temp\vscode\ -name "TheBook" -type directory

#Copy/Move/Delete file with Copy-Item
Copy-Item C:\Temp\vscode\scrolls.txt -destination C:\Temp\vscode\TheBook
Move-Item C:\Temp\vscode\scrolls.txt -destination C:\Temp\vscode\TheBook
Remove-Item C:\Temp\vscode\TheBook\scrolls.txt -force

#Confirm if a file is there with Test-Path
Test-Path "C:\Temp\vscode\scrolls.txt"
Test-Path "C:\Temp\vscode\TheBook\scrolls.txt"

#Rename something with Rename-Item
Rename-Item -path .\scrolls.txt -newname therevelation.txt

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

#Unit 3 - Automation with PowerShell

#Create a Scheuled Tasks
$trigger = New-ScheduledTaskTrigger -At 12pm -Daily
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File `"C:\temp\vscode\meditate.ps1`""
$settings = New-ScheduledTaskSettingsSet
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "Meditate" -Description "Daily meditation reminder" -Settings $settings

#View Scheduled Tasks
Get-ScheduledTask
Get-ScheduledTask -TaskName "Meditate" | Get-ScheduledTaskInfo

#Remove Scheduled Tasks
   #Help ScheduledTask
Unregister-ScheduledTask -TaskName "Meditate" -Confirm:$false

#Scheduled Jobs
Get-ScheduledJob -Name "Meditate"

Get-ScheduledJob -Name "Meditate" | Get-JobTrigger

Get-ScheduledJob -Name "Meditate*" | select Name,State

Unregister-ScheduleJob -name "Meditate"

$trigger = New-JobTrigger -Daily -At 12
$scriptblock = { C:\temp\vscode\meditate.ps1 }
Register-ScheduledJob -Name "Meditate" -ScriptBlock $Scriptblock -Trigger $trigger

#Unit 4 - AI & Automation in Focus
    #ChatGPT/BARD: Write a PowerShell script that searches Windows event logs for anything related to the print spooler service and exports that information to a log file at C:\temp\vscode\spooler-log.txt
    
    #Key: look for patterns

    $events = Get-EventLog -LogName "Microsoft-Windows-PrintService" -Source "Spooler" | Select-Object -Property *

    $events | Export-Csv -Path C:\temp\vscode\spooler-log.txt -NoTypeInformation
    
    #ChatGPT/BARD: Use for Error-Reporting and Debugging!
