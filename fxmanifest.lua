fx_version 'adamant'

game 'gta5'

lua54 'yes'
author 'Eagles'
version '1.0.4'

shared_scripts { 
    '@ox_lib/init.lua',
	'config.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server.lua'
}

client_scripts {
	'client.lua',
}

dependencies {
    'ox_lib'
}