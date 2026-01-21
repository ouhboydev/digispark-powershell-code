# AlertaAntivirus_Zoeira.ps1

Add-Type -AssemblyName System.Windows.Forms

$mensagem = @"
EI, VOCÊ AÍ!

Seu PC tá peladinho, sem antivírus! 😳

Já pensou se entra um vírus agora e:
→ Apaga suas fotos de rolê
→ Manda nudes seus pro seu chefe
→ Coloca seu cartão na compra de 47 Funko Pops

Instala um antivírus AGORA, pelo amor de Deus!
Microsoft Defender já resolve (é de graça e bom).

Não seja o amigo que perde tudo por preguiça.

Clique OK pra eu parar de encher o saco... por enquanto.
"@

$result = [System.Windows.Forms.MessageBox]::Show(
    $mensagem,
    "ALERTA DE SEGURANÇA – NÃO IGNORA ISSO",
    [System.Windows.Forms.MessageBoxButtons]::OKCancel,
    [System.Windows.Forms.MessageBoxIcon]::Exclamation
)

if ($result -eq "Cancel") {
    # Aparece de novo se a pessoa clicar Cancelar (efeito troll leve)
    Start-Sleep -Seconds 3
    & $PSCommandPath
}
