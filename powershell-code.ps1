# AlertaAntivirus_Melhorado.ps1

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName Microsoft.VisualBasic  # Para InputBox se quiser expandir depois

# Toca um som de alerta (exclamação do Windows)
[System.Media.SystemSounds]::Exclamation.Play()

# Mensagem melhorada, mais clara e convincente
$mensagem = @"
ATENÇÃO: Seu computador está vulnerável AGORA!

Sem um antivírus ativo e atualizado, você corre riscos sérios todos os dias:

• Clique em link ou anexo errado → invasão imediata (phishing é o #1)
• Senha fraca ou reutilizada → criminosos acessam e-mail, banco, redes sociais
• Sem autenticação em dois fatores (2FA) → uma senha vazada = perda total da conta
• Windows ou programas desatualizados → exploits conhecidos entram em segundos

Não espere acontecer com você.
Proteja-se HOJE com soluções confiáveis e reconhecidas.

Escolha uma opção abaixo:
"@

# Cria um formulário customizado (em vez de MessageBox simples) para ter botões que abrem URLs
$form = New-Object System.Windows.Forms.Form
$form.Text = "🚨 ALERTA DE SEGURANÇA – AÇÃO NECESSÁRIA"
$form.Size = New-Object System.Drawing.Size(520,420)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false
$form.MinimizeBox = $false
$form.TopMost = $true
$form.BackColor = [System.Drawing.Color]::FromArgb(255, 245, 230)  # Fundo claro amarelado (atenção)

# Ícone de warning no topo
$picture = New-Object System.Windows.Forms.PictureBox
$picture.Image = [System.Drawing.SystemIcons]::Warning.ToBitmap()
$picture.SizeMode = "StretchImage"
$picture.Size = New-Object System.Drawing.Size(64,64)
$picture.Location = New-Object System.Drawing.Point(20,20)
$form.Controls.Add($picture)

# Label com a mensagem
$label = New-Object System.Windows.Forms.Label
$label.Text = $mensagem
$label.AutoSize = $false
$label.Size = New-Object System.Drawing.Size(460,240)
$label.Location = New-Object System.Drawing.Point(100,20)
$label.Font = New-Object System.Drawing.Font("Segoe UI", 11)
$label.ForeColor = [System.Drawing.Color]::DarkRed
$form.Controls.Add($label)

# Botão Kaspersky
$btnKaspersky = New-Object System.Windows.Forms.Button
$btnKaspersky.Text = "Instalar Kaspersky (Grátis / Trial)"
$btnKaspersky.Size = New-Object System.Drawing.Size(220,50)
$btnKaspersky.Location = New-Object System.Drawing.Point(40,280)
$btnKaspersky.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$btnKaspersky.BackColor = [System.Drawing.Color]::LightGreen
$btnKaspersky.Add_Click({
    Start-Process "https://www.kaspersky.com.br/"
})
$form.Controls.Add($btnKaspersky)

# Botão Fort Secure
$btnFortSecure = New-Object System.Windows.Forms.Button
$btnFortSecure.Text = "Conhecer Fort Secure (Brasil)"
$btnFortSecure.Size = New-Object System.Drawing.Size(220,50)
$btnFortSecure.Location = New-Object System.Drawing.Point(270,280)
$btnFortSecure.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$btnFortSecure.BackColor = [System.Drawing.Color]::LightBlue
$btnFortSecure.Add_Click({
    Start-Process "https://fortsecure.com.br/"
})
$form.Controls.Add($btnFortSecure)

# Botão Cancelar (troll)
$btnCancelar = New-Object System.Windows.Forms.Button
$btnCancelar.Text = "Fechar (não recomendo)"
$btnCancelar.Size = New-Object System.Drawing.Size(180,40)
$btnCancelar.Location = New-Object System.Drawing.Point(170,340)
$btnCancelar.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$btnCancelar.BackColor = [System.Drawing.Color]::LightGray
$btnCancelar.Add_Click({
    $form.Close()
})
$form.Controls.Add($btnCancelar)

# Evento: se fechar a janela (X ou Alt+F4), reaparece depois de 3s
$form.Add_FormClosing({
    Start-Sleep -Seconds 3
    & $PSCommandPath
})

# Mostra a janela
$form.ShowDialog() | Out-Null
