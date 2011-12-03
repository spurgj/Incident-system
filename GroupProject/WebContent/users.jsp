<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%
	if(request.getSession(true).getAttribute("userRole") == null || !request.getSession(true).getAttribute("userRole").equals("CO"))
	{
		getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
		return;
	}
%> 
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
		
			<% if(request.getSession(true).getAttribute("userId") != null) { %>
			<a href="home.jsp"><li class="topNav">Home</li></a>
			<a href="new_ir.jsp"><li>IR Submission</li></a>
			<a href="update_user.jsp"><li>Change Password</li></a>
			<% if(request.getSession(true).getAttribute("userRole") != null && request.getSession(true).getAttribute("userRole").equals("CO")) {  %>
			<a href="home.jsp"><li>Resources for Conduct Officers</li></a>
			<ul>
			      <a href="meetingSchedule.jsp"><li>Calendar</li></a>
			      <a href="users.jsp"><li>Manage Users</li></a>
			</ul>
			<% } %>
			<% if(request.getSession(true).getAttribute("userRole") != null && request.getSession(true).getAttribute("userRole").equals("JA")) {  %>
			<a href="home.jsp"><li>Resources for JAs</li></a>
			<ul>
			      <a href="irList.jsp"><li class="bottomNav">Submitted IRs</li></a>
			</ul>
			<% }  %>
			      <a href="logout.jsp"><li class="bottomNav">Logout</li></a>
			<% } else { %>
		<ul>
			<a href="login.jsp"><li class="topNav">Login</li></a>
		</ul>
			<% } %>
		</ul>
			
			
	</div>
	
	<div class="content">
	<h2>Manage Users</h2>

			<form action="/GroupProject/UpdateUsersServlet" method="post">
			<table cellspacing="0" cellpadding="0" border="1" >       
				<tr class="tr_header"><td>User ID</td><td>User Login</td><td>User Role</td><td>Delete</td></tr>
				<%
				try {
					//the string "connectionURL" is the URL for the database.
					// the machine name, database name, and port number are specified.
					// port: 3306, database name: incident, machine name: localhost
					String connectionURL = "jdbc:mysql://localhost:3306/incident";
					
					// declares a connection to the database using JDBC class "Connection"
					Connection connection = null;
					
					// declares a statement for executing sql using JDBC class "PreparedStatement"
					PreparedStatement statement = null;
					
					// declares a table for representing data in the database using JDBC class "ResultSet"
					ResultSet rs = null;
					
					// this line calls and loads the JDBC driver at "com.mysql.jdbc.Driver"
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					
					
					// sets the 'connection' variable using JDBC class DriverManager's method "getConnection".
					// "getConnection" takes a string that provides a URI to the database, a username, and a password.
					// 'connectionURL' acts as the URI to the database, the username is 'incident', and the password is 'smile'
					connection = DriverManager.getConnection(connectionURL, "incident", "smile");

					String QueryString = "SELECT userId, userLogin, userRole FROM users";
					statement = connection.prepareStatement(QueryString);
					
					// executes the SQL declarations stored in 'statement'
					rs = statement.executeQuery();
				
				int i = 0;
				while(rs.next())
				{
					%>
					<tr class="tr<% out.print(i++ % 2 == 1? 1: 2); %>">
						<td><% out.print(rs.getString(1)); %></td>
						<td><% out.print(rs.getString(2)); %></td>
						<td>
							<select name="<% out.print(rs.getString(1)); %>">
								<option selected="selected" value="<% out.print(rs.getString(3)); %>"><% out.print(rs.getString(3)); %></option>
								<option value="RA">RA</option>
								<option value="JA">JA</option>
								<option value="CO">CO</option>								
						</td>
						<td><input type="checkbox" name="delete" value="<% out.print(rs.getString(1)); %>" /></td>
					</tr>
					<% 
					i++;
				}
				// executes the close() method to close 'rs', 'statement', and 'connection'
				rs.close();
				statement.close();
				connection.close();
				} catch (SQLException ex) {
				out.println("Unable to connect to database: " + ex.getMessage());
				}
				%>
			</table>
				<input type="submit" value="Update" />	
			</form>
			<br /><br />
			<form action="/GroupProject/NewUserServlet" method="post">
				<table cellspacing="0" cellpadding="0" border="1">
					<tr class="tr_header">
						<td>New User Name</td>
						<td>New User Pass</td>
						<td>New User Role</td>
					</tr>
					<tr class="tr1">
						<td><input type="text" name="username" size="15" /></td>
						<td><input type="password" name="password" size="25" /></td>
						<td><select name="role"><option value="RA">RA</option><option value="JA">JA</option><option value="CO">CO</option></select></td>
					</tr>
				</table>
				<input type="submit" value="Create New User" />
			</form>
		<div class="footer">
			<p>cool footer content</p>
		</div>
	</div>
	

</div>
			
		
</body>
</html>

