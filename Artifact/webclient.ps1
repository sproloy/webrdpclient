function Create-Folder {
    Param ([string]$path)
    if ((Test-Path $path) -eq $false) 
    {
        Write-Host "$path doesn't exist. Creating now.."
        New-Item -ItemType "directory" -Path $path
    }
}
function Download-File{
    Param ([string]$src, [string] $dst)
    (New-Object System.Net.WebClient).DownloadFile($src,$dst)
    #Invoke-WebRequest $src -OutFile $dst
}
function WaitForFile($File) {
  while(!(Test-Path $File)) {    
    Start-Sleep -s 10;   
  }  
} 

#Setup Folders
$setupFolder = "C:\WEBRDPCLIENT"
Create-Folder "$setupFolder"
Create-Folder "$setupFolder\training"
$setupFolder = "$setupFolder\training"
$WASP = "C:\Program Files (x86)\WindowsPowerShell\Modules"
Create-Folder "$WASP"
Create-Folder "$WASP\WASP"
$WASP = "$WASP\WASP"

$os_type = (Get-WmiObject -Class Win32_ComputerSystem).SystemType -match ‘(x64)’
# upload DLL
Write-Host "upload DLL"
if((Test-Path "$WASP\WASP.dll") -eq $false)
{
    Write-Host "upload WASP.dll"
    if ($os_type -eq "True"){
        Download-File "https://shuk06-my.sharepoint.com/personal/syed_shuk06_onmicrosoft_com/_layouts/15/guestaccess.aspx?docid=15c9d549f92b044d6af490c10809b484e&authkey=AWuiq5DXQFnE9W7WIr8lBgI" "$WASP\WASP.dll"
    }else {
        Write-Host "32 Bit system is not supported"
    }    
}

# webRDP-Client Installation 
if((Test-Path "$setupFolder\webRDP-Client_1.2.0.42-32.exe") -eq $false)
{
    Write-Host "Downloading WEBRDP-CLIENT installation file.."
    if ($os_type -eq "True"){
        Download-File "https://shuk06-my.sharepoint.com/personal/syed_shuk06_onmicrosoft_com/_layouts/15/guestaccess.aspx?docid=170c5247fd9664ac89af5beda6036364a&authkey=AaFHc8Vve_8ukS4KElnjdKQ" "$setupFolder\webRDP-Client_1.2.0.42-32.exe"
    }else {
        Write-Host "32 Bit system is not supported"
    }    
}
# upload license
Write-Host "upload license file.."
if((Test-Path "$setupFolder\G7_CR_Technologies-license.swl") -eq $false)
{
    Write-Host "upload license file G7_CR_Technologies-license.swl"
    if ($os_type -eq "True"){
        Download-File "https://shuk06-my.sharepoint.com/personal/syed_shuk06_onmicrosoft_com/_layouts/15/guestaccess.aspx?docid=1bde5d1ccd0274f408bee17afeda1b987&authkey=Ae-GknK-TWpfRNUKPx565Ms" "$setupFolder\G7_CR_Technologies-license.swl"
    }else {
        Write-Host "32 Bit system is not supported"
    }    
}

Import-Module WASP
Start-Process -FilePath "C:\WEBRDPCLIENT234\training\webRDP-Client_1.2.0.42-32.exe"
Start-Sleep -Seconds 20
$ProcessName = Get-Process | Where-Object { $Name_ -Like 'webRDP-Client_1.2.0.42-32*' } |foreach {$Name_}
#1st WINDOW
Select-window $ProcessName | Set-WindowActive
Select-window $ProcessName | Send-Keys '~'
Start-Sleep -Seconds 2
#2nd WINDOW
Select-window $ProcessName | Set-WindowActive
Select-window $ProcessName | Send-Keys '{UP}'
Select-window $ProcessName | Set-WindowActive
Select-window $ProcessName | Send-Keys '(%{a})'
Select-window $ProcessName | Set-WindowActive
Select-window $ProcessName | Send-Keys '{TAB}'
Select-window $ProcessName | Set-WindowActive
Select-window $ProcessName | Send-Keys '{TAB}'
Select-window $ProcessName | Set-WindowActive
Select-window $ProcessName | Send-Keys '{TAB}'
Select-window $ProcessName | Set-WindowActive
Select-window $ProcessName | Send-Keys '{TAB}'
Select-window $ProcessName | Set-WindowActive
Select-window $ProcessName | Send-Keys '~'            
Start-Sleep -Seconds 2 
#3rd WINDOW
Select-window $ProcessName | Set-WindowActive
Select-window $ProcessName | Send-Keys '~'            
Start-Sleep -Seconds 2
#4th window
Select-window $ProcessName | Set-WindowActive
Select-window $ProcessName | Send-Keys '{TAB}'
Select-window $ProcessName | Send-Keys '{TAB}'
Select-window $ProcessName | Send-Keys '{BACKSPACE}'
Select-window $ProcessName | Send-Keys '{BACKSPACE}'
Select-window $ProcessName | Send-Keys '{BACKSPACE}'
Select-window $ProcessName | Send-Keys 'C:\WEBRDPCLIENT\training\G7_CR_Technologies-license.swl'
Start-Sleep -Seconds 2
Select-window $ProcessName | Send-Keys '{TAB}'
Select-window $ProcessName | Send-Keys '{TAB}'
Select-window $ProcessName | Send-Keys '{TAB}'
Select-window $ProcessName | Send-Keys '{TAB}'
Select-window $ProcessName | Send-Keys '{TAB}'
Select-window $ProcessName | Send-Keys '~'
Start-Sleep -Seconds 2
#5th Window
Select-window $ProcessName | Set-WindowActive
Select-window $ProcessName | Send-Keys '{TAB}'
Select-window $ProcessName | Send-Keys '{TAB}'
Select-window $ProcessName | Send-Keys '{TAB}'
Select-window $ProcessName | Send-Keys '{TAB}'
Select-window $ProcessName | Send-Keys '{TAB}'
Select-window $ProcessName | Send-Keys '{TAB}'
Select-window $ProcessName | Send-Keys '{TAB}'
Select-window $ProcessName | Send-Keys '{TAB}'
Select-window $ProcessName | Send-Keys '~'
Start-Sleep -Seconds 2
#6th Window
Select-window $ProcessName | Set-WindowActive
Select-window $ProcessName | Send-Keys '~'
Start-Sleep -Seconds 15
#7th Window
Select-window $ProcessName | Set-WindowActive
Select-window $ProcessName | Send-Keys '~'
Exit
