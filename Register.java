import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class Register extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		res.setContentType("text/html");
		PrintWriter out=res.getWriter();
		String name=req.getParameter("name");
		String date=req.getParameter("date");
		String email=req.getParameter("email");
		String gender=req.getParameter("gender");
		String phone=req.getParameter("phone");
		String address=req.getParameter("address");
		String pass=req.getParameter("pass");
		// ServletContext ctx=getServletContext();
		// Connection c=(Connection)ctx.getAttribute("connection");
		try{
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/Online_Vote", "root", "sumit123");	
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select * from voters where EMAIL='"+email+"'");
			if(rs.next())
			{
				out.println("<html><body>");
				out.println("<div style='margin:50px auto; text-align:center; width:400px; height:200px; line-height:200px; border-radius:20px; background-color:red; color:red; box-shadow:0 0 10px black; font-size:20px;'> ");
				out.println("<p style='margin-top:50%; color:white; font-size:20px;'>This email-id already exists</p>");
				out.println("<a href='register.html' style='text-align:center; width:180px; height:60px; line-height:60px; border-radius:10px; background-color:red; box-shadow:0 0 10px black; color:white; font-size:20px;'>Okay</a>");
				out.println("</div>");
				out.println("</body></html>");	
			}
			else{
				PreparedStatement ps=con.prepareStatement("insert into voters values(?,?,?,?,?,?,?)");
				ps.setString(1,name);
				ps.setString(2,date);
				ps.setString(3,email);
				ps.setString(4,gender);
				ps.setString(5,phone);
				ps.setString(6,address);
				ps.setString(7,pass);
				ps.execute();
				out.println("<html><body>");
				out.println("<div style='margin:50px auto; text-align:center; width:400px; height:200px; line-height:200px; border-radius:20px; background-color:#2525d5; color:red; box-shadow:0 0 10px black; font-size:20px;'> ");
				out.println("<p style='margin-top:50%; color:white; font-size:20px;'>Registration Successfull</p>");
				out.println("<a href='user.html' style='text-align:center; width:180px; height:60px; line-height:60px; border-radius:10px; background-color:#000482; box-shadow:0 0 10px black; color:white; font-size:20px;'>Okay</a>");
				out.println("</div>");
				out.println("</body></html>");
				ps.close();
				con.close();
			}
		}catch(Exception e){e.printStackTrace();}
	}
}