function Get-DefaultBrowser {
  $BrowserProgId = (Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice').ProgId
  $BrowserPath = (Get-ItemProperty "HKLM:\Software\Classes\$BrowserProgId\shell\open\command\").'(default)'

  # Remove any command line parameters
  if ($BrowserPath -match '^(\"?[^\"]+\"?)') {
    $BrowserPath = $matches[1]
  }

  return $BrowserPath
}

$Browser = Get-DefaultBrowser

if($Browser) {
  Start-Process $Browser
} else {
  Write-Host "No default browser found"
  exit 1
}
