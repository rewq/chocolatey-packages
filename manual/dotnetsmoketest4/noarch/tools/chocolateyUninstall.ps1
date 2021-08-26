$shortcutFilePath = "$ENV:UserProfile\Desktop\.net SmokeTest 4.0.lnk"
If (Test-Path -Path $shortcutFilePath) {
  Remove-Item -Path $shortcutFilePath -Force
}