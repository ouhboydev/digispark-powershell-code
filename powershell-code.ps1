# conscientizacao-seguranca-profissional.ps1
# Interface estilo terminal (CMD / PowerShell)

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Mensagem
$mensagem = @"
Prezado usuário,

A segurança digital é uma responsabilidade compartilhada.
Pequenas ações diárias fazem grande diferença.

DICAS ESSENCIAIS DE CIBERSEGURANÇA:

[1] Não clique em links ou anexos suspeitos
[2] Utilize senhas fortes e exclusivas
[3] Ative MFA sempre que possível
[4] Mantenha sistemas e softwares atualizados
[5] Nunca utilize USBs desconhecidos

Soluções como FortSecure e Kaspersky
fornecem proteção avançada, porém
o fator humano continua sendo o mais crítico.

Atenciosamente,
Equipe de Conscientização em Cibersegurança
"@

# Janela principal
$form = New-Object System.Windows.Forms.Form
$form.Text = "Security Awareness Console"
$form.Size = New-Object System.Drawing.Size(650,450)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false
$form.MinimizeBox = $false
$form.BackColor = [System.Drawing.Color]::Black
$form.ForeColor = [System.Drawing.Color]::Lime
$form.Font = New-Object System.Drawing.Font("Consolas", 10)

# Caixa de texto estilo terminal
$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(15,15)
$textBox.Size = New-Object System.Drawing.Size(605,320)
$textBox.Multiline = $true
$textBox.ReadOnly = $true
$textBox.ScrollBars = "Vertical"
$textBox.BackColor = [System.Drawing.Color]::Black
$textBox.ForeColor = [System.Drawing.Color]::Lime
$textBox.BorderStyle = "FixedSingle"
$textBox.Font = New-Object System.Drawing.Font("Consolas", 10)
$textBox.Text = $mensagem
$form.Controls.Add($textBox)

# Função para criar botões estilo terminal
function New-TerminalButton {
    param ($Text, $X, $Y, $Width)

    $btn = New-Object System.Windows.Forms.Button
    $btn.Text = $Text
    $btn.Location = New-Object System.Drawing.Point($X,$Y)
    $btn.Size = New-Object System.Drawing.Size($Width,30)
    $btn.FlatStyle = "Flat"
    $btn.FlatAppearance.BorderColor = [System.Drawing.Color]::Lime
    $btn.FlatAppearance.BorderSize = 1
    $btn.BackColor = [System.Drawing.Color]::Black
    $btn.ForeColor = [System.Drawing.Color]::Lime
    $btn.Font = New-Object System.Drawing.Font("Consolas", 9)
    return $btn
}

# Botão Kaspersky
$btnKaspersky = New-TerminalButton "OPEN KASPERSKY SITE" 15 360 200
$btnKaspersky.Add_Click({
    Start-Process "https://www.kaspersky.com.br"
})
$form.Controls.Add($btnKaspersky)

# Botão FortSecure
$btnFortSecure = New-TerminalButton "OPEN FORTSECURE SITE" 230 360 220
$btnFortSecure.Add_Click({
    Start-Process "https://www.fortsecure.com.br"
})
$form.Controls.Add($btnFortSecure)

# Botão OK / EXIT
$btnOK = New-TerminalButton "EXIT" 470 360 150
$btnOK.Add_Click({
    $form.Close()
})
$form.Controls.Add($btnOK)

# Ícone
$form.Icon = [System.Drawing.SystemIcons]::Shield

# Exibir
$form.ShowDialog() | Out-Null
