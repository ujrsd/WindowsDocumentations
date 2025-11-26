## Introduction

After a fresh installment of `Windows 10` or 11, many settings need to be made to improve the overall performance and deactivate features, that are for the casual use of a computer not needed.

> ⚠️ Some changes of settings decrease some `Windows` security standards! Following this checklist is at it's own risk!

## Settings to change

### Control Panel

Change the view in "View by:" to "Large icons". Every step is from the start condition, when you open the control panel.

1. User Accounts > Change User Account Control settings > Move slider to lowest position "Never notify" -> This will remove the black screen that appears if you want to install or start some `*.exe`.

### Task Manager

Open the task manager by right-clicking the task bar and then pressing on "Task Manager" or press the <img src="https://upload.wikimedia.org/wikipedia/commons/5/5f/Windows_logo_-_2012.svg" width="18" style="vertical-align:middle; position:relative; top:-2px; margin:0 3px;"> button and type "Task Manager".

On the toolbar, click on "Startup". This will show every application that will be automatically run, when starting the computer. Disable any program that is not needed by right-clicking it and pressing "disable".

**Advanced:** The software "Autoruns" will show an extended list on every autostarting software. Source: https://learn.microsoft.com/en-us/sysinternals/downloads/autoruns

### Powershell

Many apps that aren't used can be uninstalled over the Powershell. Open it by pressing the <img src="https://upload.wikimedia.org/wikipedia/commons/5/5f/Windows_logo_-_2012.svg" width="18" style="vertical-align:middle; position:relative; top:-2px; margin:0 3px;"> button and type "Powershell". Run it as administrator.

The following commands wills remove the named application from every User created on the `Windows`-OS:

```powershell
Get-AppxPackage -AllUsers *Dropbox* | Remove-AppPackage
Get-AppxPackage -AllUsers *Amazon* | Remove-AppPackage
Get-AppxPackage -AllUsers *LinkedIn* | Remove-AppPackage
Get-AppxPackage -AllUsers *WildTangent* | Remove-AppPackage
Get-AppxPackage -AllUsers *McAfee* | Remove-AppPackage
Get-AppxPackage -AllUsers *Booking* | Remove-AppPackage
Get-AppxPackage -AllUsers *Skype* | Remove-AppPackage
Get-AppxPackage -AllUsers *Solitaire* | Remove-AppPackage
Get-AppxPackage -AllUsers DellInc.PartnerPromo | Remove-AppPackage
Get-AppxPackage -AllUsers Microsoft.Office.OneNote | Remove-AppPackage # This removes OneNote for Windows 10
Get-AppxPackage -AllUsers Microsoft.MicrosoftOfficeHub | Remove-AppPackage
Get-AppxPackage -AllUsers Microsoft.ZuneVideo | Remove-AppPackage
Get-AppxPackage -AllUsers Microsoft.ZuneMusic | Remove-AppPackage
Get-AppxPackage -AllUsers Microsoft.WindowsFeedbackHub | Remove-AppPackage
Get-AppxPackage -AllUsers Microsoft.Getstarted | Remove-AppPackage
Get-AppxPackage -AllUsers Microsoft.GetHelp | Remove-AppPackage
Get-AppxPackage -AllUsers Disney.37853FC22B2CE | Remove-AppPackage
Get-AppxPackage -AllUsers *TopHatchInc* | Remove-AppPackage
Get-AppxPackage -AllUsers MicrosoftTeams | Remove-AppPackage # Only if Teams is not used
```

The following commands will avoid of a reinstallation of the apps, when creating a new User on the `Windows`-OS.

```powershell
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Dropbox*"} | Remove-AppProvisionedPackage -online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Amazon*"} | Remove-AppProvisionedPackage -online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*LinkedIn*"} | Remove-AppProvisionedPackage -online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*WildTangent*"} | Remove-AppProvisionedPackage -online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*McAfee*"} | Remove-AppProvisionedPackage -online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Booking*"} | Remove-AppProvisionedPackage -online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Skype*"} | Remove-AppProvisionedPackage -online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Solitaire*"} | Remove-AppProvisionedPackage -online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*DellInc.PartnerPromo*"} | Remove-AppProvisionedPackage -online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.Office.OneNote*"} | Remove-AppProvisionedPackage -online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.MicrosoftOfficeHub*"} | Remove-AppProvisionedPackage -online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*ZuneVideo*"} | Remove-AppProvisionedPackage -online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*ZuneMusic*"} | Remove-AppProvisionedPackage -online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*WindowsFeedbackHub*"} | Remove-AppProvisionedPackage -online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Getstarted*"} | Remove-AppProvisionedPackage -online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*GetHelp*"} | Remove-AppProvisionedPackage -online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Disney*"} | Remove-AppProvisionedPackage -online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*TopHatch.Inc*"} | Remove-AppProvisionedPackage -online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "MicrosoftTeams"} | Remove-AppProvisionedPackage -online
```

Source: https://www.reddit.com/r/Windows11/comments/17cy9uv/comment/k5ug1hx/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button 