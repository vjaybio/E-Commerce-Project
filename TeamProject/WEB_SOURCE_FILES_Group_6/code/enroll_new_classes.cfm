<HTML>
<HEAD>
<TITLE>Enrollment</TITLE>
<!-- Loop throug each selected class -->
<CFLOOP index = "oneClassID" list = "#form.classIDList#">  
	<!-- Insert each class for the student into the StudentGrade table -->
	<CFQUERY NAME="addClass" DATASOURCE="UnivDB" DBTYPE="ODBC">
        	INSERT INTO StudentGrade (ClassID, StuID)
            VALUES (#oneClassID#, #form.studentID#)
    </CFQUERY>
</CFLOOP>

<!-- Get the student name -->
<CFQUERY NAME="GetStudent" DATASOURCE="UnivDB" DBTYPE="ODBC">
    SELECT FirstName, LastName
    FROM   Student
    WHERE  stuID = #form.studentID#
</CFQUERY>

<!-- Get the new classes back -->
<CFQUERY NAME="getClass" DATASOURCE="UnivDB" DBTYPE="ODBC">
    SELECT L.ClassID, C.CourseNumber, Title
    FROM   (Class L INNER JOIN Course C
            ON L.CourseNumber = C.CourseNumber)
            INNER JOIN StudentGrade G
                ON L.classID = G.classID
    WHERE G.stuID = #form.studentID#
          AND L.classID IN (#form.classIDList#)
</CFQUERY>

    
<style type="text/css">
.italic {
	font-style: italic;
}
</style>
<style>p.indent{ padding-left: 1.8em }</style>
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

<p>The following new class(es) has (have) been enrolled for 
<span class="italic"><CFOUTPUT>#GetStudent.FirstName# #GetStudent.LastName#</span></CFOUTPUT>:
<CFOUTPUT query="getClass">
	<p class="indent">- #CourseNumber# #Title#</p>
</CFOUTPUT>

<p>You may <a href="enrollment.cfm">go back to the enrollment page and continue the enrollment.</a></p>

<hr>
<a href="../main.cfm"><img src="../images/left_arrow.png"> <small><em>Back to Main</em></small></a>

</BODY>
</HTML>
