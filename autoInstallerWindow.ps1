# Help functions to create forms
. ".\utilities.ps1"

# List of different categories and programm names that should be installed
. ".\applications_to_Install.ps1"

Add-Type -AssemblyName System.Windows.Forms

# Initialize Constants
$Screen_resolution = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
$Screen_width =[int]($Screen_resolution.Width*0.5) 
$Screen_height =[int]($Screen_resolution.Height*0.65)

$deltaX = 10
$deltaY = 10

$yMin = 0
$yMax = $Screen_width

$columns = 2
$column_width = [int](($Screen_width / 3)-2*$deltaX) 

## Relative coordinates
$yPos = 10
$xPos = 10

# Create the form
$form = New-Object System.Windows.Forms.Form
$form.Text = "App Installer Wizard"
$form.Size = New-Object System.Drawing.Size(
    $Screen_width,
    $Screen_height
)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedSingle"

# Create information label
$label = create_Label -text "Which applications do you want to install on your device? Fill out the check list and press then the install button. Which applications do you want to install on your device? Fill out the check list and press then the install button.
Which applications do you want to install on your device? Fill out the check list and press then the install button.
Which applications do you want to install on your device? Fill out the check list and press then the install button.
Which applications do you want to install on your device? Fill out the check list and press then the install button." -width ($Screen_width - 2*$deltaX)
$label.Location = New-Object System.Drawing.Point($script:xPos,$script:yPos)
$script:yPos += $label.Height + $script:deltaY

$line = create_Line -height 3 -width ($Screen_width - 4*$deltaX) -color "black"
$line.Location = New-Object System.Drawing.Point($script:xPos,$script:yPos)
$script:yPos += $line.Height + 1.5*$script:deltaY

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

$line = create_Line -height 3 -width ($Screen_width-4*$deltaX) -color "black"
$line.Location = New-Object System.Drawing.Point($script:xPos,($btn_install.Location.Y-2*$deltaY))

$yPos -= $deltaY - $line.Height

# yMax is set after the initalization of the install button
Write-Host "(btn_install.Location.Y-2*deltaY) =" ($btn_install.Location.Y-2*$deltaY) " deltaY =" $deltaY
$yMax = ($btn_install.Location.Y-2*$deltaY) - $deltaY

Write-Host "yMin =" $yMin
Write-Host "yMax =" $yMax

#### Create every programm section ####

$checkboxes = @{}

foreach($categorie in $application_categories.Values) {
    create_Section -class_name $categorie.DisplayName -class_list $categorie.Items -label_deltaY_factor 0.5 -checkBoxes_deltaY_factor 0.5
}

#### Install button functionality ####

$btn_install.Add_Click({
    Write-Host "Install button pressed!"
    foreach ($cb in $checkboxes.Values) {
        $checked = $cb.Checked
        $name = $cb.Text
        $tag = $cb.Tag

        Write-Host "app name:" $name " - winget call:" $tag " - checked?" $checked
    }
})

#### Display the window ####

# Show the form
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()