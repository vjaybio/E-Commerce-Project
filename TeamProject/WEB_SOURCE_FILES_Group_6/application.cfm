<!--- application.cfm CF Application Framework --->
<!--- Start the Application and Session framework --->
<cfapplication name="PetAtl" Sessionmanagement="YES">

<!--- Set session variables --->
<CFSET session.apptitle   = "Project On Database Management Systems">
<CFSET session.appversion = "(R)">
<CFSET session.hostip     = "#cgi.http_host#">
<CFSET session.webhome    = "http://#cgi.http_host#">
<CFSET session.auname     = "Hi,Guest">
<CFSET session.puname     = "CIS">

<body topmargin=0>
<div align="left" title="main">
<!--- topheader.cfm   Header for all Applications --->
<table border=0 width="98%" bgcolor="#FCF3CF" valign="TOP" >
<tr>
	<td><small>
	<CFOUTPUT>#session.apptitle# #session.appversion#</CFOUTPUT>
	</td></small>
	<td><small>
	<!--- <CFOUTPUT>#session.auname#</CFOUTPUT> --->
	</td></small>
	<td><small>
	<CFOUTPUT>#session.puname#</CFOUTPUT>
	</td></small>
	<td align="RIGHT"><small><b>
	<CFOUTPUT>#TimeFormat(Now(),('hh:mm tt'))#</CFOUTPUT>
	</td></small>
</tr>
</table>

</div>
</body>


