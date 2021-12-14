:: criando um profile para todos os usuários

:: Comando que retorna o caminho do arquivo para  todos os usuários
$Profile.AllUsersAllHosts

:: se o arquivo profile.ps1 não existir, crie-o com o seguinte comando
new-item $profile.AllUsersAllHosts