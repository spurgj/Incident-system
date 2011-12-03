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
	<h2>Schedule Conduct Meeting</h2>

			<form action="/GroupProject/NewMSServlet" method="post">
			<table cellspacing="0" cellpadding="0" border="1" >       
				<tr class="tr_header"><td>Party</td><td>&nbsp;</td><td>Date/time</td></tr>
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
					
					String QueryString = "SELECT incID, party, partyID FROM incidentParties WHERE partyID = ? AND scheduled = 'N'";
					statement = connection.prepareStatement(QueryString);
					statement.setString(1, request.getParameter("partyID"));
					
					// executes the SQL declarations stored in 'statement'
					rs = statement.executeQuery();
				
				int i = 0;
				if(rs.next())
				{
				%>
								<tr class="tr1"><td><% out.print(rs.getString(2)); %></td><td><a href="viewIR.jsp?incID=<% out.print(rs.getString(1)); %>">IR</a></td>
								<td>
		<select name="month">
		  <option value="1">Month</option>
		  <option value="1">January</option>
		  <option value="2">February</option>
		  <option value="3">March</option>
		  <option value="4">April</option>
		  <option value="5">May</option>
		  <option value="6">June</option>
		  <option value="7">July</option>
		  <option value="8">August</option>
		  <option value="9">September</option>
		  <option value="10">October</option>
		  <option value="11">November</option>
		  <option value="12">December</option>
		</select>
		<select name="day">
		  <option value="01">Day</option>
		  <option value="01">1</option>
		  <option value="02">2</option>
		  <option value="03">3</option>
		  <option value="04">4</option>
		  <option value="05">5</option>
		  <option value="06">6</option>
		  <option value="07">7</option>
		  <option value="08">8</option>
		  <option value="09">9</option>
		  <option value="10">10</option>
		  <option value="11">11</option>
		  <option value="12">12</option>
		  <option value="13">13</option>
		  <option value="14">14</option>
		  <option value="15">15</option>
		  <option value="16">16</option>
		  <option value="17">17</option>
		  <option value="18">18</option>
		  <option value="19">19</option>
		  <option value="20">20</option>
		  <option value="21">21</option>
		  <option value="22">22</option>
		  <option value="23">23</option>
		  <option value="24">24</option>
		  <option value="25">25</option>
		  <option value="26">26</option>
		  <option value="27">27</option>
		  <option value="28">28</option>
		  <option value="29">29</option>
		  <option value="30">30</option>
		  <option value="31">31</option>
		</select>	
		<select name="hour">
		  <option value="0">Hour</option>
		  <option value="00">00</option>
		  <option value="01">01</option>
		  <option value="02">02</option>
		  <option value="03">03</option>
		  <option value="04">04</option>
		  <option value="05">05</option>
		  <option value="06">06</option>
		  <option value="07">07</option>
		  <option value="08">08</option>
		  <option value="09">09</option>
		  <option value="10">10</option>
		  <option value="11">11</option>
		  <option value="12">12</option>
		  <option value="13">13</option>
		  <option value="14">14</option>
		  <option value="15">15</option>
		  <option value="16">16</option>
		  <option value="17">17</option>
		  <option value="18">18</option>
		  <option value="19">19</option>
		  <option value="20">20</option>
		  <option value="21">21</option>
		  <option value="22">22</option>
		  <option value="23">23</option>
		</select>
	 	<select name="minute">
		  <option value="0">Minute</option>
		  <option value="0">0</option>
		  <option value="30">30</option>
		</select>
		<input type="hidden" name="partyID" value="<% out.print(rs.getString(3)); %>" />
								</td>
								</tr>
				<%
				}
				else {
					out.print("No unscheduled parties found with that ID");
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
				<input type="submit" value="Schedule" />	
			</form>
		<div class="footer">
			<p>cool footer content</p>
		</div>
	</div>
	

</div>
			
		
</body>
</html>

