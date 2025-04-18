fx_version 'cerulean'
game 'gta5'

description 'QB-Magazine'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/magnifier.css',
    'html/script.js',
    'html/img/*.jpg',
    'html/img/*.png',
} 