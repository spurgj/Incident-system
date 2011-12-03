package csci3308_incidents;

import javax.servlet.Servlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.io.*; 


//Allows the user to schedule a new meeting.

public class NewMSServlet extends HttpServlet implements Servlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			if(request.getSession(true).getAttribute("userRole") == null || !request.getSession(true).getAttribute("userRole").equals("JA"))
			{
				getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
				return;
			}
		//Gets the date/time, length, content, and associated incident ID for a new meeting.	
			
		
		//Sets a default time in if none is specified.

		String connectionURL = "jdbc:mysql://localhost:3306/incident";
		// declare a connection by using Connection interface
		Connection connection = null;
		// declare object of Statement interface that is used for executing sql statements. 
		Statement statement = null;
		// declare a resultset that uses as a table for output data from tha table.
		ResultSet rs = null;
		// Load JDBC driver "com.mysql.jdbc.Driver"
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		//Create a connection by using getConnection() method that takes parameters 
		//of string type connection url, user name and password to connect to database.
		connection = DriverManager.getConnection(connectionURL, "incident", "smile");
		//createStatement() is used for create statement object that is used for 
		//sending sql statements to the specified database. */
		statement = connection.createStatement();
		
		
		//Creates a new meeting in the database.
		
		String sql = "INSERT INTO coMeetings (meetingTimeDate, partyID) VALUES (?, ?)";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setString(1, "2011-" + request.getParameter("month") + "-" + request.getParameter("day") + " " + request.getParameter("hour") + "-" + request.getParameter("minute"));
		stmt.setString(2, request.getParameter("partyID"));
		stmt.executeUpdate();
		
		sql = "UPDATE incidentParties SET scheduled = 'Y' WHERE partyID = ?";
		stmt = connection.prepareStatement(sql);
		stmt.setString(1, request.getParameter("partyID"));
		stmt.executeUpdate();		
		
		getServletContext().getRequestDispatcher("/irList.jsp").forward(request, response);
		} catch(Exception ex)
		{
			 response.setContentType("text/html");
		     PrintWriter out = response.getWriter();
			 out.println(ex.getMessage());
			 out.println("<a href=\"/Incidents/NewIRServlet\">Back to Submit IR</a>");
		}
	}
}
