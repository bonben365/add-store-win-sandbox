
# Add Windows Store into Windows Sanbox




## Requirements

- Run the script as administrator using PowerShell
- Windows 10 version 1709 and later
  
## Installation

- Right click on the Windows Start icon 🪟 then select Windows PowerShell (Admin).
- Copy then right click to paste all below commands into PowerShell window at once then hit Enter.
- Allow system to running a script https://go.microsoft.com/fwlink/?LinkID=135170

```ps
Set-ExecutionPolicy Bypass -Scope Process -Force
$url="https://github.com/bonben365/add-store-win-sandbox/raw/main/install.ps1"
iex ((New-Object System.Net.WebClient).DownloadString($url))
```
➡️Please inspect [https://raw.githubusercontent.com/bonben365/add-store-win-sandbox/main/install.ps1](https://raw.githubusercontent.com/bonben365/add-store-win-sandbox/main/install.ps1) prior to running any of these scripts to ensure safety. We already know it's safe, but you should verify the security and contents of any script from the internet you are not familiar with.

## Screenshots

![App Screenshot](https://s3.amazonaws.com/s3.bonben365.com/files/2023/b9CLMjMxxfzks7hFUrjHpPBiyFPOGjGQVawPAZZGk9wAkFHyij3yq7Kjl2WX.jpg)

![App Screenshot](https://s3.amazonaws.com/s3.bonben365.com/files/2023/vPvb9WHBpInz6Z0LSSRPpChEdrITY0YfXvNOvGNC7finthFKlSZNlYwvM03n.jpg)


## Documentation

[🌍https://bonben365.com/](https://bonben365.com/)

