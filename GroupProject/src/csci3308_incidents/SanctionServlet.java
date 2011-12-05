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


//Allows the user to document a meeting.
public class SanctionServlet extends HttpServlet implements Servlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			if(request.getSession(true).getAttribute("userRole") == null || !request.getSession(true).getAttribute("userRole").equals("JA"))
			{
				getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
				return;
			}
		//Gets the offenses the party was found responsible for, as well as the notes of the meeting.

		String[] partysanction_ids = request.getParameterValues("sanctions");
		String[] completion = request.getParameterValues("completion");
		String[] notes = request.getParameterValues("sanction_notes");
		
		
		//
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
		// sql query to retrieve values from the secified table.
		
		String sql = "UPDATE partySanctions SET completed = ?, notes = ? WHERE partySanctionID = ?";


		PreparedStatement stmt = connection.prepareStatement(sql);
		
		
		int i;
		
		for(i = 0; i<partysanction_ids.length;i++)
		{
			if(completion[i].equals("completed") || completion[i].equals("notcomplete"))
			{
				stmt.setString(1, completion[i].equals("completed")?"Y":"N");
				stmt.setString(2, notes[i]);
				stmt.setString(3, partysanction_ids[i]);
				stmt.executeUpdate();
			}
		}

		sql = "UPDATE partySanctions SET dueDate = DATE_ADD(dueDate, INTERVAL 14 DAY), notes = ? WHERE partySanctionID = ?";
		stmt = connection.prepareStatement(sql);
		for(i = 0; i<partysanction_ids.length;i++)
		{
			if(completion[i].equals("insufficient"))
			{
				stmt.setString(1, notes[i]);
				stmt.setString(2, partysanction_ids[i]);
				stmt.executeUpdate();
			}
		}

		
		getServletContext().getRequestDispatcher("/sanctionEntry.jsp").forward(request, response);
		} catch(Exception ex)
		{
			 response.setContentType("text/html");
		     PrintWriter out = response.getWriter();
		     ex.printStackTrace(out);
			 out.println(ex.getMessage());
			 out.println("<a href=\"/Incidents/NewIRServlet\">Back to Submit IR</a>");
		}
	}
}
