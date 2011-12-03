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
public class LoginServlet extends HttpServlet implements Servlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
		
			
		String userLogin = request.getParameter("userLogin");
		String password = request.getParameter("password");
		
		
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
		
		String sql = "SELECT COUNT(*),userId,userRole FROM users WHERE userLogin = ? AND userPasswordHash = SHA(?)";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setString(1, userLogin);
		stmt.setString(2, request.getParameter("password"));
		ResultSet userRes = stmt.executeQuery();

		if(userRes.next())
		{
			if(userRes.getString(1).equals("1"))
			{
				
				request.getSession(true).setAttribute("userId", userRes.getString(2));
				request.getSession(true).setAttribute("userLogin", userLogin);
				request.getSession(true).setAttribute("userRole", userRes.getString(3));
				getServletContext().getRequestDispatcher("/home.jsp?found").forward(request, response);
			}
			else {
				 response.setContentType("text/html");
				 PrintWriter out = response.getWriter();
				 out.println("Not found");
			}
		}
		
		} catch(Exception ex)
		{
			 response.setContentType("text/html");
		     PrintWriter out = response.getWriter();
			 out.println(ex.getMessage());
			 out.println("<a href=\"/GroupProject/NewIRServlet\">Back to Submit IR</a>");
		}
	}
}

		
