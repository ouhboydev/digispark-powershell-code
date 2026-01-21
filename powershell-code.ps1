# AlertaAntivirus_Fullscreen.ps1

Add-Type -AssemblyName System.Windows.Forms

# Som de alerta para chamar atenção
[System.Media.SystemSounds]::Exclamation.Play()

# Mensagem corrigida e bem formatada
$mensagem = @"
ATENÇÃO: Seu computador está vulnerável AGORA MESMO!

Sem um antivírus ativo e atualizado, você corre riscos sérios todos os dias:

• Clique em link ou anexo errado → invasão imediata (phishing é o #1)
• Senha fraca ou reutilizada → criminosos acessam e-mail, bancos, redes sociais
• Sem autenticação em dois fatores (2FA) → uma senha vazada = perda total da conta
• Windows ou programas desatualizados → exploits conhecidos entram em segundos

Não espere o pior acontecer.
Proteja-se HOJE com soluções confiáveis e reconhecidas.

Escolha uma opção abaixo:
"@

# Cria o formulário em modo fullscreen real
$form = New-Object System.Windows.Forms.Form
$form.Text = "🚨 ALERTA DE SEGURANÇA – AÇÃO NECESSÁRIA"
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::None          # Sem bordas
$form.Bounds = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds           # Ocupa tela inteira
$form.TopMost = $true                                                        # Sempre no topo
$form.ShowInTaskbar = $false                                                 # Não aparece na barra de tarefas
$form.BackColor = [System.Drawing.Color]::FromArgb(255, 245, 230)            # Fundo amarelado de alerta

# Ícone de warning maior e centralizado melhor
$picture = New-Object System.Windows.Forms.PictureBox
$picture.Image = [System.Drawing.SystemIcons]::Warning.ToBitmap()
$picture.SizeMode = "StretchImage"
$picture.Size = New-Object System.Drawing.Size(100, 100)
$picture.Location = New-Object System.Drawing.Point(($form.ClientSize.Width - 100)/2 - 260, 40)
$form.Controls.Add($picture)

# Label da mensagem - ajustado para tela grande
$label = New-Object System.Windows.Forms.Label
$label.Text = $mensagem
$label.AutoSize = $false
$label.Size = New-Object System.Drawing.Size(800, 340)
$label.Location = New-Object System.Drawing.Point(($form.ClientSize.Width - 800)/2, 160)
$label.Font = New-Object System.Drawing.Font("Segoe UI", 13)
$label.ForeColor = [System.Drawing.Color]::DarkRed
$label.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$form.Controls.Add($label)

# Painel para os botões (centralizado)
$panel = New-Object System.Windows.Forms.Panel
$panel.Size = New-Object System.Drawing.Size(560, 140)
$panel.Location = New-Object System.Drawing.Point(($form.ClientSize.Width - 560)/2, $form.ClientSize.Height - 240)
$panel.BackColor = [System.Drawing.Color]::Transparent
$form.Controls.Add($panel)

# Botão Kaspersky
$btnKaspersky = New-Object System.Windows.Forms.Button
$btnKaspersky.Text = "Instalar Kaspersky"
$btnKaspersky.Size = New-Object System.Drawing.Size(260, 60)
$btnKaspersky.Location = New-Object System.Drawing.Point(0, 20)
$btnKaspersky.Font = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$btnKaspersky.BackColor = [System.Drawing.Color]::LightGreen
$btnKaspersky.Add_Click({
    Start-Process "https://www.kaspersky.com.br/"
    $form.Close()
})
$panel.Controls.Add($btnKaspersky)

# Botão Fort Secure
$btnFortSecure = New-Object System.Windows.Forms.Button
$btnFortSecure.Text = "Conhecer Fort Secure (Brasil)"
$btnFortSecure.Size = New-Object System.Drawing.Size(260, 60)
$btnFortSecure.Location = New-Object System.Drawing.Point(280, 20)
$btnFortSecure.Font = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$btnFortSecure.BackColor = [System.Drawing.Color]::LightBlue
$btnFortSecure.Add_Click({
    Start-Process "https://fortsecure.com.br/"
    $form.Close()
})
$panel.Controls.Add($btnFortSecure)

# Botão Fechar (troll leve)
$btnCancelar = New-Object System.Windows.Forms.Button
$btnCancelar.Text = "Fechar (não recomendo)"
$btnCancelar.Size = New-Object System.Drawing.Size(220, 45)
$btnCancelar.Location = New-Object System.Drawing.Point(($form.ClientSize.Width - 220)/2, $form.ClientSize.Height - 60)
$btnCancelar.Font = New-Object System.Drawing.Font("Segoe UI", 10)
$btnCancelar.BackColor = [System.Drawing.Color]::LightGray
$btnCancelar.Add_Click({
    $form.Close()
})
$form.Controls.Add($btnCancelar)

# Se tentar fechar (X do Alt+F4), reaparece após 3 segundos
$form.Add_FormClosing({
    Start-Sleep -Seconds 3
    & $PSCommandPath
})

# Mostra a janela em fullscreen
$form.ShowDialog() | Out-Null
