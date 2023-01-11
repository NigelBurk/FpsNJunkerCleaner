@echo off

rem Define a variable for the temp directory
set TEMP_DIR=%TEMP%

rem Clean up temporary files
del /f /s /q "%TEMP_DIR%\*"
del /f /s /q "%WINDIR%\Temp\*"

rem Run disk cleanup
cleanmgr /sagerun:1

rem Defragment the hard drive
defrag C:

rem Open Google search for updated drivers
start "" "https://www.google.com/search?q=updated+drivers"

rem Run Antivirus scan
start "" "powershell.exe" -c "Start-MpScan -ScanType QuickScan"

rem Run malware scan
start "" "https://www.malwarebytes.com/install/handler?affiliate=19900&gclid=Cj0KCQjw5J_8BRD-ARIsAIuYgEZlxBjW8uV7YFJbzNKh7E0uo6wu0v7UZq3UJi_rCGOjDY5Q5Y5M_0caAjzgEALw_wcB"
start "" "mbam.exe" -scan -scan-type 2
