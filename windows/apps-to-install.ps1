echo "First Runing scripts on your machine should be granted."
echo "Run this command 'Set-ExecutionPolicy Unrestricted'"
Set-ExecutionPolicy RemoteSigned
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
echo "Enable global confirmation to install without confirmation"
choco feature enable -n allowGlobalConfirmation
echo "Installing Software and packages"
choco install microsoft-windows-terminal
choco install git ilspy curl openvpn
choco install powershell-core
choco install 7zip.install
choco install googlechrome
choco install firefox
choco install notepadplusplus.install
choco install bitwarden
choco install sql-server-management-studio
choco install postman
choco install dbeaver
choco install insomnia-rest-api-client
choco install filezilla
choco install notion
choco install python
choco install nvm
C:\ProgramData\nvm\nvm install 16
C:\ProgramData\nvm\nvm use 16
echo "Installation is finished Software and packages"
echo "Run nvm use 16.4.0"
echo "Disable global confirmation"
choco feature disable -n allowGlobalConfirmation
echo "A restart is needed"
npm install -g windows-build-tools
read-Host -Prompt "Press Enter to exit"