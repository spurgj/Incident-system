<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%
	if(request.getSession(true).getAttribute("userId") == null)
	{
		getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		return;
	}
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>Incident-System Home</title>
</head>
<body>
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
				
				
				String QueryString = "SELECT incidentSummary FROM incidentReports WHERE incID = ?";
				statement = connection.prepareStatement(QueryString);
				statement.setString(1, request.getParameter("incID"));
				
				// executes the SQL declarations stored in 'statement'
				rs = statement.executeQuery();
				
				int i = 0;
				while(rs.next())
				{
				%>
				<p style="width: 50%;">
					<% out.print(rs.getString(1)); %>
				</p>
				<%
				}
				// executes the close() method to close 'rs', 'statement', and 'connection'
				rs.close();
				statement.close();
				connection.close();
				} catch (Exception ex) {
				out.println(ex.getMessage());
				}
%>
</body>
</html>

