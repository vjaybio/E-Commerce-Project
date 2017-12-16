<HTML>
<HEAD>
<TITLE>User logged in</TITLE>

	<!--Get all students in the database -->
<h2 style="color:Tomato"> You have successfully created Account!!! </h2>


<CFQUERY name="InsertShopper" DATASOURCE="UnivDB" DBTYPE="ODBC">
	INSERT INTO Shopper   
	VALUES (
		USERID_SEQ.NEXTVAL,
		'#Form.fname#',
		'#Form.lname#',
		'#Form.email#',
		'#Form.Password#',
		'#Form.phone#',
		'#Form.street#',
		'#Form.city#',
		'#Form.state#',
		 #Form.ZipCode#,
		'#Form.CardNumber#',
		'#Form.SecurityCode#',
		TO_DATE('#Form.month#/01/#Form.year#','mm/dd/yyyy'))
</CFQUERY>

<CFQUERY name="GetUserId" DATASOURCE="UnivDB" DBTYPE="ODBC">
	select userid from shopper where fname = '#Form.fname#' and password = '#Form.Password#'
</CFQUERY>
<CFOUTPUT query="GetUserId">
 <cfset userid = userid>
</cfoutput>

<CFQUERY name="InsertCART" DATASOURCE="UnivDB" DBTYPE="ODBC">
	INSERT INTO cart VALUES (cartid_seq.NEXTVAL,#url.id#,#userid#,1) 
</CFQUERY>

<CFSET session.auname     = "userid">

<h3 style="color:Blue"> Product added in Cart!!! </h1>
</HEAD>
<BODY>


<HR>
<P>
<table nowrap cellspacing="4" cellpadding="4" border="0">

<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#0000FF" VLINK="#006699" ALINK="#000000">
<CFOUTPUT query="GetUserId">

<FORM action="order.cfm?id=#url.id#&userid=#userid#" method="post">

	
	<input style="color:Blue" type = "submit" name="PlaceOrder" value ="Place Order"> 
	

</FORM>

</CFOUTPUT>
</BODY>

</TABLE>

<br>
<br>
<br>

<a href="main_new.cfm"><img src="images/left_arrow.png"> <medium><em>Back to Main Menu</em></medium></a>


</HTML>

