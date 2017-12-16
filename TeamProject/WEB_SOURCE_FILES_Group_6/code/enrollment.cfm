<HTML>
<HEAD>
<TITLE>Enrollment</TITLE>

<!-- Get course information -->
<CFQUERY NAME="Student" DATASOURCE="UnivDB" DBTYPE="ODBC">
    SELECT StuID, FirstName, MidName, LastName
    FROM   Student
    ORDER BY FirstName, LastName
</CFQUERY>

<!-- Get all students taken the class and the instructor -->
<CFQUERY NAME="Class" DATASOURCE="UnivDB" DBTYPE="ODBC">
	SELECT ClassID, Term, Day, ClassTime, C.CourseNumber, Title, NumberOfCredits,
		   I.InstrID, I.FirstName, I.LastName
    FROM   (Class L INNER JOIN Course C
            	ON L.CourseNumber = C.CourseNumber)
		    INNER JOIN Instructor I
                ON L.instrID = I.instrID
    ORDER BY C.CourseNumber
</CFQUERY>

</HEAD>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#0000FF" VLINK="#006699" ALINK="#000000">

<table nowrap cellspacing="4" cellpadding="4" border="0">
<tr>
	<td><img src="../images/books.png"></td>
	<td><H1>
      <FONT FACE="times new roman, times" COLOR="#006666">
      <STRONG>Class Enrollment</STRONG> 
      </FONT>
      </H1>
    </td>
</tr>
</table>

<HR>

<FORM action="enroll_student.cfm" method="post">

<!-- Display Advisor Information -->
<table nowrap cellspacing="1" cellpadding="2" border="0">
<tr>
	<td colspan="5">Select a student:</td>
</tr>
<tr>
	<td>&emsp;</td>
    <td colspan="4"> 
    <SELECT name="StudentID" size=1>
        <option value="0"> </option>
    	<CFOUTPUT query="Student">
            <option value="#StuID#">#FirstName# #MidName#, #LastName#</option>
        </CFOUTPUT>
    </SELECT>
    </td>
</tr>
<tr>
   	<td colspan=4><HR></td>
</tr>
<tr>
	<td colspan="5"><p>Select one or more classes to enroll the student:</p></td>
</tr>
<tr>
	<td>&emsp;</td>
   	<td><strong>Course</strong></td>
    <td><strong>Date-Time</strong></td>
    <td><strong>Term</strong></td>
    <td><strong>Instructor</strong></td>
</tr>
<CFOUTPUT query="Class">
<tr>
   	<td align="right"><input type="checkbox" name="ClassID" value="#ClassID#"></td>
    <td> #CourseNumber# #Title# </td>
    <td> #Day#  #ClassTime# </td>
    <td> (#Term#) </td>
    <td> #FirstName# #LastName# </td>
</tr>
</CFOUTPUT>
<tr>
	<td>&emsp;</td>
    <td> &emsp; <input type="submit"> &emsp; <input type="reset"></td>
    <td colspan="3"></td>
</tr>
</table>
</FORM>

<hr>
<a href="../main.cfm"><img src="../images/left_arrow.png"> <small><em>Back to Main</em></small></a>

</BODY>
</HTML>

