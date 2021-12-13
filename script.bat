
:: imprimindo a variavel de ambiente
echo $env:path

:: verificando o tipo da variável de ambiente
$env:path.GetType()

:: melhorando a visualização da variável de ambiente
$env:path.Split(';')

:: Listando todos os metodos e propriedades da variável de ambiente com o método Get-Member
$env:path | Get-Member