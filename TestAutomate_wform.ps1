<# 
.NAME
    TestAutomate
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(599,423)
$Form.text                       = "Form"
$Form.TopMost                    = $false

$FirstNameText                   = New-Object system.Windows.Forms.Label
$FirstNameText.text              = "First Name:"
$FirstNameText.AutoSize          = $true
$FirstNameText.width             = 25
$FirstNameText.height            = 10
$FirstNameText.location          = New-Object System.Drawing.Point(18,32)
$FirstNameText.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$FirstNameInput                  = New-Object system.Windows.Forms.TextBox
$FirstNameInput.multiline        = $false
$FirstNameInput.width            = 132
$FirstNameInput.height           = 20
$FirstNameInput.location         = New-Object System.Drawing.Point(129,29)
$FirstNameInput.Font             = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$DataGridView1                   = New-Object system.Windows.Forms.DataGridView
$DataGridView1.width             = 224
$DataGridView1.height            = 152
$DataGridView1.location          = New-Object System.Drawing.Point(130,69)

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Submit Name"
$Button1.width                   = 137
$Button1.height                  = 30
$Button1.location                = New-Object System.Drawing.Point(130,239)
$Button1.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "What is your name?"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(297,29)
$Label1.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',15)

$Form.controls.AddRange(@($FirstNameText,$FirstNameInput,$DataGridView1,$Button1,$Label1))

$Button1.Add_Click({  })

#region Logic 

#endregion

[void]$Form.ShowDialog()