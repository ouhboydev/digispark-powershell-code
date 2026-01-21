Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# ================================
# CONFIGURAÇÕES VISUAIS
# ================================
$bgColor   = [System.Drawing.Color]::Black
$textColor = [System.Drawing.Color]::Lime
$font      = New-Object System.Drawing.Font("Consolas", 11)

# ================================
# FORM PRINCIPAL (FULLSCREEN)
# ================================
$form = New-Object System.Windows.Forms.Form
$form.Text = "SOC TERMINAL - SECURITY AWARENESS"
$form.WindowState = "Maximized"
$form.FormBorderStyle = "None"
$form.TopMost = $true
$form.BackColor = $bgColor
$form.ForeColor = $textColor
$form.Font = $font
$form.Icon = [System.Drawing.SystemIcons]::Shield

# ================================
# TEXTBOX TERMINAL
# ================================
$terminal = New-Object System.Windows.Forms.TextBox
$terminal.Multiline = $true
$terminal.ReadOnly = $true
$terminal.ScrollBars = "Vertical"
$terminal.Dock = "Fill"
$terminal.BackColor = $bgColor
$terminal.ForeColor = $textColor
$terminal.BorderStyle = "None"
$terminal.Font = $font
$form.Controls.Add($terminal)

# ================================
# FUNÇÃO: EFEITO DE DIGITAÇÃO
# ================================
function Write-Terminal {
    param (
        [string]$Text,
        [int]$Delay = 20
    )

    foreach ($char in $Text.ToCharArray()) {
        $terminal.AppendText($char)
        Start-Sleep -Milliseconds $Delay
        $terminal.Refresh()
    }
}

# ================================
# FUNÇÃO: LOG SOC
# ================================
function Write-Log {
    param (
        [string]$Level,
        [string]$Message
    )

    $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    Write-Terminal "[$timestamp] [$Level] $Message`r`n" 5
}

# ================================
# INICIALIZAÇÃO
# ================================
$form.Show()
$form.Refresh()

Write-Terminal "Initializing SOC Security Awareness Console...`r`n`r`n" 15
Start-Sleep 1

Write-Log "INFO"  "Loading security modules"
Start-Sleep 1
Write-Log "INFO"  "Checking endpoint posture"
Start-Sleep 1
Write-Log "INFO"  "Validating user security awareness baseline"
Start-Sleep 1
Write-Log "OK"    "All systems operational"
Start-Sleep 1

Write-Terminal "`r`n--- SECURITY AWARENESS MESSAGE ---`r`n`r`n" 15

# ================================
# MENSAGEM PRINCIPAL
# ================================
$mensagem = @"
Prezado usuário,

A segurança da informação é uma responsabilidade compartilhada.

A maioria dos incidentes de segurança ocorre por:
- Phishing
- Senhas fracas
- Falta de MFA
- Sistemas desatualizados
- Uso de dispositivos USB desconhecidos

Ferramentas como FortSecure e Kaspersky fornecem
camadas avançadas de proteção, porém:

>>> O USUÁRIO CONTINUA SENDO O PRINCIPAL ELEMENTO DE DEFESA <<<

Pratique segurança. Questione. Reporte.

SOC - Security Operations Center
"@

Write-Terminal $mensagem 18

# ================================
# LOGS FINAIS
# ================================
Start-Sleep 1
Write-Log "INFO" "Security awareness message delivered successfully"
Write-Log "INFO" "Monitoring continues..."

# ================================
# TECLA PARA SAIR (STEALTH)
# ================================
Write-Terminal "`r`nPressione ESC para encerrar a sessão..." 10

$form.KeyPreview = $true
$form.Add_KeyDown({
    if ($_.KeyCode -eq "Escape") {
        $form.Close()
    }
})

# ================================
# LOOP DE LOGS (SIMULAÇÃO SOC)
# ================================
$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 2500
$timer.Add_Tick({
    $events = @(
        "User behavior monitored",
        "No suspicious activity detected",
        "Email filtering operational",
        "Endpoint protected",
        "MFA enforcement active"
    )
    $msg = $events | Get-Random
    Write-Log "INFO" $msg
})
$timer.Start()

[System.Windows.Forms.Application]::Run($form)
