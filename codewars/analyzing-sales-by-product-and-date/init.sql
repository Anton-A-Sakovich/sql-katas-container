CREATE TABLE [products] (
    [id] INTEGER PRIMARY KEY,
    [name] NVARCHAR(255) NOT NULL,
    [price] DECIMAL(10, 2) NOT NULL,
);

INSERT INTO [products] ([id], [name], [price]) VALUES
(1, 'milk', 3.50),
(2, 'cheese', 5.60),
(3, 'eggs', 2.00);
GO

CREATE TABLE [sales] (
    [id] INTEGER PRIMARY KEY,
    [date] DATETIME2 NOT NULL,
);

INSERT INTO [sales] ([id], [date]) VALUES
(1, '2018-12-31'),
(2, '2019-01-01'),
(3, '2019-02-01'),
(4, '2019-01-02');
GO

CREATE TABLE [sales_details] (
    [id] INTEGER PRIMARY KEY,
    [sale_id] INTEGER NOT NULL,
    [product_id] INTEGER NOT NULL,
    [count] INTEGER NOT NULL,

    CONSTRAINT [FK_sales_details_sale_id_sales_id]
    FOREIGN KEY ([sale_id]) REFERENCES [sales] ([id])
    ON DELETE CASCADE,

    CONSTRAINT [FK_sales_details_product_id_products_id]
    FOREIGN KEY ([product_id]) REFERENCES [products] ([id])
    ON DELETE CASCADE,
);

INSERT INTO [sales_details] ([id], [sale_id], [product_id], [count]) VALUES
(1, 1, 1, 3),
(2, 1, 3, 1),
(3, 2, 1, 2),
(4, 2, 2, 1),
(5, 3, 3, 3),
(6, 3, 2, 2),
(7, 4, 1, 1),
(8, 4, 2, 1),
(9, 4, 3, 3);
GO
