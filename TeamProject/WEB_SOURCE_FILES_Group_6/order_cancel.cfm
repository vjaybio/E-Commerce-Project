<HTML>
<HEAD>
<TITLE>Order History</TITLE>

<h2  style="color:Tomato" > Order Cancelled Successfully !!! </h2>

<!--Get all students in the database -->
<CFQUERY NAME="ordercancel" DATASOURCE="UnivDB" DBTYPE="ODBC">
     UPDATE finalorder set orderstatus = 'Cancelled' where orderid = #Form.orderid# 	
</CFQUERY>

</HEAD>
<BODY>


<HR>
<P>
<table nowrap cellspacing="4" cellpadding="4" border="0">

</TABLE>
</BODY>
<a href="main_new.cfm"><img src="images/left_arrow.png"> <medium><em>Back to Main Menu</em></medium></a>
</HTML>

