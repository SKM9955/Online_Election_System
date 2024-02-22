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
	<style>		*{
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
			<li><a href="Logout">LOGOUT</a></li>
		</ul>
	</nav>
	<div class="afternav">
		<h2>WELCOME TO ONLINE ELECTION SYSTEM</h2>
	</div>
	<div class="afterimg">
 		 <%
		    Connection c = null;
		    Statement s = null;
		    Statement s1 = null;
		    Statement s2 = null;

		    try {
		        Class.forName("com.mysql.jdbc.Driver");
		        c =  DriverManager.getConnection("jdbc:mysql://localhost:3306/Online_Vote", "root", "sumit123");
		        s = c.createStatement();
		        String sql = "SELECT * FROM voters";
		        ResultSet rec = s.executeQuery(sql);

		        %>

		          <h2>ONLINE ELECTION SYSTEM</h2><br><br>
		          <%-- <br><br><br><br> --%>
			       <table cellspacing="0" border = "1px" width = "1000px">
			          <tr bgcolor="#2424ff">
			             <th style="padding: 6px;">NAME</th>
			             <th style="padding: 6px;">DATE</th>
			             <th style="padding: 6px;">EMAIL</th>
			             <th style="padding: 6px;">GENDER</th>
			             <th style="padding: 6px;">PHONE</th>
			             <th style="padding: 6px;">ADDRESS</th>
			             <th style="padding: 6px;">Status</th>
			             <th style="padding: 6px;">Action</th>
			          </tr>
		             <%while((rec!=null) && (rec.next())) { %>
		             	<%
		             		
		             		  s1 = c.createStatement();
						        String sql1 = "SELECT * FROM verify where EMAIL='"+rec.getString(3)+"' and PASSWORD='"+rec.getString(7)+"'";
						        ResultSet rec1 = s1.executeQuery(sql1);
		        			%>
		                  <tr >
		                    <td style="padding: 10px;"><%=rec.getString("NAME")%></td>
		                    <td style="padding: 10px;"><%=rec.getString("DATE")%></td>
		                    <td style="padding: 10px;"><%=rec.getString("EMAIL")%></td>
		                    <td style="padding: 10px;"><%=rec.getString("GENDER")%></td>
		                    <td style="padding: 10px;"><%=rec.getString("PHONE")%></td>
		                    <td style="padding: 10px;"><%=rec.getString("ADDRESS")%></td>

		                    <% if(rec1.next()){ %>
		                    <td style="padding: 10px;">Active</td>
		                    <%} else{ %>
		                    <td style="padding: 10px;">Pending</td>
		                    <%}%>
		                 		
		                  <form action="Aprove" method="post">
			         			<input type="hidden" value="<%=rec.getString(3)%>" name="email">
			         			<%-- <input type="hidden" value="<%=rec.getString("PASSWORD")%>" name="pass"> --%>
			         			<td><button style="background-color: #091352; padding: 6px; border-radius: 5px; color: white;text-decoration: none;">Aprove</button></td>
			         		</form>

		                 		<%-- <td><a href="Aprove" style="background-color: #2424ff; padding: 6px; border-radius: 5px; color: white;text-decoration: none;">Aprove</a></td> --%>

		                    <%-- <td style="padding: 10px;"><a href="Aprove.jsp" style="background-color: #2424ff; color: white;text-decoration: none;">Aprove</a></td> --%>
		                  </tr> 
		                  <%}%>
		                    
		        </table>      
		        <%  
		        } catch (Exception e) { e.printStackTrace(); }
		        %>
	</div>

</body>
</html>
