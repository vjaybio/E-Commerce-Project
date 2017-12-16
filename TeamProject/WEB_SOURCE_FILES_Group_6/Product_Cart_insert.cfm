<HTML>
<HEAD>
<TITLE>CART</TITLE>

<h2  style="color:Tomato" > Product Added to cart Successfully !!! </h2>

<CFQUERY name="GetUserId" DATASOURCE="UnivDB" DBTYPE="ODBC">
	select userid from shopper where fname = '#Form.username#' and password = '#Form.password#'
</CFQUERY>
<CFOUTPUT query="GetUserId">
 <cfset userid = userid>
</cfoutput>

<CFSET session.auname     = "userid">

<CFQUERY name="InsertCART" DATASOURCE="UnivDB" DBTYPE="ODBC">
	INSERT INTO cart VALUES (cartid_seq.NEXTVAL,#url.id#,#userid#,1) 
</CFQUERY>

	
</HEAD>

 <CFOUTPUT query="GetUserId">

 
<BODY>
 
<FORM action="order.cfm?id=#url.id#&userid=#userid#" method="post">

	
	<input style="color:Blue" type = submit name="Place Order" value ="Place Order"> 
	

</FORM>
</BODY>
</CFOUTPUT>
<a href="main_new.cfm"><img src="images/left_arrow.png"> <medium><em>Back to Main Menu</em></medium></a>

</HTML>

