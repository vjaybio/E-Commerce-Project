<HTML>
<HEAD>
<TITLE>Order History</TITLE>

<h2  style="color:Tomato" > Order History: </h2>

<!--Get all students in the database -->
<CFQUERY NAME="orderlist" DATASOURCE="UnivDB" DBTYPE="ODBC">
    select fo.orderid as orderid, fo.sh_street as street, fo.sh_city as city, fo.sh_state as state,
	fo.sh_zip as zip , p.pname as pname,po.qty as qty , (fo.tax+fo.subtotal) as total , fo.orderstatus as status ,
	fo.expected_arrival as ShippingDate from 
	finalorder fo, product p , productorder po
    where fo.orderid = po.orderid and po.productid = p.productid and userid = #url.userid#	
    
</CFQUERY>

</HEAD>
<BODY>


<HR>
<P>
<table nowrap cellspacing="4" cellpadding="4" border="0">


<tr>

<FORM action="order_cancel.cfm?id=#url.id#&userid=#userid#" method="post" >

<CFOUTPUT query="orderlist">
	<td style="color:Blue">Order Id:</td>
	<td><strong>#orderid#</strong></td>
	</div>
	
	<tr>
   	<td align="right"><input type="checkbox" id ="#orderid#" name="orderid" value="#orderid#"></td>
    <td>Product Name: &emsp; #pname#
	&emsp;Quantity:#qty#</td>
	<td>Total:$#total# &emsp; Status:#status# </td>
	
	</tr>
	<tr>
	<td>
	</td>
	<td>Shipping Address: &emsp; #street# #city# #state# #zip# </td>
	<td>Shipping Date: #ShippingDate# </td>
	</tr>

</cfoutput>
<tr>
    <tr>
    </tr>
	<tr>
	</tr>
	<tr>
	</tr>
	<td>&emsp;</td>
    <td> &emsp; <input type="submit" value ="Cancel Order">&emsp; <input type="submit" value ="Edit Order"> &emsp; <input type="reset"> </td>

</tr>

</FORM>

</TABLE>
</BODY>
<a href="main_new.cfm"><img src="images/left_arrow.png"> <medium><em>Back to Main Menu</em></medium></a>
</HTML>

