# para indicar parametros utilizamos o -
# comando para obter o serviço no computador
# para obter um serviço na nosse máquina local, pode-se omitir o argumento -ComputerName
# $servico é uma variável
$servico = Get-Service -Name "Bytebank Interface Service" -ComputerName "SRV01"

# verificando o status do serviço
if ($servico.Status -eq "Running"){
    $servico.Stop()
    $servico.Start()
} else {
    echo "Serviço não está executando!"
}
