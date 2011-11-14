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


//
public class NewMDServlet extends HttpServlet implements Servlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
		
		String responsible = request.getParameter("responsible");
		String violations = request.getParameter("violations");
		String notes = request.getParameter("notes");
		String incID = request.getParameter("incID");
		
		//
		String connectionURL = "jdbc:mysql://csel.cs.colorado.edu:3306/spurgeoj_incident";
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
		connection = DriverManager.getConnection(connectionURL, "spurgeoj_admin", "dog123");
		//createStatement() is used for create statement object that is used for 
		//sending sql statements to the specified database. */
		statement = connection.createStatement();
		// sql query to retrieve values from the secified table.
		
		String sql = "INSERT INTO meetingDocs (meetingResp, meetingViolation, meetingNotes, incidentID) VALUES (?, ?, ?, ?)";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setString(1, responsible);
		stmt.setString(2, violations);
		stmt.setString(3, notes);
		stmt.setString(4, incID);
		stmt.executeUpdate();
		
		getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
		} catch(Exception ex)
		{
			 response.setContentType("text/html");
		     PrintWriter out = response.getWriter();
			 out.println(ex.getMessage());
			 out.println("<a href=\"/Incidents/NewIRServlet\">Back to Submit IR</a>");
		}
	}
}