<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%
	if(request.getSession(true).getAttribute("userRole") == null || !request.getSession(true).getAttribute("userRole").equals("JA"))
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
			      <a href="holdsReport.jsp"><li>Holds Report</li></a>
			      <a href="users.jsp"><li>Manage Users</li></a>
			</ul>
			<% } %>
			<% if(request.getSession(true).getAttribute("userRole") != null && request.getSession(true).getAttribute("userRole").equals("JA")) {  %>
			<a href="home.jsp"><li>Resources for JAs</li></a>
			<ul>
			      <a href="irList.jsp"><li class="bottomNav">Submitted IRs</li></a>
			      <a href="sanctionEntry.jsp"><li class="bottomNav">Sanction Entry</li></a>
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

	<%
	
	if(request.getParameter("search") != null)
	{
	%>
	<h2>Parties matching search</h2>
			<form action="/GroupProject/SanctionServlet" method="post">
			<table cellspacing="0" cellpadding="0" border="1" >       
				<tr class="tr_header"><td>Party</td><td>Sanction</td><td>Sanction Due Date</td><td>Mark</td><td>Notes</td></tr>
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
					

					String QueryString = "SELECT partySanctions.partySanctionID, party, sanctionName, dueDate, notes FROM partySanctions LEFT JOIN sanctions on partySanctions.sanctionID = sanctions.sanctionID LEFT JOIN incidentParties ON partySanctions.partyID = incidentParties.partyID WHERE partySanctions.completed = 'N' AND sanctions.sanctionType = 'E' AND party LIKE ?";
					String search = request.getParameter("search");
					search = search.replace("*", "%");
					
					statement = connection.prepareStatement(QueryString);

					// executes the SQL declarations stored in 'statement'
					statement.setString(1, search);
					rs = statement.executeQuery();
				
					
				if(rs.isBeforeFirst())
				{
					int i = 0;
					while(rs.next())
					{
					%>
									<tr class="tr<% out.print(i++ % 2 == 1? 1: 2); %>">
										<td><% out.print(rs.getString(2)); %><input type="hidden" name="sanctions" value="<% out.print(rs.getString(1)); %>" /></td>
										<td><% out.print(rs.getString(3)); %></td>
										<td><% out.print(rs.getString(4)); %></td>
										<td>
											<select name="completion">
												<option value="completed">Complete</option>
												<option value="insufficient">Insufficient</option>
												<option selected="selected" value="notcomplete">Not complete</option>
											</select>
										</td>
										<td>
											<textarea name="sanction_notes" cols="25" rows="5"><% if(rs.getString(5) != null) out.print(rs.getString(5)); %></textarea>
										</td>
									</tr>
					<%
					i++;

					}
					%><tr class="tr_header"><td colspan="5"><input type="submit" value="Submit" /></td></tr><%
				} else {
					out.print("<tr class=\"tr_header\"><td colspan=\"6\">No students found.</td></tr>");
				}
					
				out.print("<tr class=\"tr_header\"><td colspan=\"6\"><a href=\"sanctionEntry.jsp\">Back to search</a></td></tr>");
				// executes the close() method to close 'rs', 'statement', and 'connection'
				rs.close();
				statement.close();
				connection.close();
				} catch (SQLException ex) {
				out.println("Unable to connect to database: " + ex.getMessage());
				}
				%>
			</table>
			
			</form>
	<%
	
	} else {
	
	%>
		<h2>Search</h2>

		<form action="sanctionEntry.jsp" method="get">
		<table border="1" cellspacing="0" cellpadding="0">
		<tr class="tr_header">
			<td>Party search</td>
		</tr>
		<tr class="tr1">
			<td><input type="text" name="search" value="" /></td>
		</tr>
		<tr class="tr2">
			<td>Use * for wildcard search</td>
		</tr>
		<tr class="tr1">
			<td><input type="submit" value="Search" /></td>
		</tr>		
		</table>
		</form>
	<% 
	
	}
	
	%>
		<div class="footer">
			<p>cool footer content</p>
		</div>
	</div>
	

</div>
			
		
</body>
</html>

