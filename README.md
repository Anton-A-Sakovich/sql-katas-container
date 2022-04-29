# SQL Katas in a container

This repository contains a PowerShell script which creates and initializes an SQL Server Linux container for practicing a particular SQL Kata.
It also includes a couple of Katas I had time to create initialization scripts for.

## Prerequisites

1. [Docker Desktop for Windows](https://docs.docker.com/desktop/windows/install/);
2. Docker Desktop should be allowed to pull a missing SQL Server image if it is not present.

## Example

```PowerShell
.\start .\codewars\relational-division-1\init.sql
```

Creates an SQL Server container configured for practicing
[Relational division: Find all movies two actors cast in together](https://www.codewars.com/kata/5817b124e7f4576fd00020a2)
Kata from Codewars which is accessible through port 5248 and `K@t@_passw0rd` password for `sa` login.

## How it works

`create.ps1` PowerShell script does the following:

1. creates a container from an SQL Server image;
2. copies `create-database.sql` SQL script, which creates a new database, to the container;
3. copies a user supplied SQL script for initializing the newly created database to the container;
4. starts the container;
5. executes the script for creating the database in the running container (using `/opt/mssql-tools/bin/sqlcmd`);
6. executes the script for initializing the database in the running container (using `/opt/mssql-tools/bin/sqlcmd`).

The database name is `Kata`. It is not necessary to specify

```SQL
USE [Kata]
GO
```

in the initialization script because `Kata` database will be selected by default when executing the script.

By default host port 5248 is mapped to container port 1433 used by SQL Server. This is done in order not to interfere with an SQL Server
instance running locally on the host but can be changed with a script parameter.

Default `sa` password is `K@t@_passw0rd` but can be changed with a script parameter.
