/* TAREA MÓDULO 9 - PROFESIÓN ANALISTA DE DATOS
   Base de datos: AdventureWorks2022
*/
USE AdventureWorks2022;
GO
-- 1) INNER JOIN: Obtener nombres de empleados y sus puestos
SELECT 
    P.FirstName, 
    P.LastName, 
    E.JobTitle
FROM HumanResources.Employee AS E
INNER JOIN Person.Person AS P 
    ON E.BusinessEntityID = P.BusinessEntityID;
    

-- 2) LEFT JOIN: Clientes y sus nombres (incluyendo los que no tienen registro en Person)
SELECT 
    P.FirstName, 
    P.LastName
FROM Sales.Customer AS C
LEFT JOIN Person.Person AS P 
    ON C.PersonID = P.BusinessEntityID;
    

-- 3) RIGHT JOIN: Órdenes e IDs de clientes
SELECT 
    SOH.SalesOrderID, 
    C.CustomerID
FROM Sales.SalesOrderHeader AS SOH
RIGHT JOIN Sales.Customer AS C 
    ON SOH.CustomerID = C.CustomerID;
    

-- 4) FULL OUTER JOIN: Productos y sus reseñas
SELECT 
    P.Name, 
    PR.Comments
FROM Production.Product AS P
FULL OUTER JOIN Production.ProductReview AS PR 
    ON P.ProductID = PR.ProductID;
    

-- 5) CROSS JOIN: Combinación de todos los productos con todas las categorías
SELECT 
    P.Name AS ProductName, 
    PC.Name AS CategoryName
FROM Production.Product AS P
CROSS JOIN Production.ProductCategory AS PC;


-- 6) UNION y UNION ALL: Combinar nombres de productos y modelos
-- Usando UNION (elimina duplicados)
SELECT Name FROM Production.Product
UNION
SELECT Name FROM Production.ProductModel;

-- Usando UNION ALL (mantiene duplicados)
SELECT Name FROM Production.Product
UNION ALL
SELECT Name FROM Production.ProductModel;


-- 7) CASE y COALESCE: Lógica de cargos de empleados
SELECT 
    BusinessEntityID, 
    COALESCE(JobTitle, 'No Title') AS JobTitle,
    CASE 
        WHEN JobTitle LIKE '%Manager%' THEN 'Is Manager'
        ELSE 'Not Manager'
    END AS IsManagerStatus
FROM HumanResources.Employee;


-- 8) ISNULL: Mostrar cuota de ventas o mensaje de 'No Quota'
-- Nota: Como SalesQuota es numérico, pasa a texto para mostrar 'No Quota'
SELECT 
    BusinessEntityID, 
    SalesQuota,
    ISNULL(CAST(SalesQuota AS VARCHAR(20)), 'No Quota') AS QuotaStatus
FROM Sales.SalesPerson;
