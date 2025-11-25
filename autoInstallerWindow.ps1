Add-Type -AssemblyName System.Windows.Forms

# Initialize Constants
$Screen_resolution = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
$Screen_width =[int]($Screen_resolution.Width*0.5) 
$Screen_height =[int]($Screen_resolution.Height*0.65)

$deltaX = 10
$deltaY = 10

$yMin = 0
$yMax = $Screen_width

$columns = 3
$column_width = [int](($Screen_width / $columns)-2*$deltaX) 

Write-Host "column_width = " $column_width


## Relative coordinates
$yPos = 10
$xPos = 10

function add_Line{
    param(
        $x, $y, $height, $width, [string]$color = "Gray"
    )

    $line = New-Object System.Windows.Forms.Label
    $line.BorderStyle = "Fixed3D"
    $line.AutoSize = $false
    $line.Height = $height
    $line.Width  = $width
    $line.Location = New-Object System.Drawing.Point($x, $y)
    $line.BackColor = [System.Drawing.Color]::$color
    $form.Controls.Add($line)

    increaseYPos -object_height $line.Height
}

function checkYPos {
    param (
        $object_height, $deltaY = $script:deltaY
    )

    $value = $script:yPos + $object_height + $deltaY
    if ($value -ge $yMax) {
        $script:yPos = $yMin
        $script:xPos += $column_width + $deltaX
    }
}

function increaseYPos {
    param (
        $object_height, $deltaY = $script:deltaY
    )

    $script:yPos += $object_height + $deltaY
    if ($yPos -ge $yMax) {
        $script:yPos = $yMin
        $script:xPos += $column_width + $deltaX
    }    
}

function createCheckBoxes{
    param (
        [string]$class_name, $class_list
    )

    $deltaY = 0.5*$script:deltaY

    $label = New-Object System.Windows.Forms.Label
    $label.Text = $class_name
    $label.MinimumSize = New-Object System.Drawing.Size($column_width,0)
    checkYPos -object_height $label.Height -deltaY $deltaY
    $label.Location = New-Object System.Drawing.Point($script:xPos,$script:yPos)
    $form.Controls.Add($label)
    $script:yPos += $label.Height + $deltaY
    Write-Host "yPos after label: " $script:yPos
  
    foreach($object in $class_list.Keys) {
        $cb = New-Object System.Windows.Forms.CheckBox
        $cb.Text = $object
        $cb.Tag = $class_list[$object]
        $cb.Size = New-Object System.Drawing.Size($column_width,20)
        checkYPos -object_height $cb.Height -deltaY $deltaY
        $cb.Location = New-Object System.Drawing.Point($script:xPos,$script:yPos)
        $form.Controls.Add($cb)
        $checkboxes[$object] = $cb

        $script:yPos += $cb.Height + $deltaY
    }

    add_Line -x $xPos -y $yPos -height 2 -width $column_width
}


# Create the form
$form = New-Object System.Windows.Forms.Form
$form.Text = "App Installer Wizard"
$form.Size = New-Object System.Drawing.Size(
    $Screen_width,
    $Screen_height
)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedSingle"

# Create a label
$label = New-Object System.Windows.Forms.Label
$label.Text = "Which applications do you want to install on your device? Fill out the check list and press then the install button."
$label.AutoSize = $true
$label.MinimumSize = New-Object System.Drawing.Size([int]($Screen_width - 2*$deltaX),0)
$label.Location = New-Object System.Drawing.Point($xPos,$yPos)
$form.Controls.Add($label)

increaseYPos -object_height $label.Height
add_Line -x $xPos -y $yPos -height 3 -width ($label.Width-2*$deltaX) -color "black"

$yMin = $yPos

