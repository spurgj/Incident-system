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
public class NewMDServlet extends HttpServlet implements Servlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			if(request.getSession(true).getAttribute("userRole") == null || !request.getSession(true).getAttribute("userRole").equals("CO"))
			{
				getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
				return;
			}
		//Gets the offenses the party was found responsible for, as well as the notes of the meeting.

		String[] offenses = request.getParameterValues("offenses");

		String notes = request.getParameter("notes");
		
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
		
		String sql = "INSERT INTO meetingDocs (partyID, meetingNotes) VALUES (?, ?)";


		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setString(1, request.getParameter("partyID"));
		stmt.setString(2, request.getParameter("notes"));
		stmt.executeUpdate();
		
		boolean is_responsible = false;
		
		sql = "INSERT INTO offenseResponsibility (partyID, offenseID) VALUES (?, ?)";
		int i = 0;
		String[] responsibility = request.getParameterValues("responsible");
		stmt = connection.prepareStatement(sql);
		while(i<responsibility.length)
		{
		stmt.setString(1, request.getParameter("partyID"));
		stmt.setString(2, responsibility[i]);
		stmt.executeUpdate();
		i++;
		is_responsible = true;
		}
		
		if(is_responsible)
		{
			
			sql = "SELECT sanctionID FROM partySanctions LEFT JOIN incidentParties ON partySanctions.partyID = incidentParties.partyID WHERE incidentParties.party = (SELECT party FROM incidentParties WHERE partyID = ?) AND sanctionID IN(8, 9) GROUP BY sanctionID";
			stmt = connection.prepareStatement(sql);
			
			stmt.setString(1, request.getParameter("partyID"));
			rs = stmt.executeQuery();
			
			sql = "INSERT INTO partySanctions (partyID, sanctionID, dueDate, notes) VALUES (?, ?, ?, ?)";
			stmt = connection.prepareStatement(sql);
			
			
			while(rs.next())
			{
				if(rs.getString(1).equals("8"))
				{
					stmt.setString(1, request.getParameter("partyID"));
					stmt.setString(2, "9");
					stmt.setString(3, "0000-00-00");
					stmt.setString(4, "System generated suspension as a result of being found responsible while on probation.");
					stmt.executeUpdate();
				} else if(rs.getString(1).equals("9"))
				{
					stmt.setString(1, request.getParameter("partyID"));
					stmt.setString(2, "10");
					stmt.setString(3, "0000-00-00");
					stmt.setString(4, "System generated expulsion as a result of being found responsible while on suspension.");
					stmt.executeUpdate();
				}
			}
			
		}
		
		
		if(request.getParameterValues("sanctions") != null) 
		{
				
			
			sql = "INSERT INTO partySanctions (partyID, sanctionID, dueDate) VALUES (?, ?, ?)";
			stmt = connection.prepareStatement(sql);
			
			String sanctions[] = request.getParameterValues("sanctions");
			
			
			for(i = 0;i<sanctions.length;i++)
			{
				stmt.setString(1, request.getParameter("partyID"));
				stmt.setString(2, sanctions[i]);
				stmt.setString(3, "2011-" + request.getParameter("sanction_" + sanctions[i] + "_month") + "-" + request.getParameter("sanction_" + sanctions[i] + "_day"));
				stmt.executeUpdate();
			}
		}
		
		sql = "UPDATE coMeetings SET status = 'H' WHERE partyID = ?";
		stmt = connection.prepareStatement(sql);
		stmt.setString(1, request.getParameter("partyID"));
		stmt.executeUpdate();
		
		getServletContext().getRequestDispatcher("/meetingSchedule.jsp").forward(request, response);
		} catch(Exception ex)
		{
			 response.setContentType("text/html");
		     PrintWriter out = response.getWriter();
			 out.println(ex.getMessage());
			 out.println("<a href=\"/Incidents/NewIRServlet\">Back to Submit IR</a>");
		}
	}
}
