# Win 11 Essential Setup 🚀

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue)
![Platform](https://img.shields.io/badge/Platform-Windows-0078D6)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Stable-brightgreen)

Automação de instalação de softwares essenciais e Microsoft Office em ambientes Windows.

---

## 📌 Sobre o Projeto

Este projeto automatiza o provisionamento inicial de máquinas com Windows 11 utilizando **PowerShell**, **Winget** (Windows Package Manager) e a **Office Deployment Tool (ODT)**.

Com apenas um comando, o script instala aplicativos essenciais e o Microsoft Office de forma silenciosa, rápida e padronizada — ideal para formatações, setups novos ou ambientes corporativos.

---

## ✨ Funcionalidades

* Instalação automática de aplicativos essenciais via Winget
* Instalação silenciosa do Microsoft Office 2024
* Download dinâmico da Office Deployment Tool (ODT) direto da Microsoft
* Execução com verificação de privilégios administrativos
* Processo totalmente automatizado (sem interação do usuário)
* Fácil personalização de aplicativos e pacote Office

---

## 📁 Estrutura do Projeto

```bash
.
├── install.ps1
├── configuration.xml
```

---

## ⚙️ Requisitos

* Windows 11
* Winget instalado
* PowerShell 5.1 ou superior
* Execução como Administrador
* Conexão com a internet

---

## 🚀 Como Executar

```bash
git clone https://github.com/thiagooogr/win-essential-setup.git
cd win-essential-setup
```

```powershell
.\install.ps1
```

---

## ⚠️ Possíveis Problemas e Soluções

### 🔒 Execution Policy

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

---

### 🔓 Arquivo bloqueado

```powershell
Unblock-File .\install.ps1
```

---

## 🛠️ Personalização

### ➕ Adicionar aplicativos

```bash
winget search "nome do app"
```

Exemplo:

```bash
winget search discord
```

Resultado:

```
Discord     Discord.Discord
```

Adicionar no script:

```powershell
$apps = @(
    "Google.Chrome",
    "RARLab.WinRAR",
    "Adobe.Acrobat.Reader.64-bit",
    "Discord.Discord"
)
```

---

## 🧩 Customizar instalação do Office

Arquivo:

```
configuration.xml
```

---

### 📌 Estrutura base

```xml
<Configuration>
  <Add OfficeClientEdition="64" Channel="PerpetualVL2024">
    <Product ID="ProPlus2024Volume">
      <Language ID="pt-br" />
      <ExcludeApp ID="Teams" />
      <ExcludeApp ID="Outlook" />
    </Product>
  </Add>
</Configuration>
```

---

### ➕ Incluir aplicativos

Remova a linha:

```xml
<ExcludeApp ID="Outlook" />
```

---

### ➖ Excluir aplicativos

```xml
<ExcludeApp ID="Access" />
<ExcludeApp ID="Publisher" />
```

---

### 🌐 Alterar idioma

```xml
<Language ID="en-us" />
```

**Exemplos:**

* `pt-br` → Português (Brasil)
* `en-us` → Inglês
* `es-es` → Espanhol

---

### 🏢 Alterar edição do Office

```xml
<Product ID="ProPlus2024Volume">
```

**Outras opções comuns:**

* `ProPlus2021Volume`
* `O365ProPlusRetail`

---

### 📡 Canal de instalação

```xml
Channel="PerpetualVL2024"
```

**Opções:**

* `PerpetualVL2024` → Licença de volume (estável)
* `Current` → Sempre atualizado
* `MonthlyEnterprise` → Atualizações controladas

---

💡 **Boas práticas:**

* Use canais estáveis em ambientes corporativos
* Instale apenas os aplicativos necessários
* Valide o XML antes de executar

---

## 🔍 Detalhes Técnicos

* Verificação de privilégios administrativos
* Instalação silenciosa via Winget
* Download dinâmico do ODT
* Execução sequencial

---

## 📄 Licença

MIT

---

## ⭐

Se este projeto te ajudou, considere dar uma estrela ⭐
