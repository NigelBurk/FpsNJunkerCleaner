# Define a function to clean up temporary files and folders
Function Clean-TemporaryFiles {
    $TempFolders = @("C:\Windows\Temp","C:\Temp")
    foreach ($Folder in $TempFolders) {
        if (Test-Path $Folder) {
            Remove-Item $Folder -Recurse -Force
        }
    }
}

# Define a function to disable unnecessary startup programs
Function Disable-StartupPrograms {
    $StartupPrograms = Get-StartupProgram
    foreach ($Program in $StartupPrograms) {
        if ($Program.name -notmatch "Microsoft|Windows|Anti-Virus") {
            Disable-StartupProgram $Program.name
        }
    }
}

# Define a function to adjust settings to optimize performance
Function Optimize-Performance {
    # Adjust visual effects settings
    $CurrentSetting = Get-PerformanceOption -VisualEffect
    Set-PerformanceOption -VisualEffect AdjustForBestPerformance

    # Adjust power plan
    $CurrentPowerPlan = Get-PowerPlan
    Set-PowerPlan -PowerPlan HighPerformance
}

# Define a function to schedule regular maintenance tasks
Function Schedule-Maintenance {
    # Schedule disk cleanup to run weekly
    $Trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Monday
    $Action = New-ScheduledTaskAction -Execute "cleanmgr.exe"
    Register-ScheduledTask -TaskName "Disk Cleanup" -Trigger $Trigger -Action $Action

    # Schedule disk defrag to run monthly
    $Trigger = New-ScheduledTaskTrigger -Monthly -DaysOfWeek 1
    $Action = New-ScheduledTaskAction -Execute "defrag.exe"
    Register-ScheduledTask -TaskName "Disk Defrag" -Trigger $Trigger -Action $Action
}

# Define a function to close memory-intensive programs running in the background
Function Close-BackgroundPrograms {
    $BackgroundPrograms = Get-Process | Where-Object {$_.PriorityClass -eq "High"}
    foreach ($Program in $BackgroundPrograms) {
        Stop-Process $Program.Id -Force
    }
}

# Call all functions
Clean-TemporaryFiles
Disable-StartupPrograms
Optimize-Performance
Schedule-Maintenance
Close-BackgroundPrograms
