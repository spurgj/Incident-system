<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Schedule New Meeting</title>
</head>
<body>
<div id="newMS" style="font-family: serif; font-size: 12px;">
	<form action="/GroupProject/NewMSServlet" method="post">
		<h1>Scheduling New Meeting</h1>
		Content: <br /><textarea rows="20" cols="50" name="content"></textarea><br />
		Date/Time: <br /><input type="text" name="datetime" value="yyyy-mm-dd hh:mm" /><br />
		Length: <br /><textarea name="length" rows="1" cols="10"></textarea><br />
		<input type="submit" value="Submit Meeting" />
	</form>
</div>
</body>
</html>