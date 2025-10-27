--task 1
-- Count number of products in each category using PIVOT
SELECT *
FROM (
    SELECT Category, ProductID
    FROM Products
) AS SourceTable
PIVOT (
    COUNT(ProductID)
    FOR Category IN ([Electronics], [Accessories], [Furniture], [Stationery], [Tools], [Clothing])
) AS PivotTable;

