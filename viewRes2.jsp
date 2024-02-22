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
	margin-top: 3px;
	height: 600px;
	width: 100%;
	text-align: center;
}
.afterimg>h2
{
	user-select: none;
	color: black;
	font-family: sans-serif;
	text-align: center;
	
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
	<div >
 		 <%
			String name=request.getParameter("election");
		    try {
		        Class.forName("com.mysql.jdbc.Driver");
		        Connection c =  DriverManager.getConnection("jdbc:mysql://localhost:3306/Online_Vote", "root", "sumit123");
		        Statement s = c.createStatement();
		        Statement s1 = c.createStatement();
		        String sql = "SELECT * FROM candidates where electionName='"+name+"'";
		       	
		        ResultSet rec = s.executeQuery(sql);

		        Statement stmt=c.createStatement();
		        ResultSet rs=stmt.executeQuery("select count(*) from candidates where electionName='PM ELECTION 2024';");
		        rs.next();
		        int size=rs.getInt(1);
		        int result[]=new int[size];
		        int k=0;
		        String nam[]=new String[size];
		        String party[]=new String[size];

		        %>
		
	</div>
	<div class="afterimg">
		<br><br><br>
		<h2 ><%=name%> Result</h2><br><br>
		<table cellspacing="0" border = "1px" width = "1000px">
			          <tr bgcolor="#2424ff">
			             <th style="padding: 6px;">Candidate Profile</th>
			             <th style="padding: 6px;">Candidate Name</th>
			             <th style="padding: 6px;">Party Name</th>
			             <th style="padding: 6px;">Vote</th>
			         </tr>
			         <%while(rec.next()) { 
			         	
			         	
			         	String path=request.getServletContext().getRealPath("/");
			         	InputStream f=rec.getBinaryStream("img");
            			FileOutputStream fout=new FileOutputStream(path+"\\"+"profile"+rec.getInt(1)+".png");
            			int i=0;
			            while((i=f.read())!=-1)
			            {
			                fout.write(i);
			            }
			            result[k]=rec.getInt("nV");
			            nam[k]=rec.getString("candidateName");
			            party[k]=rec.getString("party");
			            k++;

			         %>
			         <tr>

			         	<td style="padding: 10px;"><img style="border-radius: 80px;"  src="profile<%=rec.getInt(1)%>.png" width="70px" height="50px"></td>
			         	<td style="padding: 10px;"><%=rec.getString("candidateName")%></td>
			         	<td style="padding: 10px;"><%=rec.getString("party")%></td>
			         	<td style="padding: 10px;"><%=rec.getString("nV")%></td>

			         </tr>
			    <% }%>

		</table>
		<%  
			int max=0;
			String won="WON";
			    for(int j=0;j<result.length;j++)
			    {
			    	
			    	if(result[j]>result[max])
			    	{
			    		max=j;
			    	}
			    }
			    out.println("<br><br><br>");
			    out.println("<div style='font-size:30px;color:green'><pre>"+nam[max]+"             "+party[max]+"             "+won+"</pre></div>");

			%>
		<%}catch (Exception e) { e.printStackTrace(); }
		%>
	</div>
</body>
</html>
