<HTML>
<HEAD>
<TITLE>Course List</TITLE>

<style type="text/css">
.italic {
	font-style: italic;
}
</style>
</HEAD>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#0000FF" VLINK="#006699" ALINK="#000000">
<style>p.indent{ padding-left: 1.8em }</style>

<table nowrap cellspacing="4" cellpadding="4" border="0">
<tr>
	<td><img src="../images/books.png"></td>
	<td><H1>
      <FONT FACE="times new roman, times" COLOR="#006666">
      <STRONG>Student Enrollment</STRONG> 
      </FONT>
      </H1>
    </td>
</tr>
</table>
<HR>

<CFIF form.StudentID EQ 0>
	<p><img src="../images/Error.png" width="62" height="21" alt="Error!"> 
    No student is selected. 
	Please <a href="enrollment.cfm">go back to the enrollment page and correct the error</a></p>
  
<CFELSEIF not isDefined("form.ClassID")>
	<!-- Get the student name -->
	<p><img src="../images/Error.png" width="62" height="21" alt="Error!"> 
    No class is selected. 
	Please <a href="enrollment.cfm">go back to the enrollment page and correct the error</a></p>

<CFELSE>

	<CFQUERY NAME="GetStudent" DATASOURCE="UnivDB" DBTYPE="ODBC">
		SELECT FirstName, LastName
    	FROM   Student
 		WHERE  stuID = #form.studentID#
	</CFQUERY>
    
	<!-- Use the classIDs to find out those already enrolled -->
	<CFQUERY NAME="CheckClass" DATASOURCE="UnivDB" DBTYPE="ODBC">
		SELECT L.ClassID, C.CourseNumber, Title
    	FROM   (Class L INNER JOIN Course C
            	ON L.CourseNumber = C.CourseNumber)
		    	INNER JOIN StudentGrade G
                	ON L.classID = G.classID
		WHERE G.stuID = #form.studentID#
        	  AND L.classID IN (#form.ClassID#)
	</CFQUERY>
    
    <!-- If the query return one or more class, report the error -->
    <CFSET enrolledClasses = ""> 
    <CFIF CheckClass.RecordCount GT 0>
    	<p>The student <span class="italic"><CFOUTPUT>#GetStudent.FirstName# #GetStudent.LastName#</CFOUTPUT></span>
    	has already taken the following selected class(es):</p>
    	<CFOUTPUT query="CheckClass">
    		<p class="indent">- #CourseNumber# #Title#</p>
        
        	<!-- remember the class -->
        	<CFSET enrolledClasses = enrolledClasses & "," & ClassID>
    	</CFOUTPUT>
     </CFIF>
       
	<!-- If there is no new course to enroll, report the error -->
	<CFIF CheckClass.RecordCount IS ListLen(form.ClassID, ",")>
        There is no new any new class to enroll. You may 
		<a href="enrollment.cfm">go back to the enrollment page and select different courses.</a></p>
	<CFELSE>
        <!-- Get those new courses -->
        <CFSET newClassIDs="">
        <CFSET delimiter=""> <!-- to avoid leading comma -->
        <CFLOOP index="selectedID" list="#form.ClassID#">
        	<CFIF ListContains(enrolledClasses, selectedID) IS 0>
            	<CFSET newClassIDs = newClassIDs & delimiter & selectedID>
                <CFSET delimiter=",">
            </CFIF>
        </CFLOOP>
        
        <!-- There shold be at least one -->
        <CFIF ListLen(newClassIDs) GT 0>
			<CFQUERY NAME="getNewClasses" DATASOURCE="UnivDB" DBTYPE="ODBC">
				SELECT L.ClassID, C.CourseNumber, Title
    			FROM   (Class L INNER JOIN Course C
            				ON L.CourseNumber = C.CourseNumber)
				WHERE L.classID IN (#newClassIDs#)
        	</CFQUERY>
            
            <!-- Display the new classes -->
      		<p>The following is(are) new class(es):</p>
            <FORM name="newClasses" action="enroll_new_classes.cfm" method="post">
            	<CFOUTPUT query="getNewClasses">
					<p class="indent">- #CourseNumber# #Title#</p>
				</CFOUTPUT>
                <CFOUTPUT>
                <input type="hidden" name="studentID" value="#form.studentID#">
               <input type="hidden" name="classIDList" value="#newClassIDs#">
				</CFOUTPUT>
                
                <p>Do you want to add those new classes?</p>
                <p class="indent"><input type="submit" value="Submit"></p>
            </FORM>
            
        <CFELSE>
        	<p><img src="../images/Error.png" width="62" height="21" alt="Error!">Something is wrong!!!</p>
		</CFIF>
	</CFIF>
</CFIF>

<hr>
<a href="../main.cfm"><img src="../images/left_arrow.png"> <small><em>Back to Main</em></small></a>

</BODY>
</HTML>

