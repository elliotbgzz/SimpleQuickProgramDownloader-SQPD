if (-Not (Test-Path -Path $dir)) {
    New-Item -Path $dir -ItemType Directory | Out-Null
    Write-Host "Directorio creado: $dir"
} else {
    Write-Host "El directorio ya existe: $dir"
}


# Chrome
$chromesetup = "$env:TEMP\ScriptInstallEsentials\ChromeSetup.msi"
Start-BitsTransfer `
  -Source "https://dl.google.com/chrome/install/GoogleChromeStandaloneEnterprise64.msi" `
  -Destination "$chromesetup"
Start-Process "msiexec.exe" `
  -ArgumentList "/i `"$chromesetup`" " `
  -Wait


# Steam
$steamsetup = "$env:TEMP\ScriptInstallEsentials\SteamSetup.exe"
Start-BitsTransfer `
  -Source "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe" `
  -Destination "$steamsetup"

Start-Process "$steamsetup" -Wait


# Discord
$discordsetup = "$env:TEMP\ScriptInstallEsentials\DiscordSetup.exe"
Start-BitsTransfer `
  -Source "https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x64" `
  -Destination "$discordsetup"

Start-Process "$discordsetup" -ArgumentList " " -Wait

# Blip
$blipsetup = "$env:TEMP\ScriptInstallEsentials\BlipSetup.exe"
Start-BitsTransfer `
  -Source "https://blip.net/download/windows" `
  -Destination "$blipsetup"

Start-Process "$blipsetup" -ArgumentList " " -Wait

# Spotify
$spotifysetup = "$env:TEMP\ScriptInstallEsentials\SpotifySetup.exe"
Start-BitsTransfer `
  -Source "https://download.scdn.co/SpotifySetup.exe" `
  -Destination "$spotifysetup"
Start-Process "$spotifysetup" -ArgumentList " " -Wait
