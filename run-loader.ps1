<#
.SYNOPSIS
  Descarga y ejecuta Windows Loader v2.2.2 (Windows 7)
.NOTAS
  Ejecutar como Administrador
#>

$ErrorActionPreference = 'Stop'
$releaseUrl = 'https://github.com/clickinformaticavillaramallo/activador-w7/releases/download/1/Windows_Loader.exe'
$dest       = "$env:TEMP\Windows_Loader.exe"

Write-Host "[*] Descargando Windows Loader..." -ForegroundColor Yellow
try {
    Invoke-WebRequest -Uri $releaseUrl -OutFile $dest -UseBasicParsing
} catch {
    Write-Warning "No se pudo descargar: $_"
    exit 1
}

if (!(Test-Path $dest)) {
    Write-Warning "El archivo no se descargó correctamente."
    exit 1
}

Write-Host "[*] Ejecutando Windows Loader..." -ForegroundColor Green
Start-Process -FilePath $dest -Wait -NoNewWindow

Remove-Item $dest -Force -ErrorAction SilentlyContinue
Write-Host "[+] Listo." -ForegroundColor Green