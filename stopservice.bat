@ECHO OFF
ECHO Buscando servico "Bytebank Interface Service" no servidor SRV01
sc \\ SRV01 query "Bytebank Interface Service" | find /i "state" | find /i "running"

IF %ERRORLEVEL% NEQ 0 (
    echo Ops, servico não sendo executado no servidor!
) ELSE (
    echo Parando servico...
    sc \\SRV01 stop "Bytebank Interface Service" > NULL
    echo Iniciando servico...
    sc \\SRV01 start "Bytebank Interface Service" > NULL
    echo Servico reiniciado com sucesso!
)