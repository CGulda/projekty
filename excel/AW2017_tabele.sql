--to nie jest poprawne rozwiązanie, to jest element prezentacji na szybko :)

create table ExcelLogs(
[UserName] NVARCHAR(50),
[DateTime] NVARCHAR(100),
[Type] NVARCHAR(20),
[cell] NVARCHAR(10),
[DelayInSec] FLOAT(10)
)

create table [ExclUsers](
[UserName] NVARCHAR(100),
[ExcelVersion] NVARCHAR(100),
[OS] NVARCHAR(100),
[User] NVARCHAR(100),
[Library] NVARCHAR(100),
[startfolder] NVARCHAR(100),
[IP] NVARCHAR(500),
[datatime] NVARCHAR (100)
)

CREATE VIEW [dbo].[ConfigTable] AS
select distinct 
		[BusinessEntityID] personid
      ,[FirstName]+' '+[LastName] person	 
	  ,right('0'+cast(st.[TerritoryID] as nvarchar)+'_',3)+st.[Name] nazwa
	  ,st.[TerritoryID]
	  from [AdventureWorks2017].[Sales].[vSalesPerson] sp
	  join [AdventureWorks2017].[Sales].[SalesOrderHeader] soh on soh.[SalesPersonID] = sp.[BusinessEntityID]
	  join [AdventureWorks2017].[Sales].[SalesTerritory] st on st.[TerritoryID] = soh.[TerritoryID]
	  
CREATE view [dbo].[storeTable] as
select distinct 
	store.[BusinessEntityID] storeId
      ,store.[Name] StoreName
      ,ct.person PersonName
	  ,cust.TerritoryID
	  ,right('0'+cast(st.[TerritoryID] as nvarchar)+'_',3)+st.[Name] nazwa
from [AdventureWorks2017].[Sales].[Store] store
join [AdventureWorks2017].[Sales].[Customer] cust on cust.StoreID = store.BusinessEntityID
join (select distinct personid, person from ConfigTable) ct on ct.personid = store.[SalesPersonID]
join [AdventureWorks2017].[Sales].[SalesTerritory] st on st.[TerritoryID] = cust.[TerritoryID]