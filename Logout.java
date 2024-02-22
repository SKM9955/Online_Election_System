import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;

public class Logout extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		res.setContentType("text/html");
		ServletOutputStream out=res.getOutputStream();
		HttpSession se=req.getSession(false);
		if(se!=null){
				se.invalidate();
				out.println("<html><body>");
				out.println("<div style='margin:50px auto; text-align:center; width:400px; height:200px; line-height:200px; border-radius:20px; background-color:#009100; color:red; box-shadow:0 0 10px black; font-size:20px;'> ");
				out.println("<p style='margin-top:50%; color:white; font-size:20px;'>Logout Successfully</p>");
				out.println("<a href='home.html' style='text-align:center; width:180px; height:60px; line-height:60px; border-radius:10px; background-color:#009100; box-shadow:0 0 10px black; color:white; font-size:20px;'>Okay</a>");
				out.println("</div>");
				out.println("</body></html>");	
		}
		else
		{
			out.println("<html><body>");
			out.println("<div style='margin:50px auto; text-align:center; width:400px; height:200px; line-height:200px; border-radius:20px; background-color:red; color:red; box-shadow:0 0 10px black; font-size:20px;'> ");
			out.println("<p style='margin-top:50%; color:white; font-size:20px;'>Login First Then visit here</p>");
			out.println("<a href='home.html' style='text-align:center; width:180px; height:60px; line-height:60px; border-radius:10px; background-color:red; box-shadow:0 0 10px black; color:white; font-size:20px;'>Okay</a>");
			out.println("</div>");
			out.println("</body></html>");	
		}
	}
}