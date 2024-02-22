import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class Admin extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		PrintWriter out=res.getWriter();
		res.setContentType("text/html");
		String email=req.getParameter("email");
		String pass=req.getParameter("pass");
		// ServletContext ctx=getServletContext();
		// Connection c=(Connection)ctx.getAttribute("connection");
		try{
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/Online_Vote", "root", "sumit123");	
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select * from admin where EMAIL='"+email+"' and PASSWORD='"+pass+"'");
			if(rs.next())
			{
				HttpSession se=req.getSession();
				se.setAttribute("email",email);
				se.setAttribute("pass",pass);
				out.println("<html><body>");
				out.println("<div style='margin:50px auto; text-align:center; width:400px; height:200px; line-height:200px; border-radius:20px; background-color:#009100; color:red; box-shadow:0 0 10px black; font-size:20px;'> ");
				out.println("<p style='margin-top:50%; color:white; font-size:20px;'>Login Successfull</p>");
				out.println("<a href='adminHome.html' style='text-align:center; width:180px; height:60px; line-height:60px; border-radius:10px; background-color:#009100; box-shadow:0 0 10px black; color:white; font-size:20px;'>Okay</a>");
				out.println("</div>");
				out.println("</body></html>");
			}
			else
			{
				out.println("<html><body>");
				out.println("<div style='margin:50px auto; text-align:center; width:400px; height:200px; line-height:200px; border-radius:20px; background-color:red; color:red; box-shadow:0 0 10px black; font-size:20px;'> ");
				out.println("<p style='margin-top:50%; color:white; font-size:20px;'>Please enter valid EMAIL or PASSWORD</p>");
				out.println("<a href='admin.html' style='text-align:center; width:180px; height:60px; line-height:60px; border-radius:10px; background-color:red; box-shadow:0 0 10px black; color:white; font-size:20px;'>Okay</a>");
				out.println("</div>");

				out.println("</body></html>");
			}
		// }catch(Exception e){out.println("<p style='margin-top:50%; color:yellow; font-size:20px;'>"+e+"</p>");}
		}catch(Exception e){e.printStackTrace();}
	}
}