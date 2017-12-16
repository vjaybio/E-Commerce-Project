<HTML>
<HEAD>
<TITLE>ADD Account</TITLE>

	<CFQUERY NAME="ProductDetails" DATASOURCE="UnivDB" DBTYPE="ODBC">
			select productid , pname , description, supplier , price ,image from product
			where productid = #url.id#
    </CFQUERY>
	
</HEAD>

 <h3  style="color:Tomato" > Please Login or Sign Up for adding product to Cart </h3>
 
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#0000FF" VLINK="#006699" ALINK="#000000">



<table nowrap cellspacing="4" cellpadding="4" border="0">

<CFOUTPUT query="ProductDetails">


<FORM action="adduser.cfm?id=#ProductId#" method="post">
  <td>
 <a href="adduser.cfm?id=#ProductId#" style="color:Tomato" > <strong>Create Account <strong></a> 
 </td>
 <td>OR</td>
 <td>
 </td>
 <td>

 <a href="login.cfm?id=#ProductId#" style="color:Tomato" ><strong>Login<strong></a>
   </td>
 
</FORM>


</cfoutput>
</TABLE>
<hr>


<a href="main_new.cfm"><img src="images/left_arrow.png"> <medium><em>Back to Main</em></medium></a>

</BODY>
</HTML>

