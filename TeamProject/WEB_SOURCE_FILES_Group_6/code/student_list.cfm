<HTML>
<HEAD>
<TITLE>List Students</TITLE>

<!--Get all students in the database -->
<CFQUERY NAME="StudentList" DATASOURCE="UnivDB" DBTYPE="ODBC">
    SELECT Student.stuID, firstName, lastName, email, phoneNum
    FROM   	Student INNER JOIN StudentPhone
    			ON Student.stuID = StudentPhone.stuID
    ORDER BY firstName, lastName
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
<tr>
<CFOUTPUT query="StudentList">
<tr>
	<td width="20"></td>
    <td>#stuID#</td>
    <td><a href="student_rpt.cfm?id=#stuID#"> #firstName# #lastName#</a></td>
    <td>#email#</td>
    <td>#phoneNum#</td>
</tr>
</cfoutput>
</TABLE>

<hr>
<a href="../main.cfm"><img src="../images/left_arrow.png"> <small><em>Back to Main</em></small></a>

</BODY>
</HTML>

