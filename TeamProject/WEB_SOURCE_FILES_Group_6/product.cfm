<HTML>
<HEAD>
<TITLE>Web based Application</TITLE>

<!--Get all students in the database -->
<CFQUERY NAME="ProductList" DATASOURCE="UnivDB" DBTYPE="ODBC">
    select productid , pname , description, supplier , price ,image from product
	
</CFQUERY>

</HEAD>
<BODY>


<HR>
<P>
<form action="cart_added.cfm?id=#ProductId#" id="questions" method="post" name="questions">
		
	
<table nowrap cellspacing="4" cellpadding="4" border="0">

<CFOUTPUT query="ProductList">
<tr>
<div>
	<td><img src="#image#" style="width:350x;height:100px;"></td>
	</div>
	<div>
	

	<td>ProductId:</td>
	<td style="color:Tomato"><strong>#ProductId#</strong></td>
	</div>
	<td width="20"></td>
    <td><a href="Product_details.cfm?id=#ProductId#&price=#price#"> #pname# </a></td>
	<td>Manufacturer:</td>
    <td>#supplier#</td>
	<td>Unit Price:</td>
    <td>#price#</td>
    
</tr>
</cfoutput>
</TABLE>
</form>
</BODY>
</HTML>

