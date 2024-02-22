
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page contentType="text/html" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<style>
		@import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css');
		*{
	margin: 0 auto;
	padding: 0;
}
.navbar{
	height: 80px;
	width: 100%;
	background-color: #2525d5;
	border-radius: 10px;
}
.navbar>ul
{

	height: 80px;
	width: 1200px;
	display: flex;
	float: right;
}
.navbar>ul>li
{
	user-select: none;
	flex: 1;
	list-style-type: none;
	line-height: 80px;

}
.navbar>ul>li>a
{
	padding: 20px;
	width: 200px;
	height: 80px;
	text-decoration: none;
	color: white;
	font-family: sans-serif;
	
}
.navbar>ul>li>a:hover
{
	background-color: white;
	color: #2525d5;
	border-radius: 10px;
}
.afternav
{
	margin-top: 2px;
	background-image: url('election1.png');
	background-repeat: no-repeat;
	height: 500px;
	width: 100%;
	border-radius: 10px;
	background-size: cover;
}
.afternav>h2
{
	user-select: none;
	color: black;
	font-family: sans-serif;
	text-align: center;
	line-height: 500px;
	font-size: 50px;
}
.afterimg
{
	height: 500px;
	width: 100%;
	text-align: center;
}
.afterimg>h2
{
	padding-top: 25px;
}
#id
{
	margin-top: 50px;

}
#id>input
{
	border: none;
	outline: none;
	font-size: 20px;
	border-bottom: 1px solid black;
}

#ele>input
{
	border: none;
	outline: none;
	font-size: 20px;
	border-bottom: 1px solid black;
}
#election{
	border: none;
	outline: none;
	font-size: 25px;
	border-bottom: 1px solid black;
}
#name>input
{
	border: none;
	outline: none;
	font-size: 20px;
	border-bottom: 1px solid black;
}
#party>input
{
	border: none;
	outline: none;
	font-size: 20px;
	border-bottom: 1px solid black;
}
#address>input
{
	border: none;
	outline: none;
	font-size: 20px;
	border-bottom: 1px solid black;
}
#phone>input
{
	border: none;
	outline: none;
	font-size: 20px;
	border-bottom: 1px solid black;
}
#image>input
{
	/*border: none;
	outline: none;*/
	font-size: 13px;
	border-bottom: 1px solid black;
}
#sub
{
	outline: none;
	border: none;
	background-color: #2525d5;
	color: white;
	font-family: sans-serif;
	border-radius: 40px;
	padding-top: 20px;
	padding-left: 40px;
	padding-right: 40px;
	padding-bottom: 20px;

}
#sub:hover
{
	color: #2525d5;
	background-color: white;
	border: 1px solid #2525d5;
}
	</style>
</head>
<body>
	<nav class="navbar">
		<ul>
			<li><a href="adminHome.html">HOME</a></li>
			<li><a href="addElec.html">ADD ELECTION</a></li>
			<li><a href="addCand.jsp">ADD CANDIDATE</a></li>
			<li><a href="viewRes.jsp">VIEW RESULTS</a></li>
			<li><a href="viewVoter.jsp">VIEW VOTERS</a></li>
			<!-- <a href="viewVoter.jsp">VIEW VOTERS</a> -->
			<li><a href="Logout">LOGOUT</a></li>
		</ul>
	</nav>
	<div class="afternav">
		<h2>WELCOME TO ONLINE ELECTION SYSTEM</h2>
	</div>
	<div class="afterimg">
		<%

		    try {
		        Class.forName("com.mysql.jdbc.Driver");
		        Connection c =  DriverManager.getConnection("jdbc:mysql://localhost:3306/Online_Vote", "root", "sumit123");
		        Statement s = c.createStatement();
		        String sql = "SELECT * FROM election";
		        ResultSet rec = s.executeQuery(sql);

		%>
		<h2>ADD ELECTIONS</h2>
		<form class="form1" action="addCand" enctype="multipart/form-data" method="post"><br><br><br>
			<h1>ADD CANDIDATES</h1><br><br><br>

			<div id=id><i style="font-size:20px;color: #2525d5;" class="fa">&#xf2c3;</i><input type="number" name="id" placeholder="Enter Candidate's ID" required ></div><br><br>

			<div id=ele><i style="font-size:20px;color: #2525d5;" class="fa">&#xf1d7;</i><select id="election" name="election" required>
					<option>Select Election</option>
					<%while(rec.next()) { %>
					<option><%= rec.getString("electionName")%></option>
					<%}%>
				</select></div>
				<br><br>

			<div id=name><i style="font-size:20px;color: #2525d5;" class="fa">&#xf007;</i><input type="text" name="name" placeholder="Enter Candidate Name" required></div><br><br>

			<div id=party><i style="font-size:20px;color: #2525d5;" class="fa">&#xf0c0;</i><input type="text" name="party" placeholder="Enter Party Name" required></div><br><br>

			<div id=address><i style="font-size:20px;color: #2525d5;" class="fa">&#xf015;</i><input type="text" name="address" placeholder="Enter Address of Candidate" required></div><br><br>

			<div id=phone><i style="font-size:20px;color: #2525d5;" class="fa">&#xf095;</i><input type="text" name="phone" placeholder="Enter Phone No" required></div>	<br><br>
			<div id=image><i style="font-size:20px;color: #2525d5;" class="fa">&#xf03e;</i><input type="file" name="img" placeholder="Enter Candidate's image" required></div><br><br>
			
			<input id="sub" type="submit" value="ADD">
		</form><br><br>
		<%  
		} catch (Exception e) { e.printStackTrace(); }
		%>
	</div>

</body>
</html>