Add-Type -AssemblyName System.Windows.Forms

[System.Media.SystemSounds]::Asterisk.Play()

$mensagem = @"
---

ATENÇÃO

Seu ambiente está vulnerável no momento.

Riscos identificados sem proteção ativa:
• Phishing e anexos maliciosos – principal vetor de invasão
• Credenciais fracas ou reutilizadas – acesso fácil a contas críticas
• Ausência de autenticação em dois fatores (2FA) – perda total com vazamento de senha
• Softwares e sistema desatualizados – exploração por vulnerabilidades conhecidas

A proteção imediata é essencial para mitigar esses riscos.
"@

# Caracteres sensíveis via código (evita problemas de layout ABNT2/US)
$colon = [char]58          # :
$slash = [char]47          # /
$httpsPrefix = 'https' + $colon + $slash + $slash

$form                  = New-Object System.Windows.Forms.Form
$form.FormBorderStyle  = [System.Windows.Forms.FormBorderStyle]::None
$form.WindowState      = [System.Windows.Forms.WindowState]::Maximized
$form.TopMost          = $true
$form.ShowInTaskbar    = $false
$form.BackColor        = [System.Drawing.Color]::FromArgb(245, 245, 247)
$form.Bounds           = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds

$picture = New-Object System.Windows.Forms.PictureBox
$picture.Image       = [System.Drawing.SystemIcons]::Warning.ToBitmap()
$picture.SizeMode    = [System.Windows.Forms.PictureBoxSizeMode]::StretchImage
$picture.Size        = New-Object System.Drawing.Size(90,90)
$picture.Location    = New-Object System.Drawing.Point( ($form.Width/2 - 45), 80 )
$form.Controls.Add($picture)

$lblTitulo = New-Object System.Windows.Forms.Label
$lblTitulo.Text       = "ALERTA DE SEGURANÇA CRÍTICO"
$lblTitulo.AutoSize   = $true
$lblTitulo.Font       = New-Object System.Drawing.Font("Segoe UI Semibold", 32, [System.Drawing.FontStyle]::Bold)
$lblTitulo.ForeColor  = [System.Drawing.Color]::FromArgb(220, 53, 69)  # Vermelho suave
$lblTitulo.TextAlign  = [System.Drawing.ContentAlignment]::MiddleCenter
$form.Controls.Add($lblTitulo)

$label = New-Object System.Windows.Forms.Label
$label.Text       = $mensagem
$label.AutoSize   = $false
$label.Size       = New-Object System.Drawing.Size( ($form.Width - 300), 320 )
$label.Location   = New-Object System.Drawing.Point( ($form.Width/2 - ($label.Width/2)), 280 )
$label.Font       = New-Object System.Drawing.Font("Segoe UI", 14)
$label.ForeColor  = [System.Drawing.Color]::FromArgb(33, 37, 41)
$label.TextAlign  = [System.Drawing.ContentAlignment]::MiddleCenter
$form.Controls.Add($label)

$btnKaspersky = New-Object System.Windows.Forms.Button
$btnKaspersky.Text       = "Instalar Kaspersky"
$btnKaspersky.Size       = New-Object System.Drawing.Size(320, 70)
$btnKaspersky.Location   = New-Object System.Drawing.Point( ($form.Width/2 - 340), ($form.Height - 220) )
$btnKaspersky.Font       = New-Object System.Drawing.Font("Segoe UI Semibold", 14, [System.Drawing.FontStyle]::Bold)
$btnKaspersky.BackColor  = [System.Drawing.Color]::FromArgb(0, 123, 255)   # Azul profissional
$btnKaspersky.ForeColor  = [System.Drawing.Color]::White
$btnKaspersky.FlatStyle  = [System.Windows.Forms.FlatStyle]::Flat
$btnKaspersky.FlatAppearance.BorderSize = 0
$btnKaspersky.Add_Click({
    Start-Process ($httpsPrefix + 'www.kaspersky.com.br/')
})
$form.Controls.Add($btnKaspersky)

$btnFortSecure = New-Object System.Windows.Forms.Button
$btnFortSecure.Text       = "Conhecer a Fort Secure"
$btnFortSecure.Size       = New-Object System.Drawing.Size(320, 70)
$btnFortSecure.Location   = New-Object System.Drawing.Point( ($form.Width/2 + 20), ($form.Height - 220) )
$btnFortSecure.Font       = New-Object System.Drawing.Font("Segoe UI Semibold", 14, [System.Drawing.FontStyle]::Bold)
$btnFortSecure.BackColor  = [System.Drawing.Color]::FromArgb(40, 167, 69)  # Verde confiança
$btnFortSecure.ForeColor  = [System.Drawing.Color]::White
$btnFortSecure.FlatStyle  = [System.Windows.Forms.FlatStyle]::Flat
$btnFortSecure.FlatAppearance.BorderSize = 0
$btnFortSecure.Add_Click({
    Start-Process ($httpsPrefix + 'fortsecure.com.br/')
})
$form.Controls.Add($btnFortSecure)

# coloca o titulo no meio
$form.Add_Shown({
    $lblTitulo.Left = [math]::Round( ($form.ClientSize.Width - $lblTitulo.Width) / 2 )
    $lblTitulo.Top  = 200
    $form.Activate()
    $form.BringToFront()
})

$form.Add_Resize({
    $lblTitulo.Left = [math]::Round( ($form.ClientSize.Width - $lblTitulo.Width) / 2 )
})

$form.ShowDialog() | Out-Null
