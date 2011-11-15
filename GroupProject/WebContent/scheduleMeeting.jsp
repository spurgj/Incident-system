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
	<h2>Schedule Conduct Meeting</h2>

			<form action="" method="post">
			<table cellspacing="0" cellpadding="0" border="1" >       
				<tr class="tr_header"><td>Party</td><td>&nbsp;</td><td>Date/time</td></tr>
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
					String QueryString = "SELECT incID, party FROM incidentParties WHERE partyID = ? AND scheduled = 'N'";
					statement = connection.prepareStatement(QueryString);
					statement.setString(1, request.getParameter("partyID"));
					// sql query to retrieve values from the secified table.

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
								</td>
								</tr>
				<%
				}
				else {
					out.print("No unscheduled parties found with that ID");
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
				<input type="submit" value="Schedule" />	
			</form>
		<div class="footer">
			<p>cool footer content</p>
		</div>
	</div>
	

</div>
			
		
</body>
</html>

