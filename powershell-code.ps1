# terminal-conscientizacao.ps1
# Efeito de terminal hacker para mensagem de conscientização em segurança digital

Add-Type -AssemblyName System.Windows.Forms

# Configurações da "tela de terminal"
$consoleTitle = "SYSTEM SECURITY AWARENESS TERMINAL - FORTSECURE"
$foregroundColor = "Green"
$backgroundColor = "Black"

# Mensagem completa (dividida em linhas para efeito de digitação)
$lines = @(
    "Initializing Security Awareness Module... [OK]",
    "Scanning user environment... [SECURE]",
    "",
    "==============================================================",
    "          FORTSECURE + KASPERSKY - CONSCIENTIZAÇÃO           ",
    "==============================================================",
    "",
    "Prezado usuário,",
    "",
    "A proteção digital começa com VOCÊ.",
    "",
    "DICAS ESSENCIAIS:",
    "  → Nunca clique em links ou anexos de fontes desconhecidas.",
    "  → Use senhas fortes e únicas (gerenciadores recomendados).",
    "  → Ative 2FA/MFA em todas as contas possíveis.",
    "  → Mantenha sistemas, navegadores e antivírus atualizados.",
    "  → Desconfie de pen drives/USB de origem desconhecida.",
    "",
    "Lembre-se: a tecnologia ajuda, mas a atenção humana é a defesa mais forte.",
    "",
    "Fique seguro.",
    "",
    "Equipe FortSecure | Rio de Janeiro - 2026",
    "Pressione ESC para sair..."
)

# Cria janela fullscreen-like
$form = New-Object System.Windows.Forms.Form
$form.Text = $consoleTitle
$form.WindowState = [System.Windows.Forms.FormWindowState]::Maximized
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::None          # Sem bordas (efeito fullscreen real)
$form.TopMost = $true                                                         # Sempre no topo
$form.BackColor = [System.Drawing.Color]::Black
$form.ForeColor = [System.Drawing.Color]::FromName($foregroundColor)
$form.Font = New-Object System.Drawing.Font("Consolas", 14, [System.Drawing.FontStyle]::Regular)
$form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen

# Área de texto (ocupa toda a tela)
$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Multiline = $true
$textBox.ReadOnly = $true
$textBox.ScrollBars = [System.Windows.Forms.ScrollBars]::Vertical
$textBox.Dock = [System.Windows.Forms.DockStyle]::Fill
$textBox.BackColor = [System.Drawing.Color]::Black
$textBox.ForeColor = [System.Drawing.Color]::LimeGreen
$textBox.Font = New-Object System.Drawing.Font("Consolas", 14)
$textBox.BorderStyle = [System.Windows.Forms.BorderStyle]::None
$form.Controls.Add($textBox)

# Evento de tecla para fechar com ESC
$form.Add_KeyDown({
    if ($_.KeyCode -eq "Escape") {
        $form.Close()
    }
})

# Mostra a janela
$form.Show() | Out-Null

# Efeito de digitação linha por linha
foreach ($line in $lines) {
    foreach ($char in $line.ToCharArray()) {
        $textBox.AppendText($char)
        [System.Windows.Forms.Application]::DoEvents()   # Atualiza a UI em tempo real
        Start-Sleep -Milliseconds (Get-Random -Minimum 20 -Maximum 80)   # Velocidade variável (efeito realista)
    }
    $textBox.AppendText("`r`n")
    Start-Sleep -Milliseconds 400   # Pausa entre linhas para drama
}

# Mantém aberto até o usuário pressionar ESC
while ($form.Visible) {
    [System.Windows.Forms.Application]::DoEvents()
    Start-Sleep -Milliseconds 100
}

# Limpa e fecha
$form.Close()
