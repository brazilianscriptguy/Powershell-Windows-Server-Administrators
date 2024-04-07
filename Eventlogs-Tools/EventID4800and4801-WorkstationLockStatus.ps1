﻿# PowerShell Script for Processing Windows Event Log Files - Event ID 4800 and 4801 (Locked and Unlocked Workstation)
# Author: Luiz Hamilton Silva - @brazilianscriptguy
# Updated: April 7, 2024

Param(
    [Bool]$AutoOpen = $true
)

# Import necessary assembly for OpenFileDialog
Add-Type -AssemblyName System.Windows.Forms

# Creating OpenFileDialog object with filter for .evtx files
$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenFileDialog.Filter = "Event Log files (*.evtx)|*.evtx"

# Displaying OpenFileDialog and getting the file path
if ($OpenFileDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
    $LogFilePath = $OpenFileDialog.FileName
    $DefaultFolder = [Environment]::GetFolderPath("MyDocuments")
    $timestamp = Get-Date -Format "yyyyMMddHHmmss"
    $Destination = Join-Path $DefaultFolder "EventID4800and4801-WorkstationLockStatus_$timestamp.csv"

    $LogQuery = New-Object -ComObject "MSUtil.LogQuery"
    $InputFormat = New-Object -ComObject "MSUtil.LogQuery.EventLogInputFormat"
    $OutputFormat = New-Object -ComObject "MSUtil.LogQuery.CSVOutputFormat"

    $SQLQuery = @"
SELECT timegenerated AS DateTime, 
       eventid AS EventID,
       Extract_token(strings, 0, '|') AS UserAccount, 
       Extract_token(strings, 4, '|') AS LockoutCode, 
       Extract_token(strings, 6, '|') AS StationIP,
       CASE eventid 
           WHEN 4800 THEN 'Lock'
           WHEN 4801 THEN 'Unlock'
       END AS EventType
INTO '$Destination' 
FROM '$LogFilePath' 
WHERE eventid = 4800 OR eventid = 4801
"@
    $LogQuery.ExecuteBatch($SQLQuery, $InputFormat, $OutputFormat)

    if ($AutoOpen) {
        try {
            Start-Process $Destination
        } catch {
            Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
            Write-Host "No output file created if the query returned zero records!" -ForegroundColor Gray
        } 
    }
} else {
    Write-Host "No file selected."
}

#End of script
