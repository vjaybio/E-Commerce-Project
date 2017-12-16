<HTML>
<HEAD>
<TITLE>Student List</TITLE>

<!-- Get Studentinformation -->
<CFQUERY NAME="Student" DATASOURCE="UnivDB" DBTYPE="ODBC">
    SELECT StuID, firstName, lastName, email
    FROM  STUDENT
    WHERE  StuID = '1023'

</CFQUERY>


</HEAD>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#0000FF" VLINK="#006699" ALINK="#000000">


<HR>
<P>

<!-- Display Student Information -->
<table nowrap cellspacing="1" cellpadding="2" border="0">
<CFSET prev = 0>
<CFOUTPUT query="Student">

<tr>
	<td><strong>Student: </strong></td>
	<td colspan="2" align="left">#firstName# #lastName#</td>
</tr>
<tr>
	<td width="20"></td>
    <td>Email: </td>
    <td>#email#</td>
</tr>



</P>
</HR>

</CFIF>

</TABLE>


</BODY>
</HTML>

