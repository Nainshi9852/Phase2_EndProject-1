IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Department] (
    [DeptCode] int NOT NULL IDENTITY,
    [DeptName] nvarchar(50) NOT NULL,
    CONSTRAINT [PK_Department] PRIMARY KEY ([DeptCode])
);
GO

CREATE TABLE [Employee] (
    [EmpCode] int NOT NULL IDENTITY,
    [EmpName] nvarchar(100) NOT NULL,
    [Email] nvarchar(100) NOT NULL,
    [DateOfBirth] datetime2 NOT NULL,
    [DeptCode] int NOT NULL,
    CONSTRAINT [PK_Employee] PRIMARY KEY ([EmpCode]),
    CONSTRAINT [FK_Employee_Department_DeptCode] FOREIGN KEY ([DeptCode]) REFERENCES [Department] ([DeptCode]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_Employee_DeptCode] ON [Employee] ([DeptCode]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20230906175340_EMSMig', N'7.0.10');
GO

COMMIT;
GO

