# dfsdb_perms

- This resource depends on DFS_Queue, but this dependency can be removed in under 3 hours. <INSERT_LINK_HERE>
- This resource depends on MySQLAsync, but this dependency can be alterede or removed in under an hour.
- This reource depends on DFS, but this dependencie can be removed in under an hour. https://github.com/DarkFeather-Studios/fivem_framework
- Many resources in the DFS network rely on this resource.

Client Export;

- HasPermission(string callerName, int desiredPermissionLevel); Returns a bool if the current user has permission to run this function. Logs the attempt to the database.

Server Export;

- HasPermission_sv(int playerID, string callerName, int desiredPermissionLevel); Returns a bool if PlayerID has permission to run this function. Logs the attempt to the database.

