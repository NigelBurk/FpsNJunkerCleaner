# Define a function to run system scans
Function Run-Scans {
    # Run Antivirus scans
    Start-Process "powershell.exe" -ArgumentList 'Start-MpScan -ScanType QuickScan' -Wait

    # Run Malware scans
    Start-Process "powershell.exe" -ArgumentList 'Invoke-WebRequest -UseBasicParsing -Uri "https://www.malwarebytes.com/install/handler?affiliate=19900&gclid=Cj0KCQjw5J_8BRD-ARIsAIuYgEZlxBjW8uV7YFJbzNKh7E0uo6wu0v7UZq3UJi_rCGOjDY5Q5Y5M_0caAjzgEALw_wcB" -OutFile "C:\Malwarebytes_Installer.exe" -Verbose' -Wait
    Start-Process "C:\Malwarebytes_Installer.exe" -ArgumentList '/quiet' -Wait
    Start-Process "mbam.exe" -ArgumentList '-scan -scan-type 2' -Wait
}

# Call all functions
Clean-Up
Disk-Cleanup
Disk-Defragment
Update-Drivers
Run-Scans
