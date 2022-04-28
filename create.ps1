param (
    [Parameter(Mandatory)]
    [string]$path,

    [Parameter()]
    [string]$image="mcr.microsoft.com/mssql/server:2019-latest",

    [Parameter()]
    [int]$port=5248,

    [Parameter()]
    [string]$password="K@t@_passw0rd",

    [Parameter()]
    [string]$contSqlFiles="/home"
)

$containerId = (docker container create `
    --rm `
    --publish $port`:1433 `
    --env "ACCEPT_EULA=Y" `
    --env "SA_PASSWORD=$password" `
    $image)

$hostCreateDatabaseFilePath = [System.IO.Path]::Combine($PSScriptRoot, "create-database.sql")
$contCreateDatabaseFilePath = "$contSqlFiles/create-database.sql"
docker cp "$hostCreateDatabaseFilePath" $containerId`:$contCreateDatabaseFilePath

$hostCreateKataFilePath = $path
$contCreateKataFilePath = "$contSqlFiles/create-kata.sql"
docker cp "$hostCreateKataFilePath" $containerId`:$contCreateKataFilePath

docker container start $containerId
Start-Sleep 5
docker exec -i $containerId /opt/mssql-tools/bin/sqlcmd -U 'sa' -P "$password" -d "master" -i "$contCreateDatabaseFilePath"
docker exec -i $containerId /opt/mssql-tools/bin/sqlcmd -U 'sa' -P "$password" -d "Kata" -i "$contCreateKataFilePath"
