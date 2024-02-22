import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class Aprove extends HttpServlet
{
	Connection con;
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{

		PrintWriter out=res.getWriter();
		res.setContentType("text/html");
		String email=req.getParameter("email");
		// String pass=req.getParameter("pass");
		

		 try {
     			Class.forName("com.mysql.jdbc.Driver");
			     con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/Online_Vote", "root", "sumit123");	
		        

		        Statement s1=con.createStatement();
				ResultSet r1=s1.executeQuery("SELECT * FROM verify where EMAIL='"+email+"'");
					if(r1.next()){
						out.println("<html><body>");
						out.println("<div style='margin:50px auto; text-align:center; width:400px; height:200px; line-height:200px; border-radius:20px; background-color:red; color:red; box-shadow:0 0 10px black; font-size:20px;'> ");
						out.println("<p style='margin-top:50%; color:white; font-size:20px;'>Already Aproved</p>");
						out.println("<a href='viewVoter.jsp' style='text-align:center; width:180px; height:60px; line-height:60px; border-radius:10px; background-color:red; box-shadow:0 0 10px black; color:white; font-size:20px;'>Okay</a>");
						out.println("</div>");
						out.println("</body></html>");
					}

				Statement s = con.createStatement();
		        String sql = "SELECT * FROM verify where EMAIL='"+email+"'";
		        ResultSet rec = s.executeQuery(sql);
		       	Statement st = con.createStatement();
		        String sqlCh = "SELECT * FROM voters where EMAIL='"+email+"'";
		        ResultSet recCh = st.executeQuery(sqlCh);
		        recCh.next();
		        
		        if(!rec.next()){
		       		Statement stmt = con.createStatement();
			       	int u=stmt.executeUpdate("insert into verify(EMAIL,PASSWORD) values('"+email+"','"+recCh.getString(7)+"')");

				    out.println("<html><body>");
					out.println("<div style='margin:50px auto; text-align:center; width:400px; height:200px; line-height:200px; border-radius:20px; background-color:#009100; color:red; box-shadow:0 0 10px black; font-size:20px;'> ");
					out.println("<p style='margin-top:50%; color:white; font-size:20px;'>Aproval Completed</p>");
					out.println("<a href='viewVoter.jsp' style='text-align:center; width:180px; height:60px; line-height:60px; border-radius:10px; background-color:#009100; box-shadow:0 0 10px black; color:white; font-size:20px;'>Okay</a>");
					out.println("</div>");
					out.println("</body></html>");

			    }
			    	
			    // 	out.println("<html><body>");
				// 	out.println("<div style='margin:50px auto; text-align:center; width:400px; height:200px; line-height:200px; border-radius:20px; background-color:#2525d5; color:red; box-shadow:0 0 10px black; font-size:20px;'> ");
				// 	out.println("<p style='margin-top:50%; color:white; font-size:20px;'>Already Aproved</p>");
				// 	out.println("<a href='viewVoter.jsp' style='text-align:center; width:180px; height:60px; line-height:60px; border-radius:10px; background-color:#000482; box-shadow:0 0 10px black; color:white; font-size:20px;'>Okay</a>");
				// 	out.println("</div>");
				// 	out.println("</body></html>");
			    // }
			}catch(Exception e){e.printStackTrace();}

			

	}
}