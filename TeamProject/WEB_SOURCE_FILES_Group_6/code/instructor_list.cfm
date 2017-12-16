<HTML>
<HEAD>
<TITLE>Instructor List</TITLE>

<!--webbot bot="HTMLMarkup" StartSpan -->
<CFQUERY NAME="InstructorList" DATASOURCE="UnivDB" DBTYPE="ODBC">
    SELECT I.instrID, firstName, lastName, email, phoneNum, location
    FROM   Instructor I INNER JOIN InstructorPhone P
    		ON I.instrID = P.instrID
    ORDER BY firstName, lastName
</CFQUERY>
<!--webbot BOT="HTMLMarkup" endspan --> 

</HEAD>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#0000FF" VLINK="#006699" ALINK="#000000">

<table nowrap cellspacing="4" cellpadding="4" border="0">
<tr>
	<td><img src="../images/instructor.png"></td>
	<td><H1>
      <FONT FACE="times new roman, times" COLOR="#006666">
      <STRONG>Instructors Directory</STRONG> 
      </FONT>
      </H1>
    </td>
</tr>
</table>

<HR>
<P>
<table nowrap cellspacing="4" cellpadding="4" border="0">
<tr>
	<td colspan="4">Click a name below to view the classes taught by the instructor:</td>
<tr>
	<td width="20"></td>
    <td><strong>Name</strong></td>
    <td><strong>Email</strong></td>
    <td><strong>Phone</strong></td>
    <td><strong>Location</strong></td>
<tr>
<CFSET InstructorID = 0>

<CFOUTPUT query="InstructorList">
<CFIF InstructorID IS NOT instrID>
<tr>
	<td width="20"></td>
    <td><a href="instructor_rpt.cfm?empID=#instrID#"> #firstName# #lastName#</a></td>
    <td>#email#</td>
    <td>#phoneNum#</td>
    <td>#location#</td>
</tr>
<CFELSE>
<tr>
	<td width="20"></td>
    <td></a></td>
    <td></td>
    <td>#phoneNum#</td>
    <td></td>
</tr>
</CFIF>
<CFSET InstructorID = instrID>
</cfoutput>
</TABLE>

<hr>
<a href="../main.cfm"><img src="../images/left_arrow.png"> <small><em>Back to Main</em></small></a>

</BODY>
</HTML>

