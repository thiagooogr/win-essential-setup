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
    winget install --id $app --source winget --silent --accept-package-agreements --accept-source-agreements
}

# Baixar Office Deployment Tool (ODT) da página oficial
$odtPage = "https://www.microsoft.com/en-us/download/details.aspx?id=49117"
$odtFile = "odt.exe"

Write-Host "Obtendo link mais recente do ODT..." -ForegroundColor Yellow

$response = Invoke-WebRequest -Uri $odtPage

# Extrai link real do download
$downloadLink = ($response.Links | Where-Object { $_.href -like "*.exe" } | Select-Object -First 1).href

if ($downloadLink) {
    Write-Host "Baixando Office Deployment Tool..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri $downloadLink -OutFile $odtFile

    if (Test-Path $odtFile) {
        Write-Host "Extraindo arquivos do ODT..." -ForegroundColor Yellow
        Start-Process ".\$odtFile" -ArgumentList "/quiet /extract:." -Wait
        Remove-Item $odtFile
    } else {
        Write-Host "Falha ao baixar ODT." -ForegroundColor Red
    }
} else {
    Write-Host "Não foi possível obter o link do ODT." -ForegroundColor Red
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