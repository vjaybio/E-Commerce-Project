<HTML>
<HEAD>
<TITLE>Student Report</TITLE>

<!-- Get Student information -->
<CFQUERY NAME="Student" DATASOURCE="UnivDB" DBTYPE="ODBC">
    SELECT S.stuID, firstName, lastName, email, phoneNum, degree, creditHours
    FROM   ((Student S INNER JOIN StudentPhone P
    		ON S.stuID = P.stuID) INNER JOIN StudentProgram G
            	ON S.stuID = G.stuID) INNER JOIN Program M
                ON G.progmID = M.ProgmID
    WHERE  S.stuID = #URL.id#
</CFQUERY>

<!-- Get all programs elected by the student-->
<CFQUERY NAME="ProgramList" DATASOURCE="UnivDB" DBTYPE="ODBC">
   SELECT description, requiredCreditHours, name, phoneNum, D.location, title
    FROM   (((StudentProgram S INNER JOIN Program P
    		ON S.progmID = P.progmID) INNER JOIN Department D
            	ON P.deptID = D.deptID) INNER JOIN DepartmentPhone H
                ON D.deptID = H.deptID) INNER JOIN College C
                ON D.collegeID = C.collegeID
    WHERE  S.stuID = #URL.id#
    ORDER BY description
</CFQUERY>

<!-- Get the advisor of the advisor -->
<CFQUERY NAME="Advisor" DATASOURCE="UnivDB" DBTYPE="ODBC">
    SELECT A.advID, A.firstName, A.lastName, A.email, P.phoneNum, A.location
    FROM   (AdvisoryMeeting M INNER JOIN Advisor A
    		ON M.advID = A.advID) INNER JOIN AdvisorPhone P
            	ON A.advID = P.advID
    WHERE  M.stuID = #URL.id#
</CFQUERY>

<!-- Get all class taken by the students -->
<CFQUERY NAME="ClassList" DATASOURCE="UnivDB" DBTYPE="ODBC">
   SELECT term, C.courseNumber, title, numberOfCredits, grade, 
           I.instrID, I.firstName, I.lastName
    FROM   ((StudentGrade G INNER JOIN Class C
    		ON G.classID = C.classID) INNER JOIN Course R
            	ON C.courseNumber = R.courseNumber) INNER JOIN Instructor I
                ON C.instrID = I.instrID
    WHERE  G.stuID = #URL.id#
    ORDER BY R.courseNumber
</CFQUERY>

</HEAD>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#0000FF" VLINK="#006699" ALINK="#000000">

<table nowrap cellspacing="4" cellpadding="4" border="0">
<tr>
	<td><img src="../images/students.jpg"></td>
	<td><H1>
      <FONT FACE="times new roman, times" COLOR="#006666">
      <STRONG>Student Report</STRONG> 
      </FONT>
      </H1>
    </td>
</tr>
</table>

<HR>
<P>

<!-- Display the student Information -->
<table nowrap cellspacing="1" cellpadding="2" border="0">
<CFOUTPUT query="Student">
<tr>
	<td><strong>Student: </strong></td>
	<td colspan="3" align="left">#firstName# #lastName#</td>
</tr>
<tr>
	<td width="20"></td>
    <td>Student ID: </td>
    <td colspan="2">#stuID#</td>
</tr>
<tr>
	<td width="20"></td>
    <td>Current: </td>
    <td colspan="2">#creditHours# hours</td>
</tr>
<tr>
	<td width="20"></td>
    <td>Email: </td>
    <td colspan="2">#email#</td>
</tr>
<tr>
	<td width="20"></td>
    <td>Phone: </td>
    <td colspan="2">#phoneNum#</td>
</tr>
<tr>
	<td width="20"></td>
    <td>Degree: </td>
    <td colspan="2">#degree#</td>
</tr>
</CFOUTPUT>

<!-- Display student's program information -->
<CFOUTPUT query="ProgramList">
<tr>
	<td width="20"></td>
    <td valign="top">Program: </td>
    <td colspan="2">#description#</td>
</tr>
<tr>
	<td width="20"></td>
    <td></td>
    <td valign="top">Required: </td>
    <td>#requiredCreditHours# hours</td>
</tr>
<tr>
	<td width="20"></td>
    <td></td>
    <td valign="top">Department: </td>
    <td>#name#<br>
   		#location#<br>
    	#title#<br>
    	#phoneNum#</td>
</tr>
</CFOUTPUT>

<!-- Display student's advisor information -->
<CFOUTPUT query="Advisor"> 
<tr>
	<td width="20"></td>
    <td valign="top">Advisor: </td>
    <td colspan="2">#firstName# #lastName# (#advID#)</td>
</tr>
<tr>
	<td width="20"></td>
    <td></td>
    <td valign="top">Location: </td>
    <td>#location#</td>
</tr>
<tr>
	<td width="20"></td>
    <td></td>
    <td valign="top">Contact: </td>
    <td>#phoneNum#<br>
   		#email#</td>
</tr>
</CFOUTPUT>

</table>

<!-- Display all advisees assigned to the advisor -->
<table nowrap cellspacing="4" cellpadding="4" border="0">

<!-- If there is no advisee assigned, display a message -->
<CFIF ClassList.RecordCount IS 0>
<tr>
	<td width="20"></td>
	<td colspan="5">*** The student has not taken any classes ***</td>
</tr>
<CFELSE>
<tr>
	<td><strong>Class Listing: </strong></td>
	<td colspan="4"></td>
</tr>
<tr>
	<td width="20"></td>
    <td><font style="font-weight:bold">Course #</font></td>
    <td><font style="font-weight:bold">Title</font></td>
    <td><font style="font-weight:bold">Term</font></td>
    <td><font style="font-weight:bold">Credit Hours</font></td>
    <td><font style="font-weight:bold">Grade</font></td>
    <td><font style="font-weight:bold">Instructor</font></td>
<tr>
<CFOUTPUT query="ClassList">
<tr>
	<td width="20"></td>
    <td>#courseNumber#</td>
    <td>#title#</td>
    <td>#term#</td>
    <td align="center">#numberOfCredits#</td>
    <td>#grade#</td>
    <td><a href="instructor_rpt.cfm?empID=#instrID#">(#instrID#) #firstName# #lastName#</a></td>
</tr>
</CFOUTPUT>

</CFIF>

</TABLE>

<hr>
<a href="student_list.cfm"><img src="../images/left_arrow.png"> <small><em>Back to Student Directory</em></small></a>

</BODY>
</HTML>

