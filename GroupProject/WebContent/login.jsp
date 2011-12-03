
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--  which doctype declaration do we want? XHTML strict will make the tags behave nicely with other languages, but the tags are harder to write.
recommend HTML transitional as it is the easiest to write tags for -->
<head>

	<title>Incident-System Login</title>
	<link href="styles.css" rel="stylesheet" type="text/css" media="screen" />
	

        <script type="text/javascript" src="http://www.colorado.edu/ssi/jquery/jquery-latest.pack.js"></script>
        
<!--  this will be replaced with our jquery build -->

</head>
<body>
<div class="mainContainer">

	
	<div class="header">
		<p>Incident Reporting System</p>	
	</div>
	<div class="sideNav">
		
		<ul>
			<a href="login.jsp"><li class="topNav">Login</li></a>
		</ul>
			
			
	</div>
	
	<div class="content">
	<h2>Incident Reporting System Login</h2>
	
		<form action="/GroupProject/LoginServlet" method="post">
		Username: <input type="text" name="userLogin" size="20" /><br />
		Password: <input type="password" name="password" size="20" /><br />
		<input type="submit" value="Login" />
		</form>
		<div class="footer">
			<p>cool footer content</p>
		</div>
	</div>
	

</div>

                
       
			
		
</body>
</html>

