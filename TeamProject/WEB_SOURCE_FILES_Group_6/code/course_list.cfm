<HTML>
<HEAD>
<TITLE>Course List</TITLE>

<!--webbot bot="HTMLMarkup" StartSpan -->
<CFQUERY NAME="CourseList" DATASOURCE="UnivDB" DBTYPE="ODBC">
    SELECT courseNumber, title, numberOfCredits
    FROM   Course
    ORDER BY courseNumber
</CFQUERY>
<!--webbot BOT="HTMLMarkup" endspan --> 

</HEAD>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#0000FF" VLINK="#006699" ALINK="#000000">

<table nowrap cellspacing="4" cellpadding="4" border="0">
<tr>
	<td><img src="../images/books.png"></td>
	<td><H1>
      <FONT FACE="times new roman, times" COLOR="#006666">
      <STRONG>Class Listing</STRONG> 
      </FONT>
      </H1>
    </td>
</tr>
</table>

<HR>
<P>
<table nowrap cellspacing="4" cellpadding="4" border="0">
<tr>
	<td colspan="4">Click a course link below to view all students taken the class:</td>
<tr>
	<td width="20"></td>
    <td><strong>Course</strong></td>
    <td><strong>Title</strong></td>
    <td><strong>Credit Hours</strong></td>
<tr>
<CFOUTPUT query="CourseList">
<tr>
	<td width="20"></td>
    <td><a href="course_rpt.cfm?courseNum=#courseNumber#"> #courseNumber#</a></td>
    <td>#title#</td>
    <td>#numberOfCredits#</td>
</tr>
</CFOUTPUT>
</TABLE>

<hr>
<a href="../main.cfm"><img src="../images/left_arrow.png"> <small><em>Back to Main</em></small></a>

</BODY>
</HTML>

