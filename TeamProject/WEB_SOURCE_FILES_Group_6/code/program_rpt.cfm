<HTML>
<HEAD>
<TITLE>Program Report</TITLE>

<!-- Get course information -->
<CFQUERY NAME="Program" DATASOURCE="UnivDB" DBTYPE="ODBC">
    SELECT progmID, description, requiredCreditHours, D.name
    FROM   Program M INNER JOIN Department D
    		ON M.deptID = D.deptID
    WHERE  M.progmID = #URL.id#
</CFQUERY>

<!-- Get all students selected the program-->
<CFQUERY NAME="StudentList" DATASOURCE="UnivDB" DBTYPE="ODBC">
    SELECT S.stuID, firstName, lastName, email, H.phoneNum
    FROM   (Student S INNER JOIN StudentProgram P
    		ON S.stuID = P.stuID) INNER JOIN StudentPhone H
            	ON S.stuID = H.stuID
    WHERE  progmID = #URL.id#
    ORDER BY firstName, lastName
</CFQUERY>

</HEAD>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#0000FF" VLINK="#006699" ALINK="#000000">

<table nowrap cellspacing="4" cellpadding="4" border="0">
<tr>
	<td><img src="../images/programs.png"></td>
	<td><H1>
      <FONT FACE="times new roman, times" COLOR="#006666">
      <STRONG>Program Report</STRONG> 
      </FONT>
      </H1>
    </td>
</tr>
</table>

<HR>
<P>

<!-- Display Advisor Information -->
<table nowrap cellpadding="2" border="0">
<CFOUTPUT query="Program">
<tr>
	<td><strong>Program: </strong></td>
	<td colspan="2">#description#</td>
</tr>
<tr>
    <td width="20"></td>
    <td>Required Credit Hours:</td>
    <td>#requiredCreditHours# hours</td>
</tr>
<tr>
    <td width="20"></td>
    <td>Academic Department:</td>
    <td>#name#</td>
</tr>
<tr>
    <td colspan="3"></td>
</tr>
</CFOUTPUT>
</table>

<p><strong>Students elected the program:</strong></p>

<!-- Display all advisees assigned to the advisor -->
<table nowrap cellpadding="4" border="0">
<CFIF StudentList.RecordCount IS 0>
<tr>
	<td width="20"></td>
    <td colspan="4">*** No student elected the program ***</td>
</tr>
<CFELSE>
<tr>
	<td width="20"></td>
    <td><strong>ID</strong></td>
    <td><strong>Name</strong></td>
    <td><strong>Email</strong></td>
    <td><strong>Phone</strong></td>
</tr>
<CFOUTPUT query="StudentList">
<tr>
	<td width="20"></td>
    <td>#stuID#</td>
    <td><a href="student_rpt.cfm?id=#stuID#">#firstName# #lastName#</a></td>
    <td>#email#</td>
    <td>#phoneNum#</td>
</tr>
</CFOUTPUT>
</CFIF>
</TABLE>

<hr>
<a href="program_list.cfm"><img src="../images/left_arrow.png"> <small><em>Back to Program List</em></small></a>

</BODY>
</HTML>

