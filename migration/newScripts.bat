:: renomeando arquivos
:: executando comandos que são apelidos do powershell
:: Get-Alias : para saber os apelidos dos comandos
    :: ** Get-Alias -Name <comando> (exemplo: Get-Alias -Name dir )
rename-item nome_atual.bat nome_novo.bat

:: descobrindo o que esse comando digitado fara
rename-item nome_atual.bat nome_novo.bat -WhatIf

:: buscando ajuda de como utilizar determinado comando
Get-Help -Name Rename-Item 
:: ou (para ver online)
Get-Help -Name Rename-Item -Online

:: Criando Alias
:: new-alias -name "alias" commando
new-alias -name "rename" rename-item

:: renomeando arquivo com o alias criado
rename nome_atual.bat nome_novo.bat










