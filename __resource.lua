client_script 'db_perms_cl.lua'

dependency 'mysql-async'
dependency 'dfs'
dependency 'dfsqueue'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'db_perms_sv.lua'
} 

export 'HasPermission'

server_export 'HasPermission_sv'
