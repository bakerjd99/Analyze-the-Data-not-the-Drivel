 
[Common Table Expression (CTE) SQLServer Queries with J](https://bakerjd99.wordpress.com/2011/08/13/common-table-expression-cte-sqlserver-queries-with-j/)
---------------------------------------------------------------------------------------------------------------------------------------------------------

*Posted: 13 Aug 2011 22:01:10*

I’ve been blogging long enough to observe that your *awesome posts are
often ignored* while your little “one-offs” sometimes strike
[hit](https://www.webopedia.com/TERM/H/hit.html) gold. This is
particularly true for “code example” posts. When I’m trolling for code —
the geek equivalent of trolling for babes — I don’t want to read about
the author’s programming philosophy or what the hell he thinks about the
idiot in the White House. **Just show me the code and shut up!**

So, taking my own advice, the following is an example of a SQLSever
[Common Table
Expression](https://msdn.microsoft.com/en-us/library/ms190766.aspx) (CTE)
query.

```SQL
WITH cte1
	 AS (SELECT c.obj_id                            AS obj_id,
				a.created                           AS creation_date,
				Datediff(DAY, a.created, Getdate()) AS day_cnt
		 FROM   [HIST].[dbo].[History] a
				JOIN [HIST].[dbo].[HistorySummary] b
				  ON a.rowid = b.rowid
				JOIN [HIST].[dbo].[ObjectNames] c
				  ON c.obj_name = b.obj_name),
	 cte2
	 AS (SELECT cte1.obj_id AS obj_id,
				CASE
				  WHEN cte1.day_cnt <= 30 THEN 1
				  ELSE 0
				END         AS d0,
				CASE
				  WHEN ( cte1.day_cnt > 30 )
					   AND ( cte1.day_cnt <= 60 ) THEN 1
				  ELSE 0
				END         AS d1,
				CASE
				  WHEN ( cte1.day_cnt > 60 )
					   AND ( cte1.day_cnt <= 90 ) THEN 1
				  ELSE 0
				END         AS d2,
				CASE
				  WHEN ( cte1.day_cnt > 90 ) THEN 1
				  ELSE 0
				END         AS d3
		 FROM   cte1)
SELECT obj_id,
	   SUM(d0) AS OneMonth,
	   SUM(d1) AS TwoMonths,
	   SUM(d2) AS ThreeMonths,
	   SUM(d3) AS Overdue
FROM   cte2
GROUP  BY obj_id
```

CTE queries *essentially* create temporary virtual tables during query
execution. They are similar to nested SQL queries but are easier to
code, more general, (see [recursive CTE
queries](https://msdn.microsoft.com/en-us/library/ms186243.aspx)), and
often perform better than their convoluted equivalents. This example
creates two virtual tables `cte1` and `cte2` that are then used to
compute a quick histogram.

You can call CTE queries with the [J
ODBC](https://www.jsoftware.com/jwiki/ODBC) interface. The following
assumes a SQLServer ODBC connection
[dsn](https://www.geeksengine.com/article/mysql-odbc.html) history.

```J
NB. odbc interface
require 'dd'

NB. read CTE query
HistoryAgeSQL=. read 'c:/temp/HistoryAge.sql'

NB. connect sqlserver database
ch =. ddcon 'dsn=history'

NB. select with CTE query
sh =. HistoryAgeSQL ddsel ch

NB. fetch results
data=. ddfet sh,_1
```

As a final note it’s worth comparing the SQL CTE histogram code with J
equivalents. The two following J verbs taken from the [J
wiki](https://www.jsoftware.com/jwiki/FrontPage),
([here](https://www.jsoftware.com/jwiki/Essays/Histogram) and
[here](https://www.jsoftware.com/jwiki/BrianSchott/Histogram)), compute
histograms.

```J
NB. computes histograms uses right open intervals
histogram=:<:@(#/.~)@(i.@#@[ , I.)

NB. variation on (histogram) uses left open intervals
histogram2=:<:@(#/.~)@(i.@>:@#@[ , |.@[ (#@[ - I.) ])
```

They scale to tens of millions of data points; returning results in a
few seconds on my laptop. The SQL CTE, shown above, takes about three
seconds running on 180,000 row tables on my employer’s [full
warp](https://www.trekmania.net/science/warp\_scale.htm) servers. If I
could convince the masses to adopt languages like J a large part of my
job would disappear. Fortunately, *the world is hostile to terse
elegance!*
