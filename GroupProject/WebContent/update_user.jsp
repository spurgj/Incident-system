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
%> io.*" %> 
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
	<h2>Update Password</h2>
	<table cellspacing="0" cellpadding="0" border="0">

	<tr><td><% out.print(request.getSession(true).getAttribute("userId").toString()); %></td><td><% out.print(request.getSession(true).getAttribute("userLogin")); %></td><td><% out.print(request.getSession(true).getAttribute("userRole")); %></td></tr>

	</table>
	<%
	
	if(request.getParameter("success") != null)
	{
		out.println("<h3>Password updated</h3>");
	}
	if(request.getParameter("mismatch") != null)
	{
		out.println("<h3>Password mismatch</h3>");
	}
	if(request.getParameter("notfound") != null)
	{
		out.println("<h3>Not found</h3>");
	}
	%>
			<form action="/GroupProject/UpdatePasswordServlet" method="post">
				<table cellspacing="0" cellpadding="0" border="1">
					<tr class="tr1">
						<td>Current password: </td><td><input type="password" name="password" size="15" /></td>
					</tr>
					<tr class="tr2">
						<td>New password: </td><td><input type="password" name="newpassword1" size="15" /></td>
					</tr>
					<tr class="tr1">
						<td>New password: </td><td><input type="password" name="newpassword2" size="15" /></td>
					</tr>
				</table>
				<input type="submit" value="Update" />
			</form>
		<div class="footer">
			<p>cool footer content</p>
		</div>
	</div>
</div>
			
		
</body>
</html>

