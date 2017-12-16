<HTML>
<HEAD>
<TITLE>ADD Account</TITLE>

<h2 style="color:Tomato"> Product Details: </h2>

<!-- Get all students taken the class and the instructor -->

	<CFQUERY NAME="ProductDetails" DATASOURCE="UnivDB" DBTYPE="ODBC">
        	 select productid , pname , description, supplier , price ,image from product
			 where productid = #url.id# and price = #url.price#
    </CFQUERY>
   <CFQUERY NAME="ReviewRating" DATASOURCE="UnivDB" DBTYPE="ODBC">
        	 select  avg(rating) as avgrating from review
			 where productid = #url.id#
    </CFQUERY>

</HEAD>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#0000FF" VLINK="#006699" ALINK="#000000">
<CFOUTPUT query="ReviewRating">
 <cfset avgrating = avgrating>
</cfoutput>


<table BORDER=0 WIDTH=800>

<CFOUTPUT query="ProductDetails">

<form action="cart_added.cfm?id=#productid#" id="questions" method="post" name="questions">
<tr>
	<td><img src="#image#" style="width:300x;height:200px;">
	<br>
	<br>
	<centre><style="color:Tomato">Unit Price:</style></centre>
	<style="color:Tomato"><strong>#price#</strong></style>
	<td>
	<td>#description#</td>
	
	
	
</tr>
	
<tr>
<td>Supplier:  #supplier# <td>
</tr>

<tr>

<td>Review rating:  #avgrating#<td>

</tr>

</tr>
<tr>

</tr>

<tr>
<tr>
<td><a href="Cart_insert.cfm?id=#productid#" style="color:Tomato"><STRONG>  Add  to Cart </STRONG></a></td>
<tr>
</tr>

<tr>
</tr>
<tr>

</tr>

<tr>
</tr>

<tr>
</tr>
<tr>

</tr>

<tr>
</tr>

 <H1>
	<div>
	<td><a href="adduser.cfm?id=#productid#" style="color:Tomato"><STRONG>Create Account</STRONG></a></td>
    <td><a href="login.cfm?id=#productid#" style="color:Tomato"><STRONG>Login</STRONG></a></td>
	</div>
	
	
</H1>
</tr>	
	

</TABLE>
</form>
</cfoutput>
<HR>

<a href="main_new.cfm"><img src="../images/left_arrow.png"> <medium><em>Back to Main</em></medium></a>

</BODY>
</HTML>

