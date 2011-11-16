<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%

if(request.getParameter("partyID") == null)
{
	getServletContext().getRequestDispatcher("/meetingSchedule.jsp").forward(request, response);
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--  which doctype declaration do we want? XHTML strict will make the tags behave nicely with other languages, but the tags are harder to write.
recommend HTML transitional as it is the easiest to write tags for -->
<head>

	<title>Incident-System Home</title>
	<link href="styles.css" rel="stylesheet" type="text/css" media="screen" />
	

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
			<a href="new_ir.jsp"><li>IR Submission</li></a>
			<a href="home.jsp"><li>Resources for Conduct Officers</li></a>
			<ul>
			      <a href="meetingSchedule.jsp"><li>Calendar</li></a>
			</ul>
			<a href="home.jsp"><li>Resources for JAs</li></a>
			<ul>
			      <a href="irList.jsp"><li class="bottomNav">Submitted IRs</li></a>
			</ul>
		</ul>
			
			
	</div>
	
	<div class="content">
	<h2>Conduct Officer Meeting Notes</h2>
			     

	<p></p>
    <p></p>
	
		<form action="/GroupProject/NewMDServlet" method="post">	
		What Charges was the student found responsible for? 

		<br>
				<table cellspacing="0" cellpadding="0" border="1">
				<tr class="tr_header">
					<td>Charge</td>
					<td>Responsible</td>
				</tr>
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
				String QueryString = "SELECT offenseID, offenseName FROM offenses ORDER BY offenseID ASC";
				rs = statement.executeQuery(QueryString);
				
				int i = 0;
				while(rs.next())
				{
				%>
								<tr class="tr<% out.print(i++ % 2 == 1? 1: 2); %>">
								<td><% out.print(rs.getString(2)); %></td>
								<td><input type="checkbox" name="responsible" value="<% out.print(rs.getString(1)); %>" /></td>								
								</tr>
				<% }
				// close all the connections.
				rs.close();
				statement.close();
				connection.close();
				} catch (SQLException ex) {
				out.println("Unable to connect to database: " + ex.getMessage());
				}
				%>
				</table>
		<br>
		Which Sanctions will be imposed?
		<br>
		<textarea rows="5" cols="50">
		</textarea>

		<br>
		Notes
		<br>
		<textarea name="notes" rows="5" cols="50">
		</textarea>
		<br>
		<input type="hidden" name="partyID" value="<% out.print(Integer.parseInt(request.getParameter("partyID"))); %>" />
		<input type="submit" value="Submit" />
		</form>
		<p></p>
		<a href="COCalendar.jsp">Go Back to View Meetings</a>
	
		
	</div>
	

</div>

                
       
			
		
</body>


