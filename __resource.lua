client_script 'db_perms_cl.lua'

dependency 'mysql-async'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'db_perms_sv.lua'
} 

export 'HasPermission'

server_export 'HasPermission_sv'