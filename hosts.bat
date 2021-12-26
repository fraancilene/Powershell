:: criando um profile para todos os usuários

:: Comando que retorna o caminho do arquivo profile para todos os usuários
$Profile.AllUsersAllHosts
:: retorna o caminho do arquivo de profile do usuário atual
$profile 

:: se o arquivo profile.ps1 não existir, crie-o com o seguinte comando
new-item $profile.AllUsersAllHosts