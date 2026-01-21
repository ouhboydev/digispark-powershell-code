Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# ======================
# FORM FULLSCREEN
# ======================
$form = New-Object System.Windows.Forms.Form
$form.Text = "SOC Security Awareness Console"
$form.WindowState = "Maximized"
$form.FormBorderStyle = "None"
$form.TopMost = $true
$form.BackColor = [System.Drawing.Color]::Black
$form.ForeColor = [System.Drawing.Color]::Lime
$form.Font = New-Object System.Drawing.Font("Consolas", 11)
$form.KeyPreview = $true

# ======================
# TERMINAL
# ======================
$terminal = New-Object System.Windows.Forms.TextBox
$terminal.Multiline = $true
$terminal.ReadOnly = $true
$terminal.Dock = "Fill"
$terminal.ScrollBars = "Vertical"
$terminal.BackColor = [System.Drawing.Color]::Black
$terminal.ForeColor = [System.Drawing.Color]::Lime
$terminal.BorderStyle = "None"
$terminal.Font = $form.Font
$form.Controls.Add($terminal)

# ======================
# FUNÇÕES SEGURAS
# ======================
function Write-Terminal {
    param ($Text, $Delay = 15)

    foreach ($c in $Text.ToCharArray()) {
        $terminal.AppendText($c)
        Start-Sleep -Milliseconds $Delay
        [System.Windows.Forms.Application]::DoEvents()
    }
}

function Write-Log {
    param ($Level, $Message)
    $ts = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    Write-Terminal "[$ts] [$Level] $Message`r`n" 5
}

# ======================
# SAIR COM ESC
# ======================
$form.Add_KeyDown({
    if ($_.KeyCode -eq 'Escape') {
        $form.Close()
    }
})

# ======================
# TIMER DE LOGS
# ======================
$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 2500
$timer.Add_Tick({
    $events = @(
        "Endpoint protection active",
        "Email security operational",
        "No threats detected",
        "User behavior monitored",
        "MFA enforcement validated"
    )
    Write-Log "INFO" ($events | Get-Random)
})

# ======================
# EVENTO LOAD (INÍCIO)
# ======================
$form.Add_Shown({

    Write-Terminal "Initializing SOC Security Awareness Console...`r`n`r`n" 20

    Write-Log "INFO" "Loading security modules"
    Write-Log "INFO" "Checking endpoint posture"
    Write-Log "OK"   "Environment secure"

    Write-Terminal "`r`n--- SECURITY AWARENESS ---`r`n`r`n" 15

    $msg = @"
A segurança da informação é uma responsabilidade compartilhada.

Principais riscos:
- Phishing
- Senhas fracas
- Falta de MFA
- Sistemas desatualizados
- USBs desconhecidos

Ferramentas ajudam.
Usuários conscientes protegem.

SOC - Security Operations Center
"@

    Write-Terminal $msg 18

    Write-Terminal "`r`nPressione ESC para encerrar...`r`n" 10

    $timer.Start()
})

# ======================
# RUN
# ======================
[System.Windows.Forms.Application]::Run($form)
