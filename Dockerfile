FROM mcr.microsoft.com/windows/servercore:ltsc2019
RUN Invoke-WebRequest https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-windows-amd64.zip -OutFile ngrok.zip
    Expand-Archive ngrok.zip
    Remove-Item -Path ngrok.zip
    Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value 0
    Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
    Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -name "UserAuthentication" -Value 1
    Set-LocalUser -Name "runneradmin" -Password (ConvertTo-SecureString -AsPlainText "Hoainam2001" -Force)
