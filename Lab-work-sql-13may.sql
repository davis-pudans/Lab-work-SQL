#Write a SELECT statement that lists the customerid along with their account number, type, the city the customer 
#lives in and their postalcode.
SELECT c.CustomerID, c.CustomerType, c.AccountNumber, a.City, a.PostalCode
FROM customer c
join customeraddress ca on c.CustomerID = ca.CustomerID
join address a on ca.AddressID = a.AddressID
;

#Write a SELECT statement that lists the 20 most recently launched products, their name and colour

Select p.ProductID, p.Color, p.Name

from product p
order by SellStartDate desc
limit 20;

#3. 	Write a SELECT statement that shows how many products are on each shelf in 2/5/98, 
#broken down by product category and subcategory

select count(i.ProductID) , i.Shelf, p.ProductSubcategoryID

from productinventory i
join product p on i.ProductID=p.ProductID

where i.ModifiedDate = '1998-05-02 00:00:00'
group by Shelf, p.ProductSubcategoryID, i.ModifiedDate
;

#  	I am trying to track down a vendor email address… his name is Stuart and he works at G&K Bicycle Corp. Can you help?
select v.VendorID, vc.ContactID, c.FirstName, c.EmailAddress, v.Name	
from vendor v
join vendorcontact vc on v.VendorID=vc.VendorID
join contact c on vc.ContactID=c.ContactID
where v.Name = 'G & K Bicycle Corp.'
;
#What’s the total sales tax amount for sales to Germany? What’s the top region in Germany by sales tax?

#	Summarise the distinct # transactions by month
#EXTRACT(MONTH FROM return_date) as return_month
select count(*) as transactions, extract(month from TransactionDate) as month

from transactionhistory
group by month
;
#Which ( if any) of the sales people exceeded their sales quota this year and last year?
SELECT *, SalesYTD-SalesQuota as YTDexceed, SalesLastYear-SalesQuota as LYExceed
FROM adventureworks.salesperson
having YTDexceed >0 and LYExceed >0
;

# Do all products in the inventory have photos in the database and a text product description?
SELECT p.ProductID, ph.ThumbnailPhotoFileName
FROM adventureworks.product p
join productphoto ph on p.ProductID=ph.ProductPhotoID;

SELECT p.ProductID, pd.Description
FROM adventureworks.product p
join productmodel pm on p.ProductModelID=pm.ProductModelID
join productmodelproductdescriptionculture pmd on pm.ProductModelID=pmd.ProductModelID
join productdescription pd on pmd.ProductDescriptionID=pd.ProductDescriptionID;

# What's the average unit price of each product name on purchase orders which were not fully,
# but at least partially rejected?

#10. How many engineers are on the employee list? Have they taken any sickleave?
SELECT count(*) FROM adventureworks.employee
where Title like '%Engineer' and SickLeaveHours>0

#11. How many days difference on average between the planned and actual end date of workorders in the painting stages?











