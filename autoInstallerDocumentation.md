## Introduction

The `autoInstaller.ps1` script is a `PowerShell` script which will install every necessary programm after a fresh `Windows 10` (or `Windows 11`) installment.

## Bash Script

To start the `PowerShell` script, a short `bash` script is needed:

```bash
powershell -ExecutionPolicy Bypass -File "autoInstaller.ps1"
pause
```

> ⚠️ The `bash` execution only works, if both files are in the same folder!

---

> ℹ️ The following sections are explanations.

It's not possible to run a `PowerShell` script by starting it as an administrator and opening by the file:

```PowerShell
.\[SCRIPT_NAME].ps1
```

This will lead to the following error:

```PowerShell
PS C:\Programming projects\WindowsDocumentations> .\autoInstaller.ps1                                    .\autoInstaller.ps1 : File C:\Programming projects\WindowsDocumentations\autoInstaller.ps1 cannot be     loaded because running scripts is disabled on this system. For more information, see                     about_Execution_Policies at https:/go.microsoft.com/fwlink/?LinkID=135170.                               At line:1 char:1                                                                                         + .\autoInstaller.ps1                                                                                    + ~~~~~~~~~~~~~~~~~~~                                                                                        + CategoryInfo          : SecurityError: (:) [], PSSecurityException                                     + FullyQualifiedErrorId : UnauthorizedAccess 
```

Therefore it's necessary to open the script over a `bash` command.

```bash
powershell -File "C:\Programming projects\WindowsDocumentations\autoInstaller.ps1"
pause
```

This is also not enough, because it still gives the error, that `PowerShell` is not allowed to run any scripts:

```bash
C:\Programming projects\WindowsDocumentations>powershell -File "C:\Programming projects\WindowsDocumentations\autoInstaller.ps1"                                                                                                                File C:\Programming projects\WindowsDocumentations\autoInstaller.ps1 cannot be loaded because running scripts is        disabled on this system. For more information, see about_Execution_Policies at                                          https:/go.microsoft.com/fwlink/?LinkID=135170.                                                                              + CategoryInfo          : SecurityError: (:) [], ParentContainsErrorRecordException                                     + FullyQualifiedErrorId : UnauthorizedAccess     
```

To give the `PowerShell` permission, the following command needs to added:

```bash
powershell -ExecutionPolicy Bypass -File "autoInstaller.ps1" 
```

## PowerShell

To install a package, the following command is used:

```PowerShell
winget install [PACKAGE_NAME]
winget install Mozilla.FireFox
```

A better approach is to use `-e` and `--id` so that `winget` uses the exact installation ID:

```PowerShell
winget install -e --id Mozilla.FireFox
```

On the website https://winstall.app/apps or https://winget.run/ you can find any installable app with the `winget` function of the `PowerShell`.