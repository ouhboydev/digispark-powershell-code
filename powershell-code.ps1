# conscientizacao-seguranca-profissional.ps1
# Script educativo para conscientização sobre segurança digital
# Desenvolvido para promover boas práticas de cibersegurança

Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms

# Mensagem principal - tom profissional e objetivo
$mensagem = @"
Prezado usuário,

A segurança digital é uma responsabilidade compartilhada. Pequenas ações diárias podem fazer uma grande diferença na proteção dos seus dados e dispositivos.

DICAS ESSENCIAIS DE CIBERSEGURANÇA:

1. Evite clicar em links ou abrir anexos de fontes desconhecidas ou suspeitas.
2. Utilize senhas fortes, únicas para cada serviço e considere um gerenciador de senhas confiável.
3. Ative a autenticação de dois fatores (2FA/MFA) em todas as contas que ofereçam essa opção.
4. Mantenha sempre atualizados o sistema operacional, navegadores, aplicativos e soluções de segurança.
5. Tenha extremo cuidado com dispositivos USB de origem desconhecida — eles são um dos vetores de ataque mais comuns.

Soluções profissionais como as oferecidas pela FortSecure e pela Kaspersky trabalham em conjunto para oferecer camadas robustas de proteção. Porém, a conscientização e as boas práticas do usuário continuam sendo o elemento mais importante na defesa contra ameaças cibernéticas.

Fique seguro e protegido.

Atenciosamente,
Equipe de Conscientização em Cibersegurança
"@

# Cria uma janela personalizada com botões adicionais
$form = New-Object System.Windows.Forms.Form
$form.Text = "Conscientização em Cibersegurança"
$form.Size = New-Object System.Drawing.Size(550,420)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false
$form.MinimizeBox = $false

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(20,20)
$label.Size = New-Object System.Drawing.Size(500,280)
$label.Text = $mensagem
$label.Font = New-Object System.Drawing.Font("Segoe UI", 10)
$form.Controls.Add($label)

# Botão OK
$btnOK = New-Object System.Windows.Forms.Button
$btnOK.Location = New-Object System.Drawing.Point(290,330)
$btnOK.Size = New-Object System.Drawing.Size(80,30)
$btnOK.Text = "OK"
$btnOK.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $btnOK
$form.Controls.Add($btnOK)

# Botão Kaspersky
$btnKaspersky = New-Object System.Windows.Forms.Button
$btnKaspersky.Location = New-Object System.Drawing.Point(20,330)
$btnKaspersky.Size = New-Object System.Drawing.Size(140,30)
$btnKaspersky.Text = "Site Kaspersky"
$btnKaspersky.BackColor = [System.Drawing.Color]::LightBlue
$btnKaspersky.Add_Click({
    Start-Process "https://www.kaspersky.com.br"
})
$form.Controls.Add($btnKaspersky)

# Botão FortSecure
$btnFortSecure = New-Object System.Windows.Forms.Button
$btnFortSecure.Location = New-Object System.Drawing.Point(170,330)
$btnFortSecure.Size = New-Object System.Drawing.Size(110,30)
$btnFortSecure.Text = "Site FortSecure"
$btnFortSecure.BackColor = [System.Drawing.Color]::LightGreen
$btnFortSecure.Add_Click({
    Start-Process "https://www.fortsecure.com.br"
})
$form.Controls.Add($btnFortSecure)

# Ícone de informação na janela
$form.Icon = [System.Drawing.SystemIcons]::Information

# Mostra a janela como diálogo
$form.ShowDialog() | Out-Null
