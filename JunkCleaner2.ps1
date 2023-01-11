# Define a function to remove bloatware
Function Remove-Bloatware {
    # List of bloatware to remove
    $Bloatware = @("Xbox","OneDrive","Skype","CandyCrushSodaSaga","Minecraft")

    # Remove bloatware using Get-AppxPackage and Remove-AppxPackage
    foreach ($App in $Bloatware) {
        $app = Get-AppxPackage *$App*
        if ($app) {
            Remove-AppxPackage -Package $app.Name
        }
    }
}

# Define a function to install useful tools and utilities
Function Install-UsefulTools {
    # Install Chocolatey package manager
    Install-PackageProvider -Name Chocolatey

    # Use Chocolatey to install useful tools
    $Tools = "7zip","ccleaner","notepadplusplus","autohotkey","f.lux"
    foreach ($Tool in $Tools) {
        Install-Package -Name $Tool -Force
    }
}

# Call all functions
Clean-Up
Update-System
Remove-Bloatware
Install-UsefulTools
Reset-System
Reset-Settings
Restart-Computer
