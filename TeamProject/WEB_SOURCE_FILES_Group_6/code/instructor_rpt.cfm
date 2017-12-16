<HTML>
<HEAD>
<TITLE>Instructor Report</TITLE>

<!-- Get Instructor information -->
<CFQUERY NAME="Instructor" DATASOURCE="UnivDB" DBTYPE="ODBC">
    SELECT I.instrID, firstName, lastName, email, phoneNum, location
    FROM   Instructor I INNER JOIN InstructorPhone P
    		ON I.instrID = P.instrID
    WHERE  I.instrID = #URL.empID#
</CFQUERY>

<!-- Get the departments the instructor affiliated --> 
<CFQUERY NAME="Department" DATASOURCE="UnivDB" DBTYPE="ODBC">
        SELECT UNIQUE D.name, H.phoneNum, D.location, C.title
    FROM   ((Instructor I INNER JOIN Department D
    		ON I.deptID = D.deptID) INNER JOIN DepartmentPhone H
            	ON D.deptID = H.deptID) INNER JOIN College C
            	ON D.collegeID = C.collegeID
    WHERE  I.instrID = #URL.empID#
    ORDER BY D.name
</CFQUERY>

<!-- Get all class taught by the instructor-->
<CFQUERY NAME="ClassList" DATASOURCE="UnivDB" DBTYPE="ODBC">
    SELECT UNIQUE term, C.courseNumber, title, numberOfCredits
    FROM   Class L INNER JOIN Course C
    		ON L.courseNumber = C.courseNumber
    WHERE  L.instrID = #URL.empID#
    ORDER BY term, C.courseNumber
</CFQUERY>

</HEAD>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#0000FF" VLINK="#006699" ALINK="#000000">

<table nowrap cellspacing="4" cellpadding="4" border="0">
<tr>
	<td><img src="../images/instructor.png"></td>
	<td><H1>
      <FONT FACE="times new roman, times" COLOR="#006666">
      <STRONG>Instructor Report</STRONG> 
      </FONT>
      </H1>
    </td>
</tr>
</table>

<HR>
<P>

<!-- Display Advisor Information -->
<table nowrap cellspacing="1" cellpadding="2" border="0">
<CFSET prevID = 0>
<CFOUTPUT query="Instructor">
<CFIF prevID IS NOT instrID>
<tr>
	<td><strong>Instructor: </strong></td>
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
<tr>
	<td width="20"></td>
    <td>Phone: </td>
    <td>#phoneNum#</td>
</tr>
<CFELSE>
<tr>
	<td width="20"></td>
    <td></td>
    <td>#phoneNum#</td>
</tr>
</CFIF>
<CFSET prevID = instrID>
</CFOUTPUT>

<!-- Display all affiliated department information -->
<CFOUTPUT query="Department">
<tr>
	<td width="20"></td>
    <td valign="top">Department: </td>
    <td>#name#<br>
   		#location#<br>
    	#title#<br>
    	#phoneNum#</td>
</tr>
</CFOUTPUT>
</table>

<!-- Display all advisees assigned to the advisor -->
<table nowrap cellspacing="4" cellpadding="4" border="0">

<!-- If there is no advisee assigned, display a message -->
<CFIF ClassList.RecordCount IS 0>
<tr>
	<td width="20"></td>
	<td colspan="5">*** The instructor has not taught any classes ***</td>
</tr>
<CFELSE>
<tr>
	<td><strong>Classes: </strong></td>
	<td colspan="4"></td>
</tr>
<tr>
	<td width="20"></td>
    <td><strong>Term</strong></td>
    <td><strong>Course #</strong></td>
    <td><strong>Title</strong></td>
    <td><strong>Credit Hours</strong></td>
<tr>
<CFOUTPUT query="ClassList">
<tr>
	<td width="20"></td>
    <td>#term#</td>
    <td>#courseNumber#</td>
    <td>#title#</td>
    <td align="center">#numberOfCredits#</td>
</tr>
</CFOUTPUT>

</CFIF>

</TABLE>

<hr>
<a href="instructor_list.cfm"><img src="../images/left_arrow.png"> <small><em>Back to Instructor Directory</em></small></a>

</BODY>
</HTML>

