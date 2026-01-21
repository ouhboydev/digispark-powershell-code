# AlertaSeguranca_Apresentacao_Cliente.ps1

Add-Type -AssemblyName System.Windows.Forms

# Som sutil de alerta (opcional - comente se preferir silêncio na apresentação)
[System.Media.SystemSounds]::Asterisk.Play()

# Texto principal - limpo e profissional
$mensagem = @"
ATENÇÃO

Seu ambiente está vulnerável no momento.

Riscos identificados sem proteção ativa:
• Phishing e anexos maliciosos – principal vetor de invasão
• Credenciais fracas ou reutilizadas – acesso fácil a contas críticas
• Ausência de autenticação em dois fatores (2FA) – perda total com vazamento de senha
• Softwares e sistema desatualizados – exploração por vulnerabilidades conhecidas

A proteção imediata é essencial para mitigar esses riscos.

Selecione uma solução recomendada:
"@

# Cria formulário fullscreen sem bordas
$form                  = New-Object System.Windows.Forms.Form
$form.FormBorderStyle  = [System.Windows.Forms.FormBorderStyle]::None
$form.WindowState      = [System.Windows.Forms.FormWindowState]::Maximized
$form.TopMost          = $true
$form.ShowInTaskbar    = $false
$form.BackColor        = [System.Drawing.Color]::FromArgb(245, 245, 247)   # Cinza claro clean
$form.Bounds           = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds

# Ícone de alerta (amarelo, discreto)
$picture = New-Object System.Windows.Forms.PictureBox
$picture.Image       = [System.Drawing.SystemIcons]::Warning.ToBitmap()
$picture.SizeMode    = "StretchImage"
$picture.Size        = New-Object System.Drawing.Size(90,90)
$picture.Location    = New-Object System.Drawing.Point( ($form.Width/2 - 45), 80 )
$form.Controls.Add($picture)

# Título grande
$lblTitulo = New-Object System.Windows.Forms.Label
$lblTitulo.Text          = "ALERTA DE SEGURANÇA"
$lblTitulo.AutoSize      = $true
$lblTitulo.Font          = New-Object System.Drawing.Font("Segoe UI Semibold", 32, [System.Drawing.FontStyle]::Bold)
$lblTitulo.ForeColor     = [System.Drawing.Color]::FromArgb(220, 53, 69)  # Vermelho suave
$lblTitulo.Location      = New-Object System.Drawing.Point( ($form.Width/2 - ($lblTitulo.Width/2)), 200 )
$form.Controls.Add($lblTitulo)

# Mensagem principal - centralizada
$label = New-Object System.Windows.Forms.Label
$label.Text       = $mensagem
$label.AutoSize   = $false
$label.Size       = New-Object System.Drawing.Size( ($form.Width - 300), 320 )
$label.Location   = New-Object System.Drawing.Point( ($form.Width/2 - ($label.Width/2)), 280 )
$label.Font       = New-Object System.Drawing.Font("Segoe UI", 14)
$label.ForeColor  = [System.Drawing.Color]::FromArgb(33, 37, 41)
$label.TextAlign  = [System.Drawing.ContentAlignment]::MiddleCenter
$form.Controls.Add($label)

# Botão Kaspersky - centralizado à esquerda
$btnKaspersky = New-Object System.Windows.Forms.Button
$btnKaspersky.Text       = "Instalar Kaspersky Agora"
$btnKaspersky.Size       = New-Object System.Drawing.Size(320, 70)
$btnKaspersky.Location   = New-Object System.Drawing.Point( ($form.Width/2 - 340), ($form.Height - 220) )
$btnKaspersky.Font       = New-Object System.Drawing.Font("Segoe UI Semibold", 14, [System.Drawing.FontStyle]::Bold)
$btnKaspersky.BackColor  = [System.Drawing.Color]::FromArgb(0, 123, 255)   # Azul profissional
$btnKaspersky.ForeColor  = [System.Drawing.Color]::White
$btnKaspersky.FlatStyle  = "Flat"
$btnKaspersky.FlatAppearance.BorderSize = 0
$btnKaspersky.Add_Click({ Start-Process "https://www.kaspersky.com.br/" })
$form.Controls.Add($btnKaspersky)

# Botão Fort Secure - centralizado à direita
$btnFortSecure = New-Object System.Windows.Forms.Button
$btnFortSecure.Text       = "Conhecer Fort Secure"
$btnFortSecure.Size       = New-Object System.Drawing.Size(320, 70)
$btnFortSecure.Location   = New-Object System.Drawing.Point( ($form.Width/2 + 20), ($form.Height - 220) )
$btnFortSecure.Font       = New-Object System.Drawing.Font("Segoe UI Semibold", 14, [System.Drawing.FontStyle]::Bold)
$btnFortSecure.BackColor  = [System.Drawing.Color]::FromArgb(40, 167, 69)  # Verde confiança
$btnFortSecure.ForeColor  = [System.Drawing.Color]::White
$btnFortSecure.FlatStyle  = "Flat"
$btnFortSecure.FlatAppearance.BorderSize = 0
$btnFortSecure.Add_Click({ Start-Process "https://fortsecure.com.br/" })
$form.Controls.Add($btnFortSecure)

# Botão Fechar (discreto, mas mantido para o troll opcional)
$btnFechar = New-Object System.Windows.Forms.Button
$btnFechar.Text       = "Fechar"
$btnFechar.Size       = New-Object System.Drawing.Size(180, 50)
$btnFechar.Location   = New-Object System.Drawing.Point( ($form.Width/2 - 90), ($form.Height - 100) )
$btnFechar.Font       = New-Object System.Drawing.Font("Segoe UI", 11)
$btnFechar.BackColor  = [System.Drawing.Color]::FromArgb(108, 117, 125)
$btnFechar.ForeColor  = [System.Drawing.Color]::White
$btnFechar.FlatStyle  = "Flat"
$btnFechar.FlatAppearance.BorderSize = 0
$btnFechar.Add_Click({ $form.Close() })
$form.Controls.Add($btnFechar)

# Reaparece se tentar fechar (comente esta parte na apresentação real se não quiser troll)
$form.Add_FormClosing({
    Start-Sleep -Seconds 3
    & $PSCommandPath
})

# Força foco e exibição
$form.Add_Shown({
    $form.Activate()
    $form.BringToFront()
})

$form.ShowDialog() | Out-Null
