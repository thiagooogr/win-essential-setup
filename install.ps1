# 1. Garantir privilégios de Administrador
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Por favor, execute este script como Administrador!" -ForegroundColor Red
    Pause
    Exit
}

Write-Host "--- Iniciando instalacao de programas basicos ---" -ForegroundColor Cyan

# 2. Instalar programas via Winget
# IDs: Google Chrome, WinRAR, Adobe Acrobat Reader
$apps = @(
    "Google.Chrome",
    "RARLab.WinRAR",
    "Adobe.Acrobat.Reader.64-bit"
)

foreach ($app in $apps) {
    Write-Host "Instalando: $app..." -ForegroundColor Yellow
    winget install --id $app --silent --accept-package-agreements --accept-source-agreements
}

# 3. Baixar e preparar Office Deployment Tool (ODT)
$odtUrl = "https://download.microsoft.com/download/1/7/5/175F7BBA-6C7A-4E2E-BE58-7B8D9B7D6F66/officedeploymenttool.exe"
$odtFile = "odt.exe"

if (!(Test-Path ".\setup.exe")) {
    Write-Host "Baixando Office Deployment Tool..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri $odtUrl -OutFile $odtFile

    Write-Host "Extraindo arquivos do ODT..." -ForegroundColor Yellow
    Start-Process ".\$odtFile" -ArgumentList "/quiet /extract:." -Wait

    Remove-Item $odtFile
}

# 4. Instalar Office via ODT
# Certifique-se que o setup.exe e o configuration.xml estao na mesma pasta do script
if (Test-Path ".\setup.exe") {
    Write-Host "Iniciando instalacao do Office 2024..." -ForegroundColor Yellow
    Start-Process ".\setup.exe" -ArgumentList "/configure .\configuration.xml" -Wait
} else {
    Write-Host "Arquivo setup.exe do Office nao encontrado na pasta!" -ForegroundColor Red
}

Write-Host "--- Processo concluido com sucesso! ---" -ForegroundColor Green
Pause