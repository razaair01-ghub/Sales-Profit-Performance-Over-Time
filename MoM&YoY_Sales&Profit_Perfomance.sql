
WITH Monthly_Summary as (
SELECT ROUND(SUM(s.Sales),2) TotalSales,ROUND(SUM(s.Profit),2) TotalProfit,Count(s.OrderID) OrderCount,YEAR(s.OrderDate) Year,MONTH(s.OrderDate) Month ,p.Category Category
FROM  dbo.Sales s
JOIN dbo.Product_Details p
ON p.ProductID=s.ProductID
GROUP BY YEAR(s.OrderDate),MONTH(s.OrderDate),p.Category),
Mom as (
		select Year,Month,TotalProfit,TotalSales,Category,
				LAG(TotalSales) OVER(PARTITION BY Category ORDER BY Year,Month) Prev_Mom_Sales,
				LAG(TotalProfit) OVER(PARTITION BY Category ORDER BY Year,Month) Prev_Mom_Profit,
		FROM Monthly_Summary)

		SELECT	Year,Month,TotalProfit,TotalSales,Category,
				ROUND(TotalSales-COALESCE(Prev_Mom_Sales,0),2) Mom_Sales_Growth,
				ROUND(TotalProfit-COALESCE(Prev_Mom_Profit,0),2) Mom_Profit_Growth,
				ROUND((TotalSales-COALESCE(Prev_Mom_Sales,0))/Prev_Mom_Sales*100,2) Mom_Sales_Growth_percent,
				ROUND((TotalProfit-COALESCE(Prev_Mom_Profit,0))/Prev_Mom_Profit*100,2) Mom_Profit_Growth_percent

		FROM Mom
		ORDER BY Year,Month



--YOY Change

WITH Monthly_Summary as (
SELECT ROUND(SUM(s.Sales),2) TotalSales,ROUND(SUM(s.Profit),2) TotalProfit,Count(s.OrderID) OrderCount,YEAR(s.OrderDate) Year ,p.Category Category
FROM  dbo.Sales s
JOIN dbo.Product_Details p
ON p.ProductID=s.ProductID
GROUP BY YEAR(s.OrderDate),p.Category),
YOY as (
		select Year,TotalProfit,TotalSales,Category,
				LAG(TotalSales) OVER(PARTITION BY Category ORDER BY Year) Prev_Yoy_Sales,
				LAG(TotalProfit) OVER(PARTITION BY Category ORDER BY Year) Prev_Yoy_Profit
		FROM Monthly_Summary)


		SELECT Year,TotalProfit,TotalSales,Category,
		ROUND(TotalSales-COALESCE(Prev_Yoy_Sales,0),2) Yoy_Sales_Growth,
		ROUND(TotalProfit-COALESCE(Prev_Yoy_Profit,0),2) Yoy_Profit_Growth,
		ROUND((TotalSales-COALESCE(Prev_Yoy_Sales,0))/Prev_Yoy_Sales*100,2) Yoy_Sales_Growth_percent,
		ROUND((TotalProfit-COALESCE(Prev_Yoy_Profit,0))/Prev_Yoy_Profit*100,2) Yoy_Profit_Growth_percent
		FROM YOY
		ORDER BY Year