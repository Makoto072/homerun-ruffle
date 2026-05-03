$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$url = "http://localhost:8000/"

$existing = Get-CimInstance Win32_Process |
  Where-Object { $_.Name -match "python(.exe)?" -and $_.CommandLine -match "http\.server 8000" -and $_.CommandLine -match [regex]::Escape($root) } |
  Select-Object -First 1

if (-not $existing) {
  Start-Process -FilePath "py.exe" `
    -ArgumentList "-m", "http.server", "8000" `
    -WorkingDirectory $root `
    -WindowStyle Hidden
  Start-Sleep -Seconds 2
}

Start-Process $url
Write-Output "Opened $url"
