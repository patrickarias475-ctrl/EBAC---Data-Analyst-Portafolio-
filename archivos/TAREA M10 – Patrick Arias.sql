USE AdventureWorks2022;
GO
-- 6. Números de orden y compra sin los 2 primeros caracteres (SUBSTRING)
SELECT 
    SUBSTRING(SalesOrderNumber, 3, LEN(SalesOrderNumber)) AS NewSalesOrderNumber,
    SUBSTRING(PurchaseOrderNumber, 3, LEN(PurchaseOrderNumber)) AS NewPurchaseOrderNumber
FROM Sales.SalesOrderHeader;