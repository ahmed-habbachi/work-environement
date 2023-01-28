# work-environement

This repo will hold my linux and windows work environement.

## Linux (ubuntu 22.04)

To install all the applications listed on the script use:

```shell
curl -s https://raw.githubusercontent.com/ahmed-habbachi/work-environement/main/linux/apps-to-install.sh | bash
```

Or download the script and add/remove the applications as you want then just:

```shell
sudo ./apps-to-install.sh 
```

## Windows

To install all the applications listed on the script you need to allow executing scripts on windows by running this command:

```cmd
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

then

```cmd
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ahmed-habbachi/work-environement/main/windows/apps-to-install.ps1'))
```

Or download the script and add/remove the applications as you want then just:

```shell
./apps-to-install.ps1
```
