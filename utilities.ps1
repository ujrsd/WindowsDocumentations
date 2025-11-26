# X or Y value functions
function checkYPos {
    param (
        $object_height, $deltaY = $script:deltaY
    )

    $value = $script:yPos + $object_height + $deltaY
    if ($value -ge $yMax) {
        $script:yPos = $yMin
        $script:xPos += $script:column_width + $deltaX
    }
}

# Different kind of Forms to create
function create_Line{
    param(
        $height, $width, [string]$color = "Gray"
    )

    $line = New-Object System.Windows.Forms.Label
    $line.BorderStyle = "Fixed3D"
    $line.AutoSize = $false
    $line.size = New-Object System.Drawing.Size($width, $height)
    $line.BackColor = [System.Drawing.Color]::$color
    $form.Controls.Add($line)

    #$script:yPos += $line.Height + $script:deltaY
    return $line
}


# Create Label at $script:xPos and $script:yPos
function create_Label{
    param(
        [string]$text, $width
    )

    $label = New-Object System.Windows.Forms.Label
    $label.Text = $text
    $label.AutoSize = $true
    $label.MaximumSize = New-Object System.Drawing.Size($width, 0)
    $form.Controls.Add($label)
    $label.PerformLayout()

    return $label
}

function create_CheckBoxes{
    param(
        $class_list, $deltaY_factor = 1
    )

    # apply deltaY change
    $deltaY = $script:deltaY * $deltaY_factor
    $deltaHeight = 0
    $checkboxes_list = @{}

    foreach($object in $class_list.Keys) {
        $cb = New-Object System.Windows.Forms.CheckBox
        $cb.Text = $object
        $cb.Tag = $class_list[$object]
        $cb.AutoSize = $true
        $cb.MaximumSize = New-Object System.Drawing.Size($column_width, 0)
        $form.Controls.Add($cb)
        $cb.PerformLayout()
        #checkYPos -object_height $cb.Height -deltaY $deltaY
        #$cb.Location = New-Object System.Drawing.Point($script:xPos,$script:yPos)

        $script:checkboxes[$object] = $cb
        $checkboxes_list[$object] = $cb
        #$script:yPos += $cb.Height + $deltaY
        #$deltaHeight += $cb.Height + $deltaY
    }
    return $checkboxes_list
}

function create_Section{
    param (
        [string]$class_name, $class_list, $label_deltaY_factor = 1, $checkBoxes_deltaY_factor = 1
    )

    $deltaHeight = 0
    $checkboxes_list = @{}

    # Create Label of section
    $label = create_Label -text $class_name -width $script:column_width -deltaY_factor $label_deltaY_factor
    # Create checkboxes
    $checkboxes_list = create_CheckBoxes -class_list $class_list -deltaY_factor $checkBoxes_deltaY_factor
    # Add seperation Line
    $line = create_Line -x $xPos -y $yPos -height 2 -width $column_width

    Write-Host "label.Height =" $label.Height
    $deltaHeight += $label.Height + $script:deltaY
    foreach($cb in $checkboxes_list.Values) {
        Write-Host "cb.Height =" $cb.Height
        $deltaHeight += $cb.Height + $script:deltaY
    }

    Write-Host "label.Height =" $line.Height
    $deltaHeight += $line.Height + $script:deltaY

    Write-Host "current yPos =" $script:yPos "deltaHeight =" $deltaHeight "maxY =" $yMax

    if($script:yPos+$deltaHeight -ge $script:yMax) {
        $script:xPos += $script:column_width + $script:deltaX
        $script:yPos = $script:yMin
    }

    $label.Location = New-Object System.Drawing.Point($script:xPos, $script:yPos)
    $script:yPos += $label.height + $script:deltaY 

    foreach($cb in $checkboxes_list.Values) {
        $cb.Location = New-Object System.Drawing.Point($script:xPos, $script:yPos)
        $script:yPos += $cb.Height + $script:deltaY
    }

    $line.Location = New-Object System.Drawing.Point($script:xPos, $script:yPos)
    $script:yPos += $line.Height + $script:deltaY
}