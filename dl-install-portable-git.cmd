@echo off

SET PGITURL=https://github.com/git-for-windows/git/releases/download/v2.54.0.windows.1/PortableGit-2.54.0-64-bit.7z.exe
SET PGITTARGET=c:\Utilities\PortableGit
SET REPO=https://github.com/dancostello70/Training-Resources

echo Downloading Portable Git from %PGITURL%...
powershell -Command "Invoke-WebRequest -Uri '%PGITURL%' -OutFile 'PortableGit-2.54.0-64-bit.7z.exe'"
if %ERRORLEVEL% neq 0 (
    echo Failed to download Portable Git. Please check your internet connection and try again.
    exit /b 1
)

:: If c:\Utilities does not exist, create it
if not exist "c:\Utilities" (
    mkdir "c:\Utilities"
)

:: The downloaded file is an executable that extracts the Portable Git files.
echo Extracting Portable Git... 
PortableGit-2.54.0-64-bit.7z.exe -o%PGITTARGET% -y
if %ERRORLEVEL% neq 0 (
    echo Failed to extract Portable Git. Please check the downloaded file and try again.
    exit /b 1
)

echo Portable Git has been successfully downloaded and extracted to %PGITTARGET%
echo You can add %PGITTARGET%\cmd to your PATH environment variable to use Git from the command line.
echo To add it to your PATH, you can run the following command in PowerShell:
echo [Environment]::SetEnvironmentVariable('Path', $env:Path + ';%PGITTARGET%\cmd', [EnvironmentVariableTarget]::User)
echo After running the above command, restart your command prompt or PowerShell to apply the changes.

:: Clone repo to c:\Utilities\Training-Resources
echo Cloning repository from %REPO% to c:\Utilities\Training-Resources...
%PGITTARGET%\cmd\git clone %REPO% c:\Utilities\Training-Resources
if %ERRORLEVEL% neq 0 (
    echo Failed to clone the repository. Please check your internet connection and try again.
    exit /b 1
)