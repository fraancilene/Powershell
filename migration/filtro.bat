:: retorna os arquivos e diretórios dentro de um diretório
gci -Recurse

:: guardando numa variável e verificando o tamanho
$todosOsItens = gci -Recurse
$todosOsItens.Length

:: pegando apenas os arquivos
$todosOsArquivos = gci -Recurse -File
$todosOsArquivos.Length

:: script para selecionar arquivos com determinado nome e mostrando o tamanho do arquivo
:: $_ cmdlet de iteração quando h[a uso de um argumento de ScriptBlock, representa o item corrente da iteração
:: select-Object Name utilizando essa propriedade descartamos todas as outras nesse comando
gci -Recurse -File | select-Object Name | Where-Object { $_  -like "*_migando_*" }


:: filtrando o nome e depois mostrando o nome e tamanho
gci -Recurse -File | Where-Object Name -like "*_migrando_*" | Select-Object Name, Length

Rem Quando temos uma coleção onde temos que filtrar e formatar seus itens primeiro temos que 
::filtrar os objetos e depois formatar, padrão(FILTER LEFT, FORMAT RIGHT)


:: APLICANDO CONVERSÕES 
:: valorByte / 1024 byte
:: valorByte / 1024 / 1024 megabyte
:: valorByte / 1024 / 1024 / 1024 / 1024 GB
:: no powershell podemos usar a unidade de byte que ele faz a conversão
::  por exemplo: 123KB ou 1MB, 1BG, 1TB
:: valorByte / 1GB - ou pela unidade desejada

:: EXEMPLO com formatação do número
Rem N2 esta informando que estamos convertendo para número e que quero 2 números após a virgula
(547128585652 / 1GB).ToString("N2") + "GB"

:: operador que atua em strings no powershell
:: {"0:N2"} informa que eu quero o primeiro argumento formatado em N2
"{0:N2}GB" -f (547128585652 / 1GB)


:: aplicando ao script de migração
:: Quando queremos que um código execute a cada iteração, coloque-o entre { $_ resto do código}, que chamamos de ScriptingBlock
gci -Recurse -File | ? Name -like "*_migrando_*" | select Name, { "{0:N2}KB" -f ($_.Length / 1KB) }

:: ALIAS
? -  Where-Object
select - Select-Object

:: QUEBRA DE LINHA - o powershell interpreta cada linha como um comando independente
:: para informar uma quebra de linha em um script usamos a ` (crase ou backtick)
:: Se houver um pipe no comando, não precisa colocar o backtick
gci -Recurse -File |
    ? Name -like "*_migrando_*" |
    select `
        Name, `
        { "{0:N2}KB" -f ($_.Length / 1KB) }


:: utilizando variáveis no script
:: a virgula indica ao powershell que estamos montando um array
$nameExpr = Name
$lengthExpr = { "{0:N2}KB" -f ($_.Length / 1KB) }
$params = @($nameExpr, $lengthExpr)
gci -Recurse -File |
    ? Name -like "*_migrando_*" |
    select `
        $params


:: array de um elemento
(,1)
: informando que quero um array ou um array de um objeto
@()