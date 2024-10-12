fx_version 'adamant'
game 'gta5'

author 'Code by BS | 15ter, BS | Sulejman and zFantaFlasche'
version '1.0'
description 'Fraction Invite Script'

lua54 'yes'

shared_script 'config/config.lua'

client_scripts {
    'config/config.lua',
    'client/client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config/config.lua',
    'server/server.lua',
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/**/*.*'
}