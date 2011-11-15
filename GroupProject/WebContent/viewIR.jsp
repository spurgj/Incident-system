<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>Incident-System Home</title>
</head>
<body>
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
				String QueryString = "SELECT incidentSummary FROM incidentReports WHERE incID = ?";
				statement = connection.prepareStatement(QueryString);
				statement.setString(1, request.getParameter("incID"));
				// sql query to retrieve values from the secified table.

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
				// close all the connections.
				rs.close();
				statement.close();
				connection.close();
				} catch (Exception ex) {
				out.println(ex.getMessage());
				}
%>
</body>
</html>

