<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Document Meeting</title>
</head>
<body>
<div id="newMD" style="font-family: serif; font-size: 12px;">
	<form action="/Incidents/NewMDServlet" method="post">
		<h1>Document Meeting</h1>
		Meeting Notes: <br /><textarea rows="20" cols="50" name="notes"></textarea><br />
		Date/Time: <br /><input type="text" name="datetime" value="yyyy-mm-dd hh:mm" /><br />
		<input type="submit" value="Submit Meeting Documentation" />
	</form>
</div>
</body>
</html>