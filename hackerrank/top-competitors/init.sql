USE [Playground]
GO

IF OBJECT_ID(N'submissions', N'U') IS NOT NULL
BEGIN
    DROP TABLE [submissions];
END;

IF OBJECT_ID(N'challenges', N'U') IS NOT NULL
BEGIN
    DROP TABLE [challenges];
END;

IF OBJECT_ID(N'difficulty', N'U') IS NOT NULL
BEGIN
    DROP TABLE [difficulty];
END;

IF OBJECT_ID(N'hackers', N'U') IS NOT NULL
BEGIN
    DROP TABLE [hackers];
END;
GO

CREATE TABLE [hackers] (
    [hacker_id] INTEGER PRIMARY KEY,
    [name] NVARCHAR(255) NOT NULL,
);

INSERT INTO [hackers] ([hacker_id], [name]) VALUES
(5580, N'Rose'),
(8439, N'Angela'),
(27205, N'Frank'),
(52243, N'Patrick'),
(52348, N'Lisa'),
(57645, N'Kimberly'),
(77726, N'Bonnie'),
(83082, N'Michael'),
(86870, N'Todd'),
(90411, N'Joe');
GO

CREATE TABLE [difficulty] (
    [difficulty_level] INTEGER PRIMARY KEY,
    [score] INTEGER NOT NULL,
);

INSERT INTO [difficulty] ([difficulty_level], [score]) VALUES
(1, 20),
(2, 30),
(3, 40),
(4, 60),
(5, 80),
(6, 100),
(7, 120);
GO

CREATE TABLE [challenges] (
    [challenge_id] INTEGER PRIMARY KEY,
    [hacker_id] INTEGER NOT NULL,
    [difficulty_level] INTEGER NOT NULL,

    CONSTRAINT [FK_challenges_hacker_id_hackers_hacker_id]
    FOREIGN KEY ([hacker_id]) REFERENCES [hackers] ([hacker_id])
    ON DELETE NO ACTION,

    CONSTRAINT [FK_challenges_difficulty_level_difficulty_difficulty_level]
    FOREIGN KEY ([difficulty_level]) REFERENCES [difficulty] ([difficulty_level])
    ON DELETE NO ACTION,
);

INSERT INTO [challenges] ([challenge_id], [hacker_id], [difficulty_level]) VALUES
(04810, 77726, 4),
(21089, 27205, 1),
(36566, 05580, 7),
(66730, 52243, 6),
(71055, 52243, 2);

CREATE INDEX [IX_challenges_hacker_id] ON [challenges] ([hacker_id]);
CREATE INDEX [IX_challenges_difficulty_level] ON [challenges] (difficulty_level);
GO

CREATE TABLE [submissions] (
    [submission_id] INTEGER PRIMARY KEY,
    [hacker_id] INTEGER NOT NULL,
    [challenge_id] INTEGER NOT NULL,
    [score] INTEGER NOT NULL,

    CONSTRAINT [FK_submissions_hacker_id_hackers_hacker_id]
    FOREIGN KEY ([hacker_id]) REFERENCES [hackers] ([hacker_id])
    ON DELETE NO ACTION,

    CONSTRAINT [FK_submissions_challenge_id_challenges_challenge_id]
    FOREIGN KEY ([challenge_id]) REFERENCES [challenges] ([challenge_id])
    ON DELETE NO ACTION,
);

INSERT INTO [submissions] ([submission_id], [hacker_id], [challenge_id], [score]) VALUES
(68628, 77726, 36566, 30),
(65300, 77726, 21089, 10),
(40326, 52243, 36566, 77),
(08941, 27205, 04810, 04),
(83554, 77726, 66730, 30),
(43353, 52243, 66730, 00),
(55385, 52348, 71055, 20),
(39784, 27205, 71055, 23),
(94613, 86870, 71055, 30),
(45788, 52348, 36566, 00),
(93058, 86870, 36566, 30),
(07344, 08439, 66730, 92),
(02721, 08439, 04810, 36),
(00523, 05580, 71055, 04),
(49105, 52348, 66730, 00),
(55877, 57645, 66730, 80),
(38355, 27205, 66730, 35),
(03924, 08439, 36566, 80),
(97397, 90411, 66730, 100),
(84162, 83082, 04810, 40),
(97431, 90411, 71055, 30);
GO