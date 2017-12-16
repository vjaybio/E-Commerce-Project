<HTML>
<HEAD>
<TITLE>Advisor List</TITLE>

<!-- Retrieve all advisors -->
<CFQUERY NAME="AdvisorList" DATASOURCE="UnivDB" DBTYPE="ODBC">
    SELECT A.advID, firstName, lastName, email, phoneNum, location
    FROM   Advisor A INNER JOIN AdvisorPhone H
    		ON A.advID = H.advID
    ORDER BY firstName, lastName
</CFQUERY> 

</HEAD>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#0000FF" VLINK="#006699" ALINK="#000000">

<table nowrap cellspacing="4" cellpadding="4" border="0">
<tr>
	<td><img src="../images/advisor.png"></td>
	<td><H1>
      <FONT FACE="times new roman, times" COLOR="#006666">
      <STRONG>Advisors Directory</STRONG> 
      </FONT>
      </H1>
    </td>
</tr>
</table>

<HR>
<P>
<table nowrap cellspacing="4" cellpadding="4" border="0">
<tr>
	<td colspan="4">Click a advisor name below to view all students assigned to the advisor:</td>
</tr>
<tr>
	<td width="20"></td>
    <td><strong>Name</strong></td>
    <td><strong>Email</strong></td>
    <td><strong>Phone</strong></td>
    <td><strong>Location</strong></td>
<tr>
<CFSET AdvisorID = 0>

<CFOUTPUT query="AdvisorList">
<CFIF AdvisorID IS NOT AdvID>
<!-- The advisor has multiple phone numbers. Display only the phone number -->
<tr>
	<td width="20"></td>
    <td><a href="advisee_rpt.cfm?id=#advID#"> #firstName# #lastName#</a></td>
    <td>#email#</td>
    <td>#phoneNum#</td>
    <td>#location#</td>
</tr>
<CFELSE>
<tr>
	<td width="20"></td>
    <td></td>
    <td></td>
    <td>#phoneNum#</td>
    <td></td>
</tr>
</CFIF>
<CFSET AdvisorID = AdvID>
</CFOUTPUT>
</TABLE>

<hr>
<a href="../main.cfm"><img src="../images/left_arrow.png"> <small><em>Back to Main</em></small></a>

</BODY>
</HTML>

