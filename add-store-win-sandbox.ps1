if (([Security.Principal.WindowsIdentity]::GetCurrent().Groups | Select-String 'S-1-5-32-544').count -eq 0) {    
    Write-Host "Error: Run the script as administrator"
    Write-Host "Exitting..."
    Start-Sleep -Seconds 3
    exit
}

if ([System.Environment]::OSVersion.Version.Build -lt 16299) {
    Write-Host "This pack is for Windows 10 version 1709 and later"
    Write-Host "Exitting..."
    Start-Sleep -Seconds 3
    exit
}

# Create temporary directory
$null = New-Item -Path $env:temp\kms -ItemType Directory -Force
Set-Location $env:temp\kms

# Download required files
$uri = "https://filedn.com/lOX1R8Sv7vhpEG9Q77kMbn0/bonben365.com/Zip/microsoftstore-win-ltsc.zip"
$null = Invoke-WebRequest -Uri $uri -OutFile "microsoftstore-win-ltsc.zip" -ErrorAction:SilentlyContinue

# Extract downloaded file then run the script
Expand-Archive .\microsoftstore-win-ltsc.zip -Force -ErrorAction:SilentlyContinue
Set-Location "$env:temp\kms\microsoftstore-win-ltsc"

if ([System.Environment]::Is64BitOperatingSystem -like "True") {
    $arch = "x64"
}
else
{
    $arch = "x86"
}

if (!(Get-ChildItem "*WindowsStore*")) {    
    Write-Host "Error: Required files are missing in the current directory"
    Write-Host "Exitting..."
    Start-Sleep -Seconds 3
    exit
}
else {
    $packages = Get-ChildItem "*WindowsStore*"
}

if ((Get-ChildItem "*StorePurchaseApp*")) {    
    $packages += Get-ChildItem "*StorePurchaseApp*"
    
}

if ((Get-ChildItem "*DesktopAppInstaller*")) {    
    $packages += Get-ChildItem "*DesktopAppInstaller*"
    
}

if ((Get-ChildItem "*XboxIdentityProvider*")) {    
    $packages += Get-ChildItem "*XboxIdentityProvider*"
    
}

Write-Host
Write-Host ============================================================
Write-Host Installing dependency packages
Write-Host ============================================================
Write-Host

$depens = Get-ChildItem | Where-Object { $_.Name -match '^*Microsoft.NET.Native*|^*VCLibs*' }
foreach ($depen in $depens) {
    Add-AppxPackage -Path .\"$depen" -ErrorAction:SilentlyContinue
}



if ((Get-ChildItem "*WindowsStore*")) {

Write-Host
Write-Host ============================================================
Write-Host Adding Microsoft Store
Write-Host ============================================================
Write-Host
   
Add-AppxProvisionedPackage -Online
    -PackagePath Get-ChildItem | Where-Object { ($_.Name -like '*WindowsStore*') -and ($_.Name -like '*AppxBundle*') }  
    -LicensePath Get-ChildItem | Where-Object { ($_.Name -like '*WindowsStore*') -and ($_.Name -like '*xml*') }

}
