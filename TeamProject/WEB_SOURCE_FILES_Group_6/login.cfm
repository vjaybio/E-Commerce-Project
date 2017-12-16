<!DOCTYPE html>

<html lang="en">
<head>
	<title>login</title>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1" name="viewport">
	<link href="styles_1.css" rel="stylesheet">
		
	<!--Get all students in the database -->
	<CFQUERY NAME="ProductList" DATASOURCE="UnivDB" DBTYPE="ODBC">
		select productid , pname , description, supplier , price ,image from product
			 where productid = #url.id#	
		
	</CFQUERY>

</head>

<body>
   <h2 style="color:Tomato"> Login: </h2>
	<CFOUTPUT query="ProductList">
	<FORM action="Product_Cart_insert.cfm?id=#url.id#" method="post">
	<div>
	Username: <input type="text" name="username" id ="username">
	</div>
	<br>
	<div>
	Password: <input type="password" name="Password" id ="password" placeholder="Enter a Password">
	</div>
	<div>
	<br>
	<br>
	<input type = submit name="LOGIN"> 
  </div>
	
	</cfoutput>
	</FORM>
</table>
</body>

  

</html>