Add-Type -AssemblyName System.Windows.Forms

# Initialize Constants
$Screen_resolution = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
$Screen_width =[int]($Screen_resolution.Width*0.5) 
$Screen_height =[int]($Screen_resolution.Height*0.65)

$deltaX = 10
$deltaY = 10

$columns = 3
$column_width = [int](($Screen_width / $columns)-$deltaX) 

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
}

function increaseYPos {
    param (
        $y, $object_height
    )

    Write-Host "deltaY =" $deltaY "yMax =" $yMax
    Write-Host "Before: yPos =" $yPos

    $y += $object_height + $deltaY

    if ($y -ge $yMax) {
        $y = 0
    }

    Write-Host "After: yPos =" $yPos
    
    return $y
}


Write-Host "Screen width:" $Screen_width
# Create the form
$form = New-Object System.Windows.Forms.Form
$form.Text = "App Installer Wizard"
$form.Size = New-Object System.Drawing.Size(
    $Screen_width,
    $Screen_height
)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedSingle"

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


$yMax = $Screen_height - $btn_install.Height - 30

# Create a label
$label = New-Object System.Windows.Forms.Label
$label.Text = "Which applications do you want to install on your device? Fill out the check list and press then the install button."
$label.AutoSize = $true
$label.MinimumSize = New-Object System.Drawing.Size([int]($Screen_width - 2*$deltaX),0)
$label.Location = New-Object System.Drawing.Point($xPos,$yPos)
$form.Controls.Add($label)

$yPos = increaseYPos -y $yPos -object_height $label.Height
Write-Host "After function: yPos =" $yPos

Write-Host $Screen_width
Write-Host ($Screen_width - 2*$deltaX)
Write-Host $label.Width

add_Line -x $xPos -y $yPos -height 3 -width ($label.Width-2*$deltaX) -color "black"
$yPos = increaseYPos -y $yPos -object_height $line.Height

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



# Create a line
add_Line -x $xPos -y $yPos -height 2 -width 100
$yPos += $deltaY

add_Line -x $xPos -y $yPos -height 2 -width 100



# Show the form
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()