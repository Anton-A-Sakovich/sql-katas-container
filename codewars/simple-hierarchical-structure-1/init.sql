CREATE TABLE [employees] (
    [id] INTEGER PRIMARY KEY,
    [first_name] NVARCHAR(45) NOT NULL,
    [last_name] NVARCHAR(45) NOT NULL,
    [manager_id] INTEGER NULL,

    CONSTRAINT [FK_employees_manager_id_employees_id]
    FOREIGN KEY ([manager_id]) REFERENCES [employees] ([id])
);
GO

/*
06 Hannah
01 Hannah/Darragh
03 Hannah/Darragh/Aayush
04 Hannah/Darragh/Amari
05 Hannah/Darragh/Kobi
08 Hannah/Samson
10 Hannah/Rayhan
02 Hannah/Rayhan/Keeleigh
07 Hannah/Rayhan/Keeleigh/Karolina
09 Hannah/Rayhan/Blossom

-----------------------
   Employee         Manager
-----------------------
06 Hannah    NULL   NULL
-----------------------
01 Darragh   06     Hannah
08 Samson    06     Hannah
10 Rayhan    06     Hannah
-----------------------
03 Aayush    01     Darragh
04 Amari     01     Darragh
05 Kobi      01     Darragh
02 Keeleigh  10     Rayhan
09 Blossom   10     Rayhan
-----------------------
07 Karolina  02     Keeleigh
-----------------------
*/

INSERT INTO [employees] ([id], [first_name], [last_name], [manager_id]) VALUES
(1, 'Darragh', 'Green', 6), -- Hannah 2
(2, 'Keeleigh', 'Alcock', 10), -- Rayhan 3
(3, 'Aayush', 'Marriott', 1), -- Darragh 3
(4, 'Amari', 'Pitts', 1), -- Darragh 3
(5, 'Kobi', 'Sargent', 1), -- Darragh 3
(6, 'Hannah', 'Goodman', NULL), -- super boss 1
(7, 'Karolina', 'Meyers', 2), -- Keeleigh 4
(8, 'Samson', 'Herring', 6), -- Hannah 2
(9, 'Blossom', 'Pacheco', 10), -- Rayhan 3
(10, 'Rayhan', 'West', 6); -- Hannah 2
GO