# Install button
$btn_install = New-Object System.Windows.Forms.Button
$btn_install.Text = "Install Selected Apps"
$btn_install.Width = [int]($form.ClientSize.Width*(0.33))
$btn_install.Height = [int]($form.ClientSize.Height*(0.05))
$btn_install.Location = New-Object System.Drawing.Point(
    [int](($form.ClientSize.Width - $btn_install.Width) / 2),
    [int]($form.ClientSize.Height - $btn_install.Height - 20)
)
## Add install button to Form
$form.Controls.Add($btn_install)

add_Line -x $xPos -y ($btn_install.Location.Y-2*$deltaY) -height 3 -width ($Screen_width-4*$deltaX) -color "black"
$yPos -= $deltaY - $line.Height

# yMax is set after the initalization of the install button
Write-Host "($btn_install.Location.Y-2*$deltaY) =" ($btn_install.Location.Y-2*$deltaY) " deltaY =" $deltaY
$yMax = ($btn_install.Location.Y-2*$deltaY) - $deltaY

Write-Host "yMin =" $yMin
Write-Host "yMax =" $yMax

#### Create every programm section ####

$checkboxes = @{}

$browsers = @{
    "Brave Browser" = "Brave.Brave"
    "Google Chrome" = "Google.Chrome"
    "Mozilla Firefox" = "Mozilla.Firefox"    
    "Opera" = "Opera.Opera"
    "Opera GX" = "Opera.OperaGX"
}
createCheckBoxes -class_name "Browsers" -class_list $browsers

$VPNs = @{
    "Nord VPN" = "NordSecurity.NordVPN"
    "Proton VPN" = "Proton.ProtonVPN"
    "Express VPN" = "ExpressVPN.ExpressVPN"
}
createCheckBoxes -class_name "VPN" -class_list $VPNs

$game_services = @{
    "Steam" = "Valve.Steam"
    "Epic Games" = "EpicGames.EpicGamesLauncher"
    "EA App" = "ElectronicArts.EADesktop"
    "Ubisoft Connect" = "Ubisoft.Connect"
}
createCheckBoxes -class_name "Game Services" -class_list $game_services

$cloud_services = @{
    "Microsoft Onedrive" = "Microsoft.OneDrive"
    "Google Drive" = "Google.GoogleDrive"
    "Dropbox" = "Dropbox.Dopbox"
}
createCheckBoxes -class_name "Cloud Services" -class_list $cloud_services

$programming_services = @{
    "Notepad++" = "Notepad++.Notepad++"
    "Python3" = "Python.Python3"
    "Microsoft Visual Studio Code" = "Microsoft.VisualStudioCode"
    "Microsoft Visual Studio Community" = "Microsoft.VisualStudio.Community"
}
createCheckBoxes -class_name "Programming Services" -class_list $programming_services

$util_services = @{
    "7-Zip" = "7zip.7zip"
    "Git" = "Git.Git"
    "Microsoft Power Toys" = "Microsoft.PowerToys"
    "VLC Video Player" = "VideoLAN.VLC"
    "Discord" = "Discord.Discord"
    "OBS" = "OBSProject.OBSStudio"
    "Spotify" = "Spotify.Spotify"
}
createCheckBoxes -class_name "Utils" -class_list $util_services

$office_services = @{
    "Microsoft Office" = "Microsoft.Office"
    "Microsoft Teams" = "Microsoft.Teams"
    "Zoom" = "Zoom.Zoom"
    "Libre Office" = "TheDocumentFoundation.LibreOffice"
    "Adobe Acrobat Reader" = "Adobe.Acrobat.Reader.64-bit"
}
createCheckBoxes -class_name "Office Services" -class_list $office_services

$graphic_services = @{
    "Nvidia GeForce Now" = "Nvidia.GeForceNow"
}
createCheckBoxes -class_name "Graphics software" -class_list $graphic_services

$email_services = @{
    "Mozilla Thunderbird" = "Mozilla.Thunderbird"
}
createCheckBoxes -class_name "E-Mail services" -class_list $email_services







#### Display the window ####

# Show the form
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()