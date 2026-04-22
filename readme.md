# Win Essential Setup 🚀

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue)
![Platform](https://img.shields.io/badge/Platform-Windows-0078D6)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Stable-brightgreen)

Automação de instalação de softwares essenciais e Microsoft Office em ambientes Windows.

---

## 📌 Sobre o Projeto

Este projeto automatiza o provisionamento inicial de máquinas Windows utilizando **PowerShell**, **Winget** (Windows Package Manager) e a **Office Deployment Tool (ODT)**.

Com apenas um comando, é possível instalar aplicativos essenciais e o Microsoft Office de forma silenciosa, rápida e padronizada — ideal para formatações, setups novos ou ambientes corporativos.

---

## ✨ Funcionalidades

* Instalação automática de aplicativos essenciais via Winget
* Instalação silenciosa do Microsoft Office 2024
* Download automático da Office Deployment Tool (ODT)
* Execução com verificação de privilégios administrativos
* Processo totalmente automatizado (sem interação do usuário)
* Fácil personalização de aplicativos e pacote Office

---

## 📁 Estrutura do Projeto

```bash
.
├── install.ps1          # Script principal de automação
├── configuration.xml    # Configuração da instalação do Office
```

---

## ⚙️ Requisitos

* Windows 10 ou Windows 11
* Winget instalado (já incluso em versões recentes do Windows)
* PowerShell 5.1 ou superior
* Execução como Administrador
* Conexão com a internet (para download dos pacotes e ODT)

---

## 🚀 Como Executar

1. Clone o repositório:

```bash
git clone https://github.com/SEU-USUARIO/win-essential-setup.git
cd win-essential-setup
```

2. Execute o script no PowerShell como Administrador:

```powershell
.\install.ps1
```

> ⚠️ O script irá baixar automaticamente a Office Deployment Tool (ODT) durante a execução.

---

## 🛠️ Personalização

### ➕ Adicionar novos aplicativos

1. Descubra o ID do aplicativo:

```bash
winget search "nome do app"
```

2. Adicione no array `$apps` dentro do `install.ps1`:

```powershell
$apps = @(
    "Google.Chrome",
    "RARLab.WinRAR",
    "Microsoft.VisualStudioCode"
)
```

---

### 🧩 Customizar instalação do Office

Edite o arquivo `configuration.xml`.

Exemplo:

* Para instalar o Outlook:

  * Remova: `<ExcludeApp ID="Outlook" />`

* Para instalar o Teams:

  * Remova: `<ExcludeApp ID="Teams" />`

📌 Canal atual:

```
PerpetualVL2024
```

Ideal para ambientes corporativos e estabilidade de longo prazo.

---

## 🔍 Detalhes Técnicos

* Verificação de privilégios administrativos antes da execução
* Instalação silenciosa via Winget
* Execução sequencial para evitar conflitos
* Download automático do ODT diretamente da Microsoft
* Extração automática do `setup.exe` durante a execução

---

## 📸 Exemplo de Execução

```bash
--- Iniciando instalacao de programas basicos ---
Instalando: Google.Chrome...
Instalando: RARLab.WinRAR...
Instalando: Adobe.Acrobat.Reader.64-bit...
Baixando Office Deployment Tool...
Extraindo arquivos do ODT...
Iniciando instalacao do Office 2024...
--- Processo concluido com sucesso! ---
```

---

## 📄 Licença

Este projeto está sob a licença MIT.
Sinta-se livre para usar, modificar e distribuir.

---

## 🤝 Contribuição

Contribuições são bem-vindas!

Se quiser melhorar o projeto:

* Abra uma issue
* Envie um pull request
* Sugira novas funcionalidades

---

## ⭐ Considerações

Se este projeto te ajudou, considere dar uma estrela ⭐ no repositório!
