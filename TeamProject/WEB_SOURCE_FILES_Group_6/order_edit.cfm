<HTML>
<HEAD>
<TITLE>Order History</TITLE>

<h1  style="color:Tomato" > Order Canceled Successfully !!! </h1>

<!--Get all students in the database -->
<CFQUERY NAME="orderlist" DATASOURCE="UnivDB" DBTYPE="ODBC">
    SELECT 
	ProductId ,name,description,price,image,quantity
    FROM   order	
    
</CFQUERY>

</HEAD>
<BODY>


<HR>
<P>
<table nowrap cellspacing="4" cellpadding="4" border="0">

<CFOUTPUT query="orderlist">
<tr>

<FORM action="cancel_order.cfm?id=#url.id#&userid=#userid#" method="post" >
<td><img src="#image#" style="width:100x;height:100px;"></td>
	<td width="20"></td>
    <td>#ProductId#</td>
    <td><a href="Product_details.cfm?id=#ProductId#&price=#price#"> #name# #description#</a></td>
    <td>#price#</td>
    <td>#image#</td>
	<input type="submit" value="Submit" name = "Cancel Order">
</tr>

</FORM>
</cfoutput>
</TABLE>
</BODY>
</HTML>

