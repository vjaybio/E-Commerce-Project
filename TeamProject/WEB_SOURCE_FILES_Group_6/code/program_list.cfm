<HTML>
<HEAD>
<TITLE>Program List</TITLE>

<!--webbot bot="HTMLMarkup" StartSpan -->
<CFQUERY NAME="ProgramList" DATASOURCE="UnivDB" DBTYPE="ODBC">
    SELECT progmID, description, requiredCreditHours, D.name
    FROM   Program M INNER JOIN Department D
    		ON M.deptID = D.deptID
    ORDER BY description
</CFQUERY>
<!--webbot BOT="HTMLMarkup" endspan --> 

</HEAD>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#0000FF" VLINK="#006699" ALINK="#000000">

<table nowrap cellspacing="4" cellpadding="4" border="0">
<tr>
	<td><img src="../images/programs.png"></td>
	<td><H1>
      <FONT FACE="times new roman, times" COLOR="#006666">
      <STRONG>Academic Programs</STRONG> 
      </FONT>
      </H1>
    </td>
</tr>
</table>

<HR>
<P>
<table nowrap cellspacing="4" cellpadding="4" border="0">
<tr>
	<td colspan="4">Click a program link below to view students in the program:</td>
<tr>
	<td width="20"></td>
    <td><strong>Program Name </strong></td>
    <td><strong>Required Credit Hours</strong></td>
    <td><strong>Department</strong></td>
<tr>
<CFOUTPUT query="ProgramList">
<tr>
	<td width="20"></td>
    <td><a href="program_rpt.cfm?id=#progmID#"> #description#</a></td>
    <td align="center">#requiredCreditHours#</td>
    <td>#name#</td>
</tr>
</cfoutput>
</TABLE>

<hr>
<a href="../main.cfm"><img src="../images/left_arrow.png"> <small><em>Back to Main</em></small></a>

</BODY>
</HTML>

