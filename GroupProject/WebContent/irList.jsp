<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

	<title>Incident-System Home</title>
	<link href="styles.css" rel="stylesheet" type="text/css" media="screen"></link>
	

        <script type="text/javascript" src="http://www.colorado.edu/ssi/jquery/jquery-latest.pack.js"></script>
        
<!--  this will be replaced with our jquery build -->
	<style type="text/css">
			.tr1 {
				background-color: #CCCCCC;
				font-family: serif;
				font-size: 12px;
			}
			.tr2 {
				background-color: #999999;
				font-family: serif;
				font-size: 12px;
			}
			.tr_header
			{
				background-color: #4F4E35;
				font-family: serif;
				font-size: 15px;
				font-weight: bold;
			}
	</style>
</head>
<body>
<div class="mainContainer">

	
	<div class="header">
		<p>Incident Reporting System</p>	
	</div>
	<div class="sideNav">
		
		<ul>
			<a href="home.jsp"><li class="topNav">Home</li></a>
			<a href="irLogin.jsp"><li>Login</li></a>
			<a href="irSubmission.jsp"><li>IR Submission</li></a>
			<a href="irSearch.jsp"><li>IR Search</li></a>
			<a href=""><li>Resources for Conduct Officers</li></a>
			<ul>
			      <a href="COCalendar.jsp"><li>Calendar</li></a>
			</ul>
			<a href=""><li>Resources for JAs</li></a>
			<ul>
			      <a href="JACalendar.jsp"><li class="bottomNav">Submitted IRs</li></a>
			</ul>
		</ul>
			
			
	</div>
	
	<div class="content">
	<h2>JA Calendar</h2>

			<table cellspacing="0" cellpadding="0" border="1" >       
				<tr class="tr_header"><td>Incident time/date</td><td>Incident parties</td><td>&nbsp;</td></tr>
				<%
				try {
				//Create string of connection url within specified format with machine
				//name, port number and database name. Here machine name id localhost and 
				//database name is conductCommittee. 
				String connectionURL = "jdbc:mysql://localhost:3306/incident";
				// declare a connection by using Connection interface
				Connection connection = null;
				// declare object of Statement interface that is used for executing sql statements. 
				Statement statement = null;
				// declare a resultset that uses as a table for output data from tha table.
				ResultSet rs = null;
				// Load JBBC driver "com.mysql.jdbc.Driver"
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				//Create a connection by using getConnection() method that takes parameters 
				//of string type connection url, user name and password to connect to database.
				connection = DriverManager.getConnection(connectionURL, "incident", "smile");
				//createStatement() is used for create statement object that is used for 
				//sending sql statements to the specified database. */
				statement = connection.createStatement();
				// sql query to retrieve values from the secified table.
				String QueryString = "SELECT A.incidentTimeDate, B.party from incidentReports A LEFT JOIN incidentParties B ON A.incID = B.incID WHERE B.scheduled = 'N'";
				rs = statement.executeQuery(QueryString);
				
				int i = 0;
				while(rs.next())
				{
				%>
								<tr class="tr<% out.print(i++ % 2 == 1? 1: 2); %>"><td><% out.print(rs.getString(1)); %></td><td><% out.print(rs.getString(2)); %><a href="#">(schedule)</a></td><td><a href="#">IR</a></td></tr>
				<%
				}
				// close all the connections.
				rs.close();
				statement.close();
				connection.close();
				} catch (SQLException ex) {
				out.println("Unable to connect to database: " + ex.getMessage());
				}
				%>
			</table>	
			
		<div class="footer">
			<p>cool footer content</p>
		</div>
	</div>
	

</div>
			
		
</body>
</html>

