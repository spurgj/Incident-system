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
public class UpdatePasswordServlet extends HttpServlet implements Servlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			if(request.getSession(true).getAttribute("userId") == null)
			{
				getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
				return;
			}

		
		
		////
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
		
		String userId = (String)request.getSession(true).getAttribute("userId");
		String userLogin = (String)request.getSession(true).getAttribute("userLogin");
		String userRole = (String)request.getSession(true).getAttribute("userRole");
		
		
		
		String sql = "SELECT COUNT(*) = 1 FROM users WHERE userId = ? AND userPasswordHash = SHA(?)";
		PreparedStatement stmt = connection.prepareStatement(sql);
		

		stmt.setString(1, userId);
		stmt.setString(2, request.getParameter("password"));;
		rs = stmt.executeQuery();
		
		if(rs.next())
		{
	
			if(rs.getString(1).equals("1"))
			{
				
				if(request.getParameter("newpassword1").equals(request.getParameter("newpassword2")))
				{
					sql = "UPDATE users SET userPasswordHash = SHA(?)";
					stmt = connection.prepareStatement(sql);
					stmt.setString(1, request.getParameter("newpassword1"));
					stmt.executeUpdate();
					getServletContext().getRequestDispatcher("/update_user.jsp?success=1").forward(request, response);
				}
				getServletContext().getRequestDispatcher("/update_user.jsp?mismatch=1").forward(request, response);
			}
			
		}

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

		
