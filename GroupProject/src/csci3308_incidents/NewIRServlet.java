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

//Commit Test
//
public class NewIRServlet extends HttpServlet implements Servlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
		if(request.getSession(true).getAttribute("userId") == null)
		{
			getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
			return;
		}
		String summary = request.getParameter("summary");
		String parties = request.getParameter("parties");
		
		
		//
		String connectionURL = "jdbc:mysql://127.0.0.1:3306/incident";
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
		
		String sql = "INSERT INTO incidentReports (incidentTimeDate, incidentSummary) VALUES (?, ?)";
		PreparedStatement stmt = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
		stmt.setString(1, "2011-" + request.getParameter("month") + "-" + request.getParameter("day") + " " + request.getParameter("hour") + "-" + request.getParameter("minute"));
		stmt.setString(2, summary);
		stmt.executeUpdate();
		ResultSet get_ai = stmt.getGeneratedKeys();
		int incID = 0;
		if(get_ai.next())
		{
			incID = get_ai.getInt(1);
		}
		
		sql = "INSERT INTO incidentParties (incID, party) VALUES (?,?)";
		
		String[] party = parties.split("\n");
		for(int i = 0; i < party.length; i++)
		{
			stmt = connection.prepareStatement(sql);
			stmt.setInt(1, incID);
			stmt.setString(2, party[i]);
			stmt.executeUpdate();
		}
		
		getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
		} catch(Exception ex)
		{
			 response.setContentType("text/html");
		     PrintWriter out = response.getWriter();
			 out.println(ex.getMessage());
			 out.println("<a href=\"/GroupProject/NewIRServlet\">Back to Submit IR</a>");
		}
	}
}

		
