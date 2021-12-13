:: parando serviço no cmd.bat

@ECHO OFF
ECHO Buscando servico "Bytebank Interface Service" no servidor SRV01

:: sc serve para fazer buscas (verificando se o serviço está rodando)
:: /i informa pra a busca ser feita tanto em maiuscula como minuscula
sc \\SRV01 query "Bytebank Interface Service" | find /i "state" | find /i "running"

:: NEQ significa 'não igual a 0'
IF %ERRORLEVEL% NEQ 0 (
    echo Ops, servico não sendo executado no servidor!
) ELSE (
    echo Parando servico...
    sc \\SRV01 stop "Bytebank Interface Service" > NULL
    echo Iniciando servico...
    sc \\SRV01 start "Bytebank Interface Service" > NULL
    echo Servico reiniciado com sucesso!
)

:: Roda no cmd de comando, ir para a pasta onde está o script e chama-lo