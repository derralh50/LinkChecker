<#  
.SYNOPSIS  
    A PowerShell Script that checks outgoing links on a webpage.  
.DESCRIPTION  
    This PowerShell script uses the cmdlet Invoke-WebRequest -Uri <'some url'> then filters the data to
    create a list of all outgoing http://www* and https://* links, then iterates the addresses in
    the list using Invoke-WebRequest -Uri returning a status description  of OK or Broken Link.  
.NOTES  
    File Name  : LinkChecker.ps1  -   Version 1.0.1
    Author     : Derral Wayne Hunt - dhunt@huntwebdev.com  
    Requires   : PowerShell V-1.0 or higher  
.LINK
#>

#Notes: Version 1.0.0 checks outgoing http and https links.
#Before running this script make a directory named LinkChecker
#In user's drive, copy LinkChecker.ps1 there.
#Notes: Version 1.0.1 adds red color to broken link and Invalid Web Address.  Removes white space from output.

Clear-Host

Write-Host 'LINK CHECKER'
Write-Host 'A PowerShell Utility'
Write-Host 'For Checking Outgoing Webpage Links'
Write-Host "`n"
Write-Host 'Valid Website Address = [ http://domain name.domain extension ] or [ https ]'
Write-Host 'Valid Website Address = [ http://www.domain name.domain extension ] or [ https ]'
Write-Host 'Valid Website Address = [ www.domain name.domain extension ]'
Write-Host "`n"

$Url = Read-Host 'Enter a valid web address'
Write-Host "`n"

try{
    $Results = (Invoke-WebRequest -Uri $Url).Links | Select-Object href > $env\LinkChecker\Results.txt
    $Links_strings = Get-Content $env\LinkChecker\Results.txt
    $Adjusted = ($Links_strings[3 .. ($Links_strings.length - 3)])
}
catch{  
    Write-Host 'Not a valid web address' -Fore Red
    Write-Host "`n"
    #Time delay.
    for ($i=1; $i -le 3500000; $i++){}
    Invoke-Expression $env/LinkChecker/LinkChecker.ps1
}




$OutLinks = $Adjusted | where{$_ -match 'http://www.*' -and 'https://*'}


for($i=0; $i -le $OutLinks.length - 1; $i++){
try {     
     $Request = (Invoke-WebRequest -Uri ($OutLinks[$i]))
     $Stat = $Request.StatusDescription
     #Write-Host "`n"
     Write-Host $OutLinks[$i], $Stat
}
catch {
    Write-Host $OutLinks[$i] -Fore Red
    'Broken Link' 
}}


#Note: Reset file and variables
Out-File $env:user\LinkChecker\Results.txt
$Null = " "
$Results = $Null
$Links_strings = $Null
$Adjusted = $Null
$OutLinks = $Null


#The End (for now)

#Built using:

<#PSVersion                      5.1.14393.206                                                                               
PSEdition                      Desktop                                                                                     
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}                                                                     
BuildVersion                   10.0.14393.206                                                                              
CLRVersion                     4.0.30319.42000                                                                             
WSManStackVersion              3.0                                                                                         
PSRemotingProtocolVersion      2.3                                                                                         
SerializationVersion           1.1.0.1
#>