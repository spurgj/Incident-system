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
import java.util.Enumeration;
import java.util.List;
import java.sql.*;
import java.io.*; 

//Commit Test
//
public class UpdateUsersServlet extends HttpServlet implements Servlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
		
		if(request.getSession(true).getAttribute("userRole") == null || !request.getSession(true).getAttribute("userRole").equals("CO"))
		{
			getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
			return;
		}
			
		Enumeration<String> users = request.getParameterNames();
		String user;
		
		
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
		
		String sql = "UPDATE users SET userRole = ? WHERE userId = ?";
		PreparedStatement stmt = connection.prepareStatement(sql);
		

		while(users.hasMoreElements())
		{
			user = users.nextElement();
			if(user != "delete")
			{
				stmt.setString(1, request.getParameter(user));
				stmt.setString(2, user);
				stmt.executeUpdate();
			}
		}
		if(request.getParameterValues("delete") != null)
		{
			String delete[] = request.getParameterValues("delete");
	
			sql = "DELETE FROM users WHERE userId = ?";
			stmt = connection.prepareStatement(sql);
			
	
			int i = 0;
			for(i = 0; i<delete.length; i++)
			{
				stmt.setString(1, delete[i]);
				stmt.executeUpdate();
			}
		}
		
		getServletContext().getRequestDispatcher("/users.jsp").forward(request, response);
		} catch(Exception ex)
		{
			 response.setContentType("text/html");
		     PrintWriter out = response.getWriter();
			 out.println(ex.getMessage());
			 ex.printStackTrace(out);
			 out.println("<a href=\"/GroupProject/NewIRServlet\">Back to Submit IR</a>");
		}
	}
}

		
