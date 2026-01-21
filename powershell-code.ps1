# conscientizacao-seguranca-maximizada.ps1
# Versão com janela maximizada para maior impacto visual e legibilidade

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName PresentationFramework

# Mensagem principal (mantive o teu texto original, mas organizei melhor)
$mensagem = @"
Ei, amigo! Isso aqui NÃO é vírus.

É só um lembrete rápido de segurança digital.

DICAS IMPORTANTES:

1. Nunca clique em links ou anexos de e-mails / mensagens desconhecidas.
2. Use senhas fortes e diferentes em cada conta (ou gerenciador como Bitwarden / LastPass).
3. Ative autenticação de dois fatores (2FA / MFA) SEMPRE que possível.
4. Mantenha Windows, antivírus e navegadores atualizados.
5. Cuidado extremo com pen drives / USBs desconhecidos – eles podem ser vetores reais de ataque!

FORTSECURE + KASPERSKY ajudam muito, mas a melhor proteção é VOCÊ estar atento.

Fica esperto aí! 🚀
Qualquer dúvida, me chama.

Ass: André & FortSecure
"@

# Cria uma janela customizada (em vez de MessageBox simples)
$form = New-Object System.Windows.Forms.Form
$form.Text = "Lembrete de Segurança Digital - @fortsecure"
$form.WindowState = [System.Windows.Forms.FormWindowState]::Maximized          # Abre maximizada (quase fullscreen)
$form.TopMost = $true                                                          # Sempre no topo de tudo
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog    # Sem bordas redimensionáveis
$form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$form.BackColor = [System.Drawing.Color]::WhiteSmoke
$form.Font = New-Object System.Drawing.Font("Segoe UI", 12)                    # Fonte maior e moderna

# Label com a mensagem (ocupa quase toda a tela)
$label = New-Object System.Windows.Forms.Label
$label.Dock = [System.Windows.Forms.DockStyle]::Fill
$label.Text = $mensagem
$label.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$label.Padding = New-Object System.Windows.Forms.Padding(40, 40, 40, 40)       # Margens internas para legibilidade
$form.Controls.Add($label)

# Botão OK no rodapé (centralizado)
$btnOK = New-Object System.Windows.Forms.Button
$btnOK.Text = "Entendi e vou me proteger melhor!"
$btnOK.Size = New-Object System.Drawing.Size(300, 60)
$btnOK.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$btnOK.BackColor = [System.Drawing.Color]::LightGreen
$btnOK.ForeColor = [System.Drawing.Color]::Black
$btnOK.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$btnOK.DialogResult = [System.Windows.Forms.DialogResult]::OK

# Posiciona o botão no centro inferior
$btnOK.Anchor = [System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Left -bor [System.Windows.Forms.AnchorStyles]::Right
$btnOK.Location = New-Object System.Drawing.Point(($form.ClientSize.Width - 300)/2, $form.ClientSize.Height - 100)
$form.Controls.Add($btnOK)

# Ícone de informação na barra de título
$form.Icon = [System.Drawing.SystemIcons]::Information

# Mostra a janela como diálogo modal
$form.ShowDialog() | Out-Null
