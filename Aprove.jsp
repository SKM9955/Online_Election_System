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
			<li><a href="addCand.html">ADD CANDIDATE</a></li>
			<li><a href="viewRes.html">VIEW RESULTS</a></li>
			<li><a href="Aprove.jsp">VIEW VOTERS</a></li>
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
			       <table cellspacing="0" border = "1px" width = "1000px">
			          <tr bgcolor="#0000ff" style="text-align: center; color: white;">
			             <th style="padding: 8px;">NAME</th>
			             <th style="padding: 8px;">DATE</th>
			             <th style="padding: 8px;">EMAIL</th>
			             <th style="padding: 8px;">GENDER</th>
			             <th style="padding: 8px;">PHONE</th>
			             <th style="padding: 8px;">ADDRESS</th>
			             <th style="padding: 8px;">Status</th>
			          </tr>
		             <%while((rec!=null) && (rec.next())) { %>
		             	<%
		             		ResultSet rec1=null;
		             		try{
		             			s2 = c.createStatement();
						         sql = "SELECT * FROM verify where EMAIL='"+rec.getString("EMAIL")+"' and PASSWORD='"+rec.getString("PASSWORD")+"'";
						        rec1 = s2.executeQuery(sql);

						        if(rec1==null){
		             		  	s1 = c.createStatement();
		             			sql="insert into verify values('"+rec.getString("EMAIL")+"','"+rec.getString("PASSWORD")+"'";
		     					s1.executeUpdate(sql);

		     					}
		     					sql = "SELECT * FROM verify where EMAIL='"+rec.getString("EMAIL")+"' and PASSWORD='"+rec.getString("PASSWORD")+"'";
						        rec1 = s2.executeQuery(sql);
		     					
						    	}catch(Exception e){e.printStackTrace();}
		        			%>
		                  <tr >
		                    <td  style="padding: 10px;"><%=rec.getString("NAME")%></td>
		                    <td  style="padding: 10px;"><%=rec.getString("DATE")%></td>
		                    <td  style="padding: 10px;"><%=rec.getString("EMAIL")%></td>
		                    <td  style="padding: 10px;"><%=rec.getString("GENDER")%></td>
		                    <td  style="padding: 10px;"><%=rec.getString("PHONE")%></td>
		                    <td  style="padding: 10px;"><%=rec.getString("ADDRESS")%></td>
		                    <% if(rec1!=null){ %>
		                    <td  style="padding: 10px;">Active</td>
		                    <%} else{ %>
		                    <td  style="padding: 10px;">Pending</td>
		                    <%}%>
		                    
		                    <%-- <td><a href="Aprove.jsp" style="background-color: blue; color: white;text-decoration: none;">Aprove</a></td>
		                  </tr>  --%>
		                  <%}%>
		                    
		        </table>      
		        <%  
		        } catch (Exception e) { e.printStackTrace(); }
		        %>
	</div>

</body>
</html>
