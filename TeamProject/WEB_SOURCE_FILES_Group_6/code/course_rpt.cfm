<HTML>
<HEAD>
<TITLE>Class Report</TITLE>

<!-- Get course information -->
<CFQUERY NAME="Course" DATASOURCE="UnivDB" DBTYPE="ODBC">
    SELECT courseNumber, title, numberOfCredits
    FROM   Course
    WHERE  courseNumber = '#URL.courseNum#'
</CFQUERY>

<!-- Get all students taken the class and the instructor -->
<CFQUERY NAME="StudentList" DATASOURCE="UnivDB" DBTYPE="ODBC">
        SELECT S.stuID, S.firstName AS StuFName, S.lastName AS StuLName, grade, degree,
           I.instrID, I.firstName AS InstFName, I.lastName AS InstLName
    FROM   ((((Student S INNER JOIN StudentGrade G
    		ON S.stuID = G.stuID) INNER JOIN Class C
            	ON G.classID = C.classID) INNER JOIN Instructor I
                ON C.instrID = I.instrID) INNER JOIN StudentProgram M
                ON S.stuID = M.stuID) INNER JOIN Program P
                ON M.progmID = P.progmID
    WHERE  C.courseNumber = '#URL.courseNum#'
    ORDER BY S.firstName, S.lastName
</CFQUERY>

</HEAD>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#0000FF" VLINK="#006699" ALINK="#000000">

<table nowrap cellspacing="4" cellpadding="4" border="0">
<tr>
	<td><img src="../images/books.png"></td>
	<td><H1>
      <FONT FACE="times new roman, times" COLOR="#006666">
      <STRONG>Class Report</STRONG> 
      </FONT>
      </H1>
    </td>
</tr>
</table>

<HR>
<P>

<!-- Display Advisor Information -->
<table nowrap cellspacing="1" cellpadding="2" border="0">
<CFOUTPUT query="Course">
<tr>
	<td><strong>Course: </strong></td>
	<td>#courseNumber# #title#</td>
</tr>
<tr>
    <td width="20"></td>
    <td>Credit Hours: #numberOfCredits#</td>
</tr>
<tr>
    <td colspan="2"></td>
</tr>
</CFOUTPUT>
</table>

<!-- Check if the query returns empty -->
<CFIF StudentList.RecordCount IS 0>

<p>*** The class has either not been offered or no students ***</p>

<CFELSE>

<p><strong>Students taken the class:</strong></p>

<!-- Display all advisees assigned to the advisor -->
<table nowrap cellpadding="4" border="0">
<tr>
	<td width="20"></td>
    <td><strong>ID</strong></td>
    <td><strong>Name</strong></td>
    <td><strong>Grade</strong></td>
    <td><strong>Degree</strong></td>
    <td><strong>Instructor</strong></td>
<tr>
<CFOUTPUT query="StudentList">
<tr>
	<td width="20"></td>
    <td>#stuID#</td>
    <td><a href="student_rpt.cfm?id=#stuID#">#stuFName# #stuLName#</a></td>
    <td>#grade#</td>
    <td>#degree#</td>
    <td><a href="instructor_rpt.cfm?empID=#instrID#">#InstFName# #InstLName#</td>
</tr>
</CFOUTPUT>
</TABLE>

</CFIF>

<hr>
<a href="course_list.cfm"><img src="../images/left_arrow.png"> <small><em>Back to Class List</em></small></a>

</BODY>
</HTML>

