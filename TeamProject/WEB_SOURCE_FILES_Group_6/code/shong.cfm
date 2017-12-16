<HTML>
<HEAD>
<TITLE>List Students</TITLE>

<!--Get all students in the database -->
<CFQUERY NAME="myQuery" DATASOURCE="CIS3730DB" DBTYPE="ODBC">
    SELECT  stuID, s.firstName, s.lastName, s.email, s.phone, a.firstName, a.lastName
    FROM   	Student s, Advisor a
    WHERE	s.advEmpID = a.advEmpID
    ORDER BY  s.firstName, s.lastName
</CFQUERY>

</HEAD>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#0000FF" VLINK="#006699" ALINK="#000000">

<table nowrap cellspacing="4" cellpadding="4" border="0">
<tr>
	<td><img src="../images/students.jpg"></td>
	<td><H1>
      <FONT FACE="times new roman, times" COLOR="#006666">
      <STRONG>Student Directory</STRONG> 
      </FONT>
      </H1>
    </td>
</tr>
</table>

<HR>
<P>
<table nowrap cellspacing="4" cellpadding="4" border="0">
<tr>
	<td colspan="4">Click a student name below to view a report of the student:</td>
<tr>
	<td width="20"></td>
    <td><strong>ID</strong></td>
    <td><strong>Name</strong></td>
    <td><strong>Email</strong></td>
    <td><strong>Phone</strong></td>
    <td><strong>Advisor</strong></td>
<tr>
<CFOUTPUT query="myQuery">
<tr>
	<td width="20"></td>
    <td>#stuID#</td>
    <td>#s.firstName# #s.lastName#</a></td>
    <td>#s.email#</td>
    <td>#s.phone#</td>
    <td>#a.firstName# #a.lastName#</td>
</tr>
</cfoutput>
</TABLE>

<hr>
<a href="../main.cfm"><img src="../images/left_arrow.png"> <small><em>Back to Main</em></small></a>

</BODY>
</HTML>

