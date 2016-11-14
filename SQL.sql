'0 Reminders'
	Single quote: SQL uses two single quotes to represent one in a string.
	NULL wont join! 
	N/A: to label as int -> 999; char -> ''(''<>NULL)
	Estimated (ctrl+L) / actual execution plan 
	remember to order by !!! SQL tables do not keep order 

'1 General, Misc'
	--show linked servers
	sp_linkedservers

'2 I/O, ETL, Operation' 
	--create
		create table t1 (
			col1 int
		   ,col2 int
		   ,col3 int )
	--insert
		insert into t1 (col1, col2, col3) values (1, 2, 3)，（2，3，4）
	--BULK insert		
	BULK INSERT User_Temp_DB1.dbo.sz_cv72 from '\\tsclient\C\Users\i57287\Desktop\cv72.csv' with (fieldterminator=',', firstrow=1, keepnulls)
	--BCP via terminal
	bcp "SELECT Col1,Col2,Col3 FROM MyDatabase.dbo.MyTable" queryout "D:\MyTable.csv" -c -t , -S SERVERNAME -T 
	--search
	SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME like '%ambest%' --search table
	select * from work.sys.tables where name like '%ambest%' order by modify_date --search table
	--check existence
	IF OBJECT_ID('tempdb..#abc') IS NOT NULL DROP TABLE #abc
	IF EXISTS (SELECT * FROM Products WHERE id = ?) 
	BEGIN ... END
	ELSE BEGIN ... END
	--break a script
	if ... set noexec on ... set noexec off -- break a script 

'3 Transformation，Aggregation'
	--pivot & unpivot
	SELECT VendorID, Employee, Orders
	FROM 
	   (SELECT VendorID, Emp1, Emp2, Emp3, Emp4, Emp5
 	   FROM pvt) p
  	UNPIVOT 
	   (Orders FOR Employee IN  
	     (Emp1 , Emp2, Emp3, Emp4, Emp5)
	)AS unpvt;

	--unpivot to multiple columns: 1) union  all, 2) unpivot, 3) cross apply 


	--change table/column name
	EXEC  sp_rename '…', '…'; --change table name
	EXEC sp_rename 'work.dbo.sz_acsc_appfeed.lossdate1','.lossdate','column'; --Change column name

	--show data type
	EXEC sp_help 'tablename' --data type
	EXEC tempdb.dbo.sp_help N'#t' --temp teble

	--Updage from join
	update u
	set u.assid = s.assid
	from ud u
	    inner join sale s o
	        u.id = s.udid

'4 Select, indexing'
	--Uniquify: find dupe, dedupe, add seq number
	select Req, COUNT(*) c from work.dbo.grinnell_input group by Req having COUNT(*) > 1 --Find dupes
	
	--Select row with the value max in one column - by self join (or select by partition RK or join on max value)
	select a.*
	from t1 a
	left join t1 b
	on a.col1 < b.col1 
	where b.col1 is null 

	--random sample rows
	select top 100 * from VISUDB.batch.OutgoingBatch order by NEWID()

	--Recursion
	WITH Xs AS (
		SELECT 1 x
		UNION ALL
		SELECT x+1 FROM Xs WHERE x < 52)
	SELECT * FROM Xs
	option (maxrecursion 0)

	--offset and fetch
	select *
	from table 
	order by key
	OFFSET 3 ROWS --remove the first N rows
	FETCH NEXT 2 ROWS ONLY --take the next N rows


'5 Data structures'
	--Date
	DATEADD(month, DATEDIFF(month, 0, GETDATE()), 0) --first day of month

'6 Functions'
	--Logic
	iif(condition, value if true, value if false)

	--Cross apply
	select f.* from table1 t cross apply dbo.function_name(t.ID) f --cross apply for Table Valued Functions

	--Common use
	CTE, Except/Intersect, Update, roll up
	group by / partition --on whole query vs window function
	ROW_NUMBER() / rank() / Dense_rank() + over(order by) / over(partition by order by) -- dense_rank = rank w/o gap: 1,1,1,2...
