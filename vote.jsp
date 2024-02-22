<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page contentType="text/html" %>

<!DOCTYPE html>
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
	width: 600px;
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
	width: 100px;
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
#ele
{
	margin-top: 50px;

}
#ele>input
{
	border: none;
	outline: none;
	font-size: 20px;
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
			<li><a href="election.html">Home</a></li>
			<li><a href="election.jsp">Elections</a></li>
			<li><a href="Logout">Logout</a></li>
		</ul>
	</nav>
	<div class="afternav">
		<%
			String name=request.getParameter("election");
		    try {
		        Class.forName("com.mysql.jdbc.Driver");
		        Connection c =  DriverManager.getConnection("jdbc:mysql://localhost:3306/Online_Vote", "root", "sumit123");
		        Statement s = c.createStatement();
		        String sql = "SELECT * FROM candidates where electionName='"+name+"'";
		        ResultSet rec = s.executeQuery(sql);
		        
		        %>
		<h2>WELCOME TO ONLINE ELECTION SYSTEM</h2>
	</div>
	<div class="afterimg">
		<h2><%=name%></h2>
		<table cellspacing="0" border = "1px" width = "1000px">
			          <tr bgcolor="#2424ff">
			             <th style="padding: 6px;">Candidate Profile</th>
			             <th style="padding: 6px;">Candidate Name</th>
			             <th style="padding: 6px;">Party Name</th>
			             <th style="padding: 6px;">Vote</th>
			         </tr>
			         <%while( (rec.next())) { 
			         	String path=request.getServletContext().getRealPath("/");
			         	InputStream f=rec.getBinaryStream("img");
            			FileOutputStream fout=new FileOutputStream(path+"\\"+"profile"+rec.getInt(1)+".png");
            			int i=0;
			            while((i=f.read())!=-1)
			            {
			                fout.write(i);
			            }
			         %>
			         <tr>
<%-- out.println("<img src='abc12.jpg' width='100' height='100'>"); --%>
			         	<td style="padding: 10px;"><img src="profile<%=rec.getInt(1)%>.png" style="border-radius: 80px;" width="70px" height="50px"></td>
			         	<td style="padding: 10px;"><%=rec.getString("candidateName")%></td>
			         	<td style="padding: 10px;"><%=rec.getString("party")%></td>
			         	<form action="vot" method="post">
			         		<input type="hidden" value="<%=rec.getInt(1)%>" name="id">
			         	<td style="padding: 10px;"><button type="submit" name="" >Vote</button></td>
			         	</form>

			         </tr>
			     		<% } %>
		</table>
		<%  
			
		}catch (Exception e) { e.printStackTrace(); }
		%>
	</div>
	
</body>
</html>
