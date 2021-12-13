
:: imprimindo a variavel de ambiente
echo $env:path

:: verificando o tipo da variável de ambiente
$env:path.GetType()

:: melhorando a visualização da variável de ambiente
$env:path.Split(';')