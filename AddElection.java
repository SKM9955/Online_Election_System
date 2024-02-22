
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class AddElection extends HttpServlet
{

	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		PrintWriter out=res.getWriter();
		res.setContentType("text/html");
		String ele=req.getParameter("election");
		 try {
     			Class.forName("com.mysql.jdbc.Driver");
			    Connection con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/Online_Vote", "root", "sumit123");
			    
			    Statement stmt=con.createStatement();
			    ResultSet rs=stmt.executeQuery("select * from election where electionName = '"+ele+"'");
			    if(!rs.next()){
		        Statement s = con.createStatement();
		        String sql = "insert into election values('"+ele+"')";
		       	s.executeUpdate(sql);

				out.println("<html><body>");
				out.println("<div style='margin:50px auto; text-align:center; width:400px; height:200px; line-height:200px; border-radius:20px; background-color:#2525d5; color:red; box-shadow:0 0 10px black; font-size:20px;'> ");
				out.println("<p style='margin-top:50%; color:white; font-size:20px;'>Election Added Successfully</p>");
				out.println("<a href='addElec.html' style='text-align:center; width:180px; height:60px; line-height:60px; border-radius:10px; background-color:#000482; box-shadow:0 0 10px black; color:white; font-size:20px;'>Okay</a>");
				out.println("</div>");
				out.println("</body></html>");
		       }else{

				out.println("<html><body>");
				out.println("<div style='margin:50px auto; text-align:center; width:400px; height:200px; line-height:200px; border-radius:20px; background-color:red; color:red; box-shadow:0 0 10px black; font-size:20px;'> ");
				out.println("<p style='margin-top:50%; color:white; font-size:20px;'>This Election Already Exists</p>");
				out.println("<a href='addElec.html' style='text-align:center; width:180px; height:60px; line-height:60px; border-radius:10px; background-color:red; box-shadow:0 0 10px black; color:white; font-size:20px;'>Okay</a>");
				out.println("</div>");
				out.println("</body></html>");
		       }
		     				
			}catch(Exception e){e.printStackTrace();}

	}
}