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
					//Create string of connection url within specified format with machine
					//name, port number and database name. Here machine name id localhost and 
					//database name is conductCommittee. 
					String connectionURL = "jdbc:mysql://localhost:3306/incident";
					// declare a connection by using Connection interface
					Connection connection = null;
					// declare object of Statement interface that is used for executing sql statements. 
					PreparedStatement statement = null;
					// declare a resultset that uses as a table for output data from tha table.
					ResultSet rs = null;
					// Load JBBC driver "com.mysql.jdbc.Driver"
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					//Create a connection by using getConnection() method that takes parameters 
					//of string type connection url, user name and password to connect to database.
					connection = DriverManager.getConnection(connectionURL, "incident", "smile");
					//createStatement() is used for create statement object that is used for 
					//sending sql statements to the specified database. */
					String QueryString = "SELECT partySanctions.partySanctionID, party, sanctionName, dueDate, notes FROM partySanctions LEFT JOIN sanctions on partySanctions.sanctionID = sanctions.sanctionID LEFT JOIN incidentParties ON partySanctions.partyID = incidentParties.partyID WHERE partySanctions.completed = 'N' AND sanctions.sanctionType = 'E' AND party LIKE ?";
					String search = request.getParameter("search");
					search = search.replace("*", "%");
					
					statement = connection.prepareStatement(QueryString);

					// sql query to retrieve values from the secified table.
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
				// close all the connections.
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

