# conscientizacao-seguranca.ps1
# Script educativo para conscientização sobre segurança digital
# Hospede no GitHub e execute via Digispark / BadUSB style

Add-Type -AssemblyName PresentationFramework

# Mensagem principal
$mensagem = @"

#       ▄████████  ▄██████▄     ▄████████     ███        ▄████████    ▄████████  ▄████████ ███    █▄     ▄████████    ▄████████ 
#      ███    ███ ███    ███   ███    ███ ▀█████████▄   ███    ███   ███    ███ ███    ███ ███    ███   ███    ███   ███    ███ 
#      ███    █▀  ███    ███   ███    ███    ▀███▀▀██   ███    █▀    ███    █▀  ███    █▀  ███    ███   ███    ███   ███    █▀  
#     ▄███▄▄▄     ███    ███  ▄███▄▄▄▄██▀     ███   ▀   ███         ▄███▄▄▄     ███        ███    ███  ▄███▄▄▄▄██▀  ▄███▄▄▄     
#    ▀▀███▀▀▀     ███    ███ ▀▀███▀▀▀▀▀       ███     ▀███████████ ▀▀███▀▀▀     ███        ███    ███ ▀▀███▀▀▀▀▀   ▀▀███▀▀▀     
#      ███        ███    ███ ▀███████████     ███              ███   ███    █▄  ███    █▄  ███    ███ ▀███████████   ███    █▄  
#      ███        ███    ███   ███    ███     ███        ▄█    ███   ███    ███ ███    ███ ███    ███   ███    ███   ███    ███ 
#      ███         ▀██████▀    ███    ███    ▄████▀    ▄████████▀    ██████████ ████████▀  ████████▀    ███    ███   ██████████ 
#                              ███    ███                                                               ███    ███              

DICAS IMPORTANTES:
1. Nunca clique em links ou anexos de e-mails / mensagens desconhecidas.
2. Use senhas fortes e diferentes em cada conta (ou gerenciador como Bitwarden / LastPass).
3. Ative autenticação de dois fatores (2FA / MFA) SEMPRE que possível.
4. Mantenha Windows, antivírus e navegadores atualizados.
5. Cuidado extremo com pen drives / USBs desconhecidos – eles podem ser vetores reais de ataque!

FORTSECURE + KASPERSKY ajudam muito, mas a melhor proteção é VOCÊ estar atento.
"@

# Exibe a caixa de diálogo
[System.Windows.MessageBox]::Show(
    $mensagem,
    "Lembrete de Segurança Digital - @fortsecure",
    [System.Windows.MessageBoxButton]::OK,
    [System.Windows.MessageBoxImage]::Information
)