<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--  which doctype declaration do we want? XHTML strict will make the tags behave nicely with other languages, but the tags are harder to write.
recommend HTML transitional as it is the easiest to write tags for -->
<head>

	<title>IR-Submission</title>
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
			<a href="home.jsp"><li class="topNav">Home</li></a>
			<a href="irLogin.jsp"><li>Login</li></a>
			<a href="irSubmission.jsp"><li>IR Submission</li></a>
			<a href="irSearch.jsp"><li>IR Search</li></a>
			<a href=""><li>Resources for Conduct Officers</li></a>
			<ul>
			      <a href="COCalendar.jsp"><li>Calendar</li></a>
			</ul>
			<a href=""><li>Resources for JAs</li></a>
			<ul>
			      <a href="JACalendar.jsp"><li class="bottomNav">Submitted IRs</li></a>
			</ul>
		</ul>
			
			
	</div>
	
	<div class="content">
	<h2>Incident Reporting Submission Form</h2>
		 <p></p>
		 <p></p>
		 <p>Description</p>
		 <form action="/GroupProject/NewIRServlet" method="post">
			<textarea name="summary" rows="5" cols="50"></textarea>
		<p></p>
		<select name="month">
		  <option value="1">Month</option>
		  <option value="1">January</option>
		  <option value="2">February</option>
		  <option value="3">March</option>
		  <option value="4">April</option>
		  <option value="5">May</option>
		  <option value="6">June</option>
		  <option value="7">July</option>
		  <option value="8">August</option>
		  <option value="9">September</option>
		  <option value="10">October</option>
		  <option value="11">November</option>
		  <option value="12">December</option>
		</select>
		<select name="day">
		  <option value="01">Day</option>
		  <option value="01">1</option>
		  <option value="02">2</option>
		  <option value="03">3</option>
		  <option value="04">4</option>
		  <option value="05">5</option>
		  <option value="06">6</option>
		  <option value="07">7</option>
		  <option value="08">8</option>
		  <option value="09">9</option>
		  <option value="10">10</option>
		  <option value="11">11</option>
		  <option value="12">12</option>
		  <option value="13">13</option>
		  <option value="14">14</option>
		  <option value="15">15</option>
		  <option value="16">16</option>
		  <option value="17">17</option>
		  <option value="18">18</option>
		  <option value="19">19</option>
		  <option value="20">20</option>
		  <option value="21">21</option>
		  <option value="22">22</option>
		  <option value="23">23</option>
		  <option value="24">24</option>
		  <option value="25">25</option>
		  <option value="26">26</option>
		  <option value="27">27</option>
		  <option value="28">28</option>
		  <option value="29">29</option>
		  <option value="30">30</option>
		  <option value="31">31</option>
		</select>	
		<select name="hour">
		  <option value="0">Hour</option>
		  <option value="00">00</option>
		  <option value="01">01</option>
		  <option value="02">02</option>
		  <option value="03">03</option>
		  <option value="04">04</option>
		  <option value="05">05</option>
		  <option value="06">06</option>
		  <option value="07">07</option>
		  <option value="08">08</option>
		  <option value="09">09</option>
		  <option value="10">10</option>
		  <option value="11">11</option>
		  <option value="12">12</option>
		  <option value="13">13</option>
		  <option value="14">14</option>
		  <option value="15">15</option>
		  <option value="16">16</option>
		  <option value="17">17</option>
		  <option value="18">18</option>
		  <option value="19">19</option>
		  <option value="20">20</option>
		  <option value="21">21</option>
		  <option value="22">22</option>
		  <option value="">23</option>
		</select>
	 	<select name="minute">
		  <option value="0">Minute</option>
		  <option value="0">0</option>
		  <option value="15">15</option>
		  <option value="30">30</option>
		  <option value="45">45</option>
		</select>
		
	   <p></p>
	
	   Student names<br/> 
			<textarea name="parties" cols="50" rows="5"></textarea>
			<br>
			<br>

			<input type="submit" value="Submit" />
		</form>
		<div class="footer">
			<p>cool footer content</p>
		</div>
	</div>
	

</div>

                
       
			
		
</body>
</html>
