function install_packages{
    param (
        [string[]]$PackageIDs
    )

    foreach($package in $PackageIDs) {
        Write-Host "Installing package: " $package
        winget install -e --id $package --accept-source-agreements --accept-package-agreements
    }
}

# Browser
$browsers = @("Mozilla.Firefox",
            "Google.Chrome",
            "Brave.Brave",
            "Opera.Opera",
            "Opera.OperaGX")

install_packages -PackageIDs $browsers



# Gaming
$game_services = @("Valve.Steam",
                "EpicGames.EpicGamesLauncher",
                "ElectronicArts.EADesktop",
                "Ubisoft.Connect")

install_packages -PackageIDs $game_services

Write-Host "Browser Installation completed, this will finish the current script for testing!"
Read-Host "Press Enter to continue ..."
exit

# VPNs
$VPNs = @("NordSecurity.NordVPN",
        "Proton.ProtonVPN",
        "ExpressVPN.ExpressVPN")

foreach($VPN in $VPNs) {
    winget install -e --id $VPN --accept-source-agreements --accept-package-agreements
}

# Office
$Office_softwares = @("Microsoft.Office",
                    "Microsoft.Teams",
                    "Zoom.Zoom",
                    "TheDocumentFoundation.LibreOffice",
                    "Adobe.Acrobat.Reader.64-bit")

foreach($Office_software in $Office_softwares) {
    winget install -e --id $Office_software --accept-source-agreements --accept-package-agreements
}


# E-Mail Service
$email_softwares = @("Mozilla.Thunderbird")

foreach($email_software in $email_softwares) {
    winget install -e --id $email_software --accept-source-agreements --accept-package-agreements
}

# Cloud Storage
$cloud_softwares = @("Microsoft.OneDrive",
                    "Google.GoogleDrive",
                    "Dropbox.Dopbox")

foreach($cloud_software in $cloud_softwares) {
    winget install -e --id $cloud_software --accept-source-agreements --accept-package-agreements
}

# Programming
$programming_softwares = @("Notepad++.Notepad++",
                        "Python.Python3",
                        "Microsoft.VisualStudioCode",
                        "Microsoft.VisualStudio.Community")

foreach($programming_software in $programming_softwares) {
    winget install -e --id $programming_software --accept-source-agreements --accept-package-agreements
}

# Utils
$utils = @("7zip.7zip",
            "Git.Git",
            "Microsoft.PowerToys",
            "VideoLAN.VLC",
            "Discord.Discord",
            "OBSProject.OBSStudio",
            "Spotify.Spotify")

foreach($util in $utils) {
    winget install -e --id $util --accept-source-agreements --accept-package-agreements
}

# NVIDIA
$nvidia_softwares = @("Nvidia.GeForceNow")

foreach($nvidia_software in $nvidia_softwares) {
    winget install -e --id $nvidia_software --accept-source-agreements --accept-package-agreements
}

#winget install Google.Chrome --accept-source-agreements --accept-package-agreements

# Uninstalling Microsoft.Edge over the PowerShell is not possible. It's tightly integrated into Windows.
# winget uninstall Microsoft.Edge