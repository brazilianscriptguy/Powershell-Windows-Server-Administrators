# PowerShell Script to Search and Update Expiration AD Users Account by Description
# Author: Luiz Hamilton Silva - @brazilianscriptguy
# Updated: July 8, 2024

# Hide the PowerShell console window
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Window {
    [DllImport("kernel32.dll", SetLastError = true)]
    static extern IntPtr GetConsoleWindow();
    [DllImport("user32.dll", SetLastError = true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
    public static void Hide() {
        var handle = GetConsoleWindow();
        ShowWindow(handle, 0); // 0 = SW_HIDE
    }
    public static void Show() {
        var handle = GetConsoleWindow();
        ShowWindow(handle, 5); // 5 = SW_SHOW
    }
}
"@

[Window]::Hide()

# Load necessary assemblies for GUI
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Determine the script name and set up logging path
$scriptName = [System.IO.Path]::GetFileNameWithoutExtension($MyInvocation.MyCommand.Name)
$logDir = 'C:\Logs-TEMP'
$logFileName = "${scriptName}.log"
$logPath = Join-Path $logDir $logFileName

# Ensure the log directory exists
if (-not (Test-Path $logDir)) {
    $null = New-Item -Path $logDir -ItemType Directory -ErrorAction SilentlyContinue
    if (-not (Test-Path $logDir)) {
        Write-Error "Failed to create log directory at $logDir. Logging will not be possible."
        return
    }
}

# Enhanced logging function with error handling
function Log-Message {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Message,
        [Parameter(Mandatory=$false)]
        [string]$MessageType = "INFO"
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] [$MessageType] $Message"
    try {
        Add-Content -Path $logPath -Value $logEntry -ErrorAction Stop
    } catch {
        Write-Error "Failed to write to log: $_"
    }
}

# Function to display error messages
function Show-ErrorMessage {
    param ([string]$message)
    [System.Windows.Forms.MessageBox]::Show($message, 'Error', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    Log-Message "Error: $message" -MessageType "ERROR"
}

# Function to display information messages
function Show-InfoMessage {
    param ([string]$message)
    [System.Windows.Forms.MessageBox]::Show($message, 'Information', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    Log-Message "Info: $message" -MessageType "INFO"
}

# Function to get the FQDN of the domain name
function Get-DomainFQDN {
    try {
        $domain = (Get-WmiObject Win32_ComputerSystem).Domain
        return $domain
    } catch {
        Show-ErrorMessage "Unable to fetch FQDN automatically."
        return "YourDomainHere"
    }
}

# Function to list AD users based on description
function List-ADUsers {
    param (
        [string]$fqdn,
        [string]$description,
        [System.Windows.Forms.ListView]$listView
    )

    $filter = "Description -like '*$description*'"

    try {
        $users = Get-ADUser -Server $fqdn -Filter $filter -Properties Description, AccountExpirationDate

        $listView.Items.Clear()
        if ($users.Count -gt 0) {
            foreach ($user in $users) {
                $item = New-Object System.Windows.Forms.ListViewItem
                $item.Text = $user.SamAccountName
                $item.SubItems.Add($user.Description)
                $expirationDate = if ($user.AccountExpirationDate) { $user.AccountExpirationDate.ToString("yyyy-MM-dd") } else { "No Expiration" }
                $item.SubItems.Add($expirationDate)
                $listView.Items.Add($item)
            }
        } else {
            Show-InfoMessage "No users found with the specified text in the Description."
        }
    } catch {
        Show-ErrorMessage "Error during AD user search: $_"
    }
}

# Function to update AD users based on the list
function Update-ADUsers {
    param (
        [string]$fqdn,
        [datetime]$expirationDate,
        [System.Windows.Forms.ListView]$listView
    )

    foreach ($item in $listView.CheckedItems) {
        $samAccountName = $item.Text
        try {
            $user = Get-ADUser -Server $fqdn -Filter {SamAccountName -eq $samAccountName} -Properties Description, AccountExpirationDate
            Set-ADUser -Identity $user -AccountExpirationDate $expirationDate
            $logMessage = "Updated User: $($user.SamAccountName) - New Expiration Date: $expirationDate"
            Log-Message -Message $logMessage
        } catch {
            Show-ErrorMessage "Failed to update User: $samAccountName - Error: $_"
        }
    }
    Show-InfoMessage "Selected users updated successfully."
}

# Create a new Windows Form object
$form = New-Object System.Windows.Forms.Form
$form.Text = "AD User Account Expiration Manager"
$form.Size = New-Object System.Drawing.Size(600, 400)
$form.StartPosition = "CenterScreen"

# Create a label for FQDN
$labelFQDN = New-Object System.Windows.Forms.Label
$labelFQDN.Location = New-Object System.Drawing.Point(10, 10)
$labelFQDN.Size = New-Object System.Drawing.Size(560, 20)
$labelFQDN.Text = "Domain FQDN:"
$form.Controls.Add($labelFQDN)

# Create a textbox for FQDN input, prefilled with the current domain
$textboxFQDN = New-Object System.Windows.Forms.TextBox
$textboxFQDN.Location = New-Object System.Drawing.Point(10, 30)
$textboxFQDN.Size = New-Object System.Drawing.Size(560, 20)
$textboxFQDN.Text = Get-DomainFQDN
$form.Controls.Add($textboxFQDN)

# Create a label for description
$labelDescription = New-Object System.Windows.Forms.Label
$labelDescription.Location = New-Object System.Drawing.Point(10, 60)
$labelDescription.Size = New-Object System.Drawing.Size(560, 20)
$labelDescription.Text = "Enter the description to search for:"
$form.Controls.Add($labelDescription)

# Create a textbox for description input
$textboxDescription = New-Object System.Windows.Forms.TextBox
$textboxDescription.Location = New-Object System.Drawing.Point(10, 80)
$textboxDescription.Size = New-Object System.Drawing.Size(560, 20)
$form.Controls.Add($textboxDescription)

# Create a label for expiration date
$labelExpirationDate = New-Object System.Windows.Forms.Label
$labelExpirationDate.Location = New-Object System.Drawing.Point(10, 110)
$labelExpirationDate.Size = New-Object System.Drawing.Size(560, 20)
$labelExpirationDate.Text = "Enter the expiration date (yyyy-MM-dd):"
$form.Controls.Add($labelExpirationDate)

# Create a textbox for expiration date input
$textboxExpirationDate = New-Object System.Windows.Forms.TextBox
$textboxExpirationDate.Location = New-Object System.Drawing.Point(10, 130)
$textboxExpirationDate.Size = New-Object System.Drawing.Size(560, 20)
$form.Controls.Add($textboxExpirationDate)

# Create a ListView to display the users
$listViewUsers = New-Object System.Windows.Forms.ListView
$listViewUsers.Location = New-Object System.Drawing.Point(10, 160)
$listViewUsers.Size = New-Object System.Drawing.Size(560, 150)
$listViewUsers.View = [System.Windows.Forms.View]::Details
$listViewUsers.CheckBoxes = $true
$listViewUsers.FullRowSelect = $true
$listViewUsers.GridLines = $true
$listViewUsers.Columns.Add("SamAccountName", 150)
$listViewUsers.Columns.Add("Description", 310)
$listViewUsers.Columns.Add("Expiration Date", 100)
$form.Controls.Add($listViewUsers)

# Create a button to list users
$buttonListUsers = New-Object System.Windows.Forms.Button
$buttonListUsers.Location = New-Object System.Drawing.Point(10, 320)
$buttonListUsers.Size = New-Object System.Drawing.Size(120, 30)
$buttonListUsers.Text = "List Users"
$buttonListUsers.Add_Click({
    $fqdn = $textboxFQDN.Text.Trim()
    $description = $textboxDescription.Text.Trim()

    if ([string]::IsNullOrWhiteSpace($fqdn)) {
        Show-ErrorMessage "Please enter the domain FQDN."
        return
    }

    if ([string]::IsNullOrWhiteSpace($description)) {
        Show-ErrorMessage "Please enter a description."
        return
    }

    List-ADUsers -fqdn $fqdn -description $description -listView $listViewUsers
})
$form.Controls.Add($buttonListUsers)

# Create a button to select all users
$buttonSelectAll = New-Object System.Windows.Forms.Button
$buttonSelectAll.Location = New-Object System.Drawing.Point(140, 320)
$buttonSelectAll.Size = New-Object System.Drawing.Size(120, 30)
$buttonSelectAll.Text = "Select All"
$buttonSelectAll.Add_Click({
    foreach ($item in $listViewUsers.Items) {
        $item.Checked = $true
    }
})
$form.Controls.Add($buttonSelectAll)

# Create a button to update selected users
$buttonUpdateUsers = New-Object System.Windows.Forms.Button
$buttonUpdateUsers.Location = New-Object System.Drawing.Point(270, 320)
$buttonUpdateUsers.Size = New-Object System.Drawing.Size(120, 30)
$buttonUpdateUsers.Text = "Update Users"
$buttonUpdateUsers.Add_Click({
    $fqdn = $textboxFQDN.Text.Trim()
    $expirationDateText = $textboxExpirationDate.Text.Trim()

    if ([string]::IsNullOrWhiteSpace($fqdn)) {
        Show-ErrorMessage "Please enter the domain FQDN."
        return
    }

    try {
        $expirationDate = [datetime]::ParseExact($expirationDateText, "yyyy-MM-dd", $null)
    } catch {
        Show-ErrorMessage "Invalid date format. Please enter the date as yyyy-MM-dd."
        return
    }

    Update-ADUsers -fqdn $fqdn -expirationDate $expirationDate -listView $listViewUsers
})
$form.Controls.Add($buttonUpdateUsers)

# Create a button to close the window
$buttonClose = New-Object System.Windows.Forms.Button
$buttonClose.Location = New-Object System.Drawing.Point(450, 320)
$buttonClose.Size = New-Object System.Drawing.Size(120, 30)
$buttonClose.Text = "Close"
$buttonClose.Add_Click({
    $form.Close()
})
$form.Controls.Add($buttonClose)

# Show the form
$form.ShowDialog() | Out-Null

# End of script
