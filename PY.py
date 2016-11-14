'0 Reminders'
	# scoping rules: function and loop create local scopes for variables. You need to access the raw/global variable to change value!!

'1 General, Misc'
	functions (code called by name) vs method (code called by name for an object) 
	shallow (inserts references of objects) vs deep copy (inserts recrusively), only differnet for compound objects
	
	# Python in Windows
	r+<path> # to be recognized
	
	# special characters
	'"' | "'" # represent single & double quotes

'2 Pandas'
	# basic
	df = pd.DataFrame(np.random.rand(3,2))

	# missing data
		math.isnan() # check nan
		a = float('NaN') # assign np.nan
		float, object # dtypes that can store nulls

	# select, indexing
		# select row vs col
		df.ix[2] vs df.ix[:,2] or df.ix[:,[15,43]]
		# [[]] returns df (keeping data type), [] returns series
		[[]] vs []
		# logic
		~ # negate logic - not
		df[(condition1)&(condition2)] # use () for multiple where conditions
		# select multiple columns
		df[[0,1,3]] | df[['col1','col3']]
	
	# transformation, aggregation
		# change row / column order index
		df.reindex() df.reindex(columns=[])
		# apply works on a row / column basis of a DataFrame, applymap works element-wise on a DataFrame, and map works element-wise on a Series.
		apply vs applymap vs map 
		# change column name
		df_i.rename(columns={'old_name':'new_name'}, inplace=True) # rename a specific col
		df.columns = [<new headers>]
		# SQL like joins (on equals and not equals):
		merge, then select via conditions
		# drop column
		df.drop(['column_name','another_name'], 1)
		dF.drop(df.columns[[0, 1, 3]], axis=1) 
		# replace
		df.replace('a', '') # replace by whole cell match
		df.replace('[%/]', '',regex=True) # replace by partial string match
		# update based on conditions
		df.loc[condition, 'col1'] = value_new #update dataframes
		s[s>0] = value_new #update series

'3 I/O, ETL, OPERATION' 
	# delete a file if it exists
	try: os.remove(p) 
	except OSError: pass

	# database connection to python
		from sqlalchemy import create_engine
		import pyodbc, urllib
		params = urllib.quote_plus('DRIVER={SQL Server Native Client 10.0};SERVER=XDOSQLMII01,3341;DATABASE=WORK;Trusted_Connection=yes')
		engine = create_engine("mssql+pyodbc:///?odbc_connect=%s" % params)

	# exploration

	# os
		os.path.getsize(<path>) # get size of file in Byte
		os.stat(fname).st_size 

	# get row count 
		num_lines = sum(1 for line in open(<path>)) # method 1
		UDF.file_len() # method 2
		wc -l <file> # method 3 terminal

'4 Data structure'
	[]*N # repeat
	[5*x for x in [...]] # multiply each elt
	float('inf') # infinity
	datetime.datetime.strptime(date_string, format1).strftime(format2) # time / date format

'5 Module, class'
	# map
		map(lambda x: 1 if x > 5 else 0)

	# class
		class ppl:
		    def __init__(self, FN, LN):
		        self.fullname = FN + ' ' + LN
		        self.val = 100
		        self.cars = []
		    def double(self):
		        self.val = self.val*2
		    def add(self, car):
		        self.cars.append(car)
		        
		a = ppl('Joe', 'Smith')
		b = ppl('Tim', 'Scott')
		b.add('C63')
		b.double()
		print a.fullname, a.cars, a.val
		print b.fullname, b.cars, b.val
