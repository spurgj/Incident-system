<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%
				request.getSession(true).removeAttribute("userId");
				request.getSession(true).removeAttribute("userRole");
				request.getSession(true).removeAttribute("userLogin");
				getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);


%>