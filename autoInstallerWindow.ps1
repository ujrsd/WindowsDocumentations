Add-Type -AssemblyName System.Windows.Forms

# Create the form
$form = New-Object System.Windows.Forms.Form
$form.Text = "App Installer Wizard"
$Screen_resolution = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
$form.Size = New-Object System.Drawing.Size(
    [int]($Screen_resolution.Width * 0.4),
    [int]($Screen_resolution.Height * 0.6)
)
$form.StartPosition = "CenterScreen"

# Relative coordinates
$yPos = 10
$xPos = 10

# Create a label
$xSize = 300
$ySize = 30
$label = New-Object System.Windows.Forms.Label
$label.Text = "Which applications do you want to install on your device? Fill out the check list and press then the install button"
$label.Size = New-Object System.Drawing.Size($xSize,$ySize)
$label.Location = New-Object System.Drawing.Point($xPos,$yPos)
$form.Controls.Add($label)

$yPos += $ySize + 5

# Browser
## Label
$xSize = 300
$ySize = 20
$label = New-Object System.Windows.Forms.Label
$label.Text = "Browsers"
$label.Size = New-Object System.Drawing.Size($xSize,$ySize)
$label.Location = New-Object System.Drawing.Point($xPos,$yPos)
$form.Controls.Add($label)

$yPos += $ySize + 5

# Browser to install
$browsers = @{
    "Brave Browser" = "Brave.Brave"
    "Google Chrome" = "Google.Chrome"
    "Mozilla Firefox" = "Mozilla.Firefox"    
    "Opera" = "Opera.Opera"
    "Opera GX" = "Opera.OperaGX"
}

# Create Checkboxes
$checkboxes = @{}

foreach($browserName in $browsers.Keys) {
    $cb = New-Object System.Windows.Forms.CheckBox
    $cb.Text = $browserName
    $cb.Tag = $browsers[$browserName]
    $cb.Size = New-Object System.Drawing.Size(300,20)
    $cb.Location = New-Object System.Drawing.Point(10,$yPos)
    $form.Controls.Add($cb)
    $checkboxes[$browserName] = $cb
    $yPos += 30
}

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

# Line
$line = New-Object System.Windows.Forms.Label
$line.BorderStyle = "Fixed3D"
$line.AutoSize = $false
$line.Height = 2
$line.Width  = $form.ClientSize.Width - 40
$line.Location = New-Object System.Drawing.Point(310, 10)
$form.Controls.Add($line)

# Show the form
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()