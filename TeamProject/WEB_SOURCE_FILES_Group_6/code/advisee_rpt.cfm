<HTML>
<HEAD>
<TITLE>Advisee List</TITLE>

<!-- Get Advisor information -->
<CFQUERY NAME="Advisor" DATASOURCE="UnivDB" DBTYPE="ODBC">
    SELECT A.advID, firstName, lastName, email, phoneNum, location
    FROM   Advisor A INNER JOIN AdvisorPhone H
    		ON A.advID = H.advID
    WHERE  A.advID = #URL.id#
    ORDER BY firstName, lastName
</CFQUERY>

<!-- Get all advisees assigned to the advisor -->
<CFQUERY NAME="AdviseeList" DATASOURCE="UnivDB" DBTYPE="ODBC">
    SELECT S.stuID, firstName, lastName, email, phoneNum, degree
    FROM   (((Student S INNER JOIN StudentPhone H
    		ON S.stuID = H.stuID) INNER JOIN AdvisoryMeeting A
    		ON S.stuID = A.stuID) INNER JOIN StudentProgram M
            ON S.stuID = M.stuID) INNER JOIN Program P
            ON M.progmID = P.progmID
    WHERE  advID = #URL.id#
    ORDER BY firstName, lastName
</CFQUERY>

</HEAD>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#0000FF" VLINK="#006699" ALINK="#000000">

<table nowrap cellspacing="4" cellpadding="4" border="0">
<tr>
	<td><img src="../images/advisor.png"></td>
	<td><H1>
      <FONT FACE="times new roman, times" COLOR="#006666">
      <STRONG>Advisor Report</STRONG> 
      </FONT>
      </H1>
    </td>
</tr>
</table>

<HR>
<P>

<!-- Display Advisor Information -->
<table nowrap cellspacing="1" cellpadding="2" border="0">
<CFSET prev = 0>
<CFOUTPUT query="Advisor">
<CFIF prev IS NOT #advID#>
<tr>
	<td><strong>Advisor: </strong></td>
	<td colspan="2" align="left">#firstName# #lastName#</td>
</tr>
<tr>
	<td width="20"></td>
    <td>Email: </td>
    <td>#email#</td>
</tr>
<tr>
	<td width="20"></td>
    <td>Office: </td>
    <td>#location#</td>
</tr>
</CFIF>
<tr>
	<td width="20"></td>
    <td>Phone: </td>
    <td>#phoneNum#</td>
</tr>
<CFSET prev = #advID#>

</CFOUTPUT>
</table>

<!-- Display all advisees assigned to the advisor -->
<table nowrap cellspacing="4" cellpadding="4" border="0">

<!-- If there is no advisee assigned, display a message -->
<CFIF AdviseeList.RecordCount IS 0>
<tr>
	<td width="20"></td>
	<td colspan="5">*** No student is assigned to the advisor ***</td>
</tr>
<CFELSE>
<tr>
	<td><strong>Advisees: </strong></td>
	<td colspan="5"></td>
</tr>
<tr>
	<td width="20"></td>
    <td><strong>ID</strong></td>
    <td><strong>Name</strong></td>
    <td><strong>Email</strong></td>
    <td><strong>Phone</strong></td>
    <td><strong>Degree</strong></td>
<tr>
<CFOUTPUT query="AdviseeList">
<tr>
	<td width="20"></td>
    <td>#stuID#</td>
    <td><a href="student_rpt.cfm?id=#stuID#"> #firstName# #lastName#</a></td>
    <td>#email#</td>
    <td>#phoneNum#</td>
    <td>#degree#</td>
</tr>
</CFOUTPUT>

</CFIF>

</TABLE>

<hr>
<a href="advisor_list.cfm"><img src="../images/left_arrow.png"> <small><em>Back to Advisors Directory</em></small></a>

</BODY>
</HTML>

