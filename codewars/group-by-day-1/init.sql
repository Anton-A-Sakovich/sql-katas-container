CREATE TABLE [events] (
    [id] INTEGER PRIMARY KEY,
    [name] NVARCHAR(45) NOT NULL,
    [created_at] DATETIME2 NOT NULL,
    [description] NVARCHAR(255) NULL,
)

INSERT INTO [events] ([id], [name], [created_at], [description]) VALUES
(1, 'awakening',                '2022-04-27 08:00:00', NULL),
(2, 'breakfast consumed',       '2022-04-27 09:00:00', '18 dumplings as usual'),
(3, 'teeth cleaned',            '2022-04-27 09:30:00', 'Dental floss followed by toothpaste'),
(4, 'trained',                  '2022-04-27 10:00:00', 'SQL'),
(5, 'trained',                  '2022-04-27 10:30:00', 'C Sharp'),
(6, 'trained',                  '2022-04-27 11:00:00', 'SQL'),
(7, 'trained',                  '2022-04-27 11:30:00', 'SQL'),
(8, 'trained',                  '2022-04-27 12:00:00', 'C Sharp'),
(9, 'awakening',                '2022-04-28 08:00:00', NULL),
(10, 'breakfast consumed',      '2022-04-28 09:00:00', '18 dumplings as usual'),
(11, 'teeth cleaned',           '2022-04-28 09:30:00', 'Dental floss followed by toothpaste'),
(12, 'trained',                 '2022-04-28 10:00:00', 'SQL'),
(13, 'trained',                 '2022-04-28 10:30:00', 'C Sharp'),
(14, 'trained',                 '2022-04-28 11:00:00', 'C Sharp'),
(15, 'trained',                 '2022-04-28 11:30:00', 'C Sharp'),
(16, 'trained',                 '2022-04-28 12:00:00', 'C Sharp');
GO
