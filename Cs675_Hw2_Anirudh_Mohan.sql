/*CS675 Hw2*/
/*Anirudh Mohan*/
/*SFSUID = 915255294*/


/* 1 */
Select Distinct g.name
From genre g, track t
Where g.genreid = t.genreid
Group By g.name
Having Count(g.name) <= 1

/* 2 */
Select t.name 
From track t, invoiceline il, invoice i 
Where t.trackid = il.trackid and 
il.invoiceid = i.invoiceid and 
i.billingstate ='CA' 
Union 
Select t.name 
From track t, invoiceline il, invoice i
Where t.trackid = il.trackid and 
il.invoiceid = i.invoiceid and 
i.billingstate ='WA'


/* 3 */
Select t.name
From track t
Where t.trackid IN (Select il.trackid
From invoiceline il
Where il.quantity>5)


/* 4 */
Select t.name
From track t
Where t.unitPrice < 1
Except
Select t.name
From track t
Where t.milliseconds < (Select Avg(t.milliseconds) From track t) 


/* 5 */
Select p.playlistid, p.name
From playlist p
Where p.playlistid IN (Select pt.playlistid
						From playlisttrack pt
						Where pt.trackid NOT IN (Select il.trackid
													From invoiceline il
													Where il.quantity > 1)) 

/* 6 */
Select p.playlistid, p.name
From playlist p 
Where p.playlistid IN (Select pt.playlistid
		From playlisttrack pt
		Where Exists (Select pt.trackid
						From track t, playlisttrack pt
						Where t.trackid= pt.trackid AND t.composer = Null)
		Group By pt.playlistid
		Having Count (*) > 10 )

/* 7 */
Select p.playlistid, p.name
From playlist p
Where p.playlistid IN (Select pt.playlistid
						From playlistyrack pt , track t
						Where pt.trackid = t.trackid 
						Group By pt.playlistid
						Having Count (Distinct t.composer) = 1)

/* 8 */
Select p.playlistid, p.name
From playlist p
Where p.playlistid IN (Select pt.playlistid
						From playlisttrack pt, track t
						Where pt.trackid = t.trackid
						Group By pt.playlistid
						Having Count (Distinct t.composer) > 50 )


/* 9 */
Select c.firstname, c.lastname, c.postalcode, i.total
From customer c , invoice i
Where c.customerid = i.customerid AND i.total > 5.65


 
/* 10 */
Select e.employeeid, e.firstname, e.lastname 
From employee e Where not exists (Select e2.employeeid, e2.firstname, e2.lastname 
									From employee e2 
									Where e2.reportsTo <> Null)














