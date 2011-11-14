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
	
	<!-- Displays a form to enter details of a meeting, as well as selecting infractions committed -->
	
	<form action="/Incidents/NewMDServlet" method="post">
		<h1>Document Meeting</h1>
		Meeting Notes: <br /><textarea rows="20" cols="50" name="notes"></textarea><br />
		
		<h2>Conduct Violations</h2>

		<input type=checkbox name=offenses value=assaults> Assault <br>
		<input type=checkbox name=offenses value=partnerAbuse> Partner Abuse <br>
		<input type=checkbox name=offenses value=threatening> Threatening/Endangering Safety <br>
		<input type=checkbox name=offenses value=sexMisconduct> Sexual Misconduct <br>
		<input type=checkbox name=offenses value=indecentExp> Indecent Exposure <br>
		<input type=checkbox name=offenses value=stalking> Stalking <br>
		<input type=checkbox name=offenses value=hazing> Hazing <br>
		<input type=checkbox name=offenses value=abuseConduct> Abusive Conduct <br>
		<input type=checkbox name=offenses value=propertyDam> Damaging Property <br><br>
		<input type="submit" value="Submit Meeting Documentation" />
	</form>
</div>
</body>
</html>