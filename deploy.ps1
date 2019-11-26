#create tmp directory for deployment operations
mkdir -Force "C:\Temp\Deploy"
cd "C:\Temp\Deploy"

#DL and install firefox
wget "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US" -OutFile firefox.exe
Start-Process -Wait -Filepath "C:\Temp\Deploy\firefox.exe" -ArgumentList "/s" -PassThru

#DL and install laragon web server
wget https://github.com/leokhoa/laragon/releases/download/4.0.15/laragon-full.exe -OutFile laragon.exe
Start-Process -Wait -Filepath "C:\Temp\Deploy\laragon.exe" -ArgumentList "/SILENT" -PassThru

#DL and install openjdk 8 
wget "https://github.com/ojdkbuild/ojdkbuild/releases/download/java-1.8.0-openjdk-1.8.0.232-1.b09/java-1.8.0-openjdk-1.8.0.232-1.b09.ojdkbuild.windows.x86_64.msi" -OutFile openjdk8.msi
#TODO downloads fine, but doesn't install as intended, need to find right switches
#msiexec.exe /qn /i .\openjdk8.msi

#DL and "install" mock app
mkdir -Force "C:\laragon\www\mockapp"
cd "C:\laragon\www\mockapp"
wget https://github.com/FynnFreyer/mockapp/raw/master/mockapp.zip -OutFile mockapp.zip
Expand-Archive ".\mockapp.zip" -DestinationPath "..\"
rm mockapp.zip




<#
TODO
install java, eclipse and selenium

ojdk8 dl link:
https://github.com/ojdkbuild/ojdkbuild/releases/download/java-1.8.0-openjdk-1.8.0.232-1.b09/java-1.8.0-openjdk-1.8.0.232-1.b09.ojdkbuild.windows.x86_64.msi

eclipse dl link: (play with mirror id?)
https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2019-09/R/eclipse-jee-2019-09-R-win32-x86_64.zip&mirror_id=96

selenium  java client dl link:
https://bit.ly/2zm3ZzF

ie webdriver dl link:
https://selenium-release.storage.googleapis.com/3.150/IEDriverServer_Win32_3.150.1.zip

chrome webdriver dl link:
https://chromedriver.storage.googleapis.com/index.html?path=78.0.3904.105/

add progs to path
jdk + sel + driver

auto allow laragon firewall 
start service

https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US
wget "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US" -OutFile firefox.exe

chrome dl oneliner stolen from https://www.ryadel.com/en/install-google-chrome-with-powershell-script/
$LocalTempDir = $env:TEMP; $ChromeInstaller = "ChromeInstaller.exe"; (new-object System.Net.WebClient).DownloadFile('http://dl.google.com/chrome/install/375.126/chrome_installer.exe', "$LocalTempDir\$ChromeInstaller"); & "$LocalTempDir\$ChromeInstaller" /silent /install; $Process2Monitor =  "ChromeInstaller"; Do { $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; If ($ProcessesFound) { "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 } else { rm "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose } } Until (!$ProcessesFound)
#>