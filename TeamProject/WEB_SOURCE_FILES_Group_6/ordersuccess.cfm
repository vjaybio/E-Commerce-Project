<HTML>
<HEAD>
<TITLE>Order Success</TITLE>


<h2  style="color:Tomato" > Order Placed Successfully !!! </h2>

<CFQUERY NAME="GetPrice" DATASOURCE="UnivDB" DBTYPE="ODBC">
   select price, (price*0.05)*price as tax from product 
   where ProductId = #url.id#
    
</CFQUERY>



<CFQUERY name="InsertOrder" DATASOURCE="UnivDB" DBTYPE="ODBC">
	INSERT INTO finalorder   
	VALUES (
	finalorderid_seq.NEXTVAL,
	#url.userid#,
	'#Form.street#',
	'#Form.city#',
	'#Form.state#',
	#Form.ZipCode#,
	'#Form.pphone#',
	#url.tax#,
	#url.price#,
	'InProgress',
	sysdate,
	sysdate,
	sysdate+10)
</CFQUERY>


<CFQUERY name="InsertProductOrder" DATASOURCE="UnivDB" DBTYPE="ODBC">
	insert into productorder values(finalorderid_seq.CURRVAL,#url.id#,1)
</CFQUERY>

<CFQUERY name="InsertPayment" DATASOURCE="UnivDB" DBTYPE="ODBC">
	insert into payment values (payment_seq.NEXTVAL,finalorderid_seq.CURRVAL,
	'#Form.CardNumber#',
	'#Form.CardName#',
	'#Form.CardType#',
	TO_DATE('#Form.month#/01/#Form.year#','mm/dd/yyyy'),
	#Form.SecurityCode#)
</CFQUERY>

<CFQUERY name="DeleteCart" DATASOURCE="UnivDB" DBTYPE="ODBC">
	delete from cart where userid = #url.userid#
</CFQUERY>


</HEAD>
<BODY>


<HR>
<P>
<table nowrap cellspacing="4" cellpadding="4" border="0">

<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#0000FF" VLINK="#006699" ALINK="#000000">
<CFOUTPUT query="GetPrice">

<FORM action="Order_history.cfm?id=#url.id#&userid=#userid#" method="post">

	<tr>
	<td><input style="color:Blue" type = "submit" name="OrderHistory" value ="View Order History"> 
	</td>
	<td>
	</td>
	<td>
	</td>
	<td>
	<input style="color:Blue" type = "submit" name="EditOrder" value ="Edit Order">
	<td>
	</tr>	
	

</FORM>

</CFOUTPUT>
</BODY>

</TABLE>

<br>
<br>
<br>

<a href="main_new.cfm"><img src="images/left_arrow.png"> <medium><em>Back to Main Menu</em></medium></a>


</HTML>

