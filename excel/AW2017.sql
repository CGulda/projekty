
	SELECT 
		p.ProductNumber
		,p.[name]
		,p.Color
		,psc.[name] subcategory
		,pc.[name] category
		,sr.Name
		,sod.[UnitPrice]
		,sod.[UnitPriceDiscount]
		,p.[SellStartDate]
		--,[LineTotal]
		,sum(sod.[OrderQty]) Qty
		,(sum(sod.[OrderQty]) * sod.UnitPrice) total

	FROM [AdventureWorks2017].[Sales].[SalesOrderDetail] sod
	join [AdventureWorks2017].[Production].[Product] p on p.ProductID = sod.ProductID 
	join [AdventureWorks2017].[Production].[ProductSubcategory] psc on p.ProductSubcategoryID = psc.[ProductSubcategoryID]
	join [AdventureWorks2017].[Production].[ProductCategory] pc on pc.[ProductCategoryID] = psc.ProductCategoryID
	join [AdventureWorks2017].[Sales].[SalesReason] sr on sr.SalesReasonID = sod.SpecialOfferID

	group by 
		p.ProductNumber
		,p.[name]
		,p.Color
		,psc.[name] 
		,pc.[name] 
		,sr.Name
		,sod.[UnitPrice]
		,sod.[UnitPriceDiscount]
		,p.[SellStartDate]
	order by total desc