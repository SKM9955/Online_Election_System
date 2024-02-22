import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class Vote extends HttpServlet
{
	Connection con;

	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		PrintWriter out=res.getWriter();
		res.setContentType("text/html");
		String btnS=req.getParameter("id");
		int btn=Integer.parseInt(btnS);
		HttpSession se=req.getSession(false);
		String email=(String)se.getAttribute("email");

		 try {
     			Class.forName("com.mysql.jdbc.Driver");
			    con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/Online_Vote", "root", "sumit123");	

			    Statement s = con.createStatement();
		        String sql = "SELECT * FROM candidates where id='"+btn+"'";
		        ResultSet rec = s.executeQuery(sql);
		        rec.next();
		        int nV=rec.getInt("nV");
		        
		        nV=nV+1;

			    Statement sCh = con.createStatement();
		        String sqlCh = "SELECT * FROM voted where EMAIL='"+email+"' and electionName='"+rec.getString(2)+"'";
		        ResultSet recCh = sCh.executeQuery(sqlCh);
		    
		    if(!recCh.next()){
		    	
		    	Statement sIns = con.createStatement();
		        String sqlIns = "insert into voted(email,electionName) values('"+email+"','"+rec.getString(2)+"')";
		        int u = sIns.executeUpdate(sqlIns);

		        
		        
		        Statement stmt = con.createStatement();
			    u=stmt.executeUpdate("update candidates set nV='"+nV+"' where id='"+btn+"'");
			        
		     				
			

			try{
			Statement s1=con.createStatement();
			ResultSet r1=s1.executeQuery("select * from candidates where id='"+btn+"'");
			if(r1.next()){
				out.println("<html><body>");
				out.println("<div style='margin:50px auto; text-align:center; width:400px; height:200px; line-height:200px; border-radius:20px; background-color:#009100; color:red; box-shadow:0 0 10px black; font-size:20px;'> ");
				out.println("<p style='margin-top:50%; color:white; font-size:20px;'>Vote Completed</p>");
				out.println("<a href='election.jsp' style='text-align:center; width:180px; height:60px; line-height:60px; border-radius:10px; background-color:#009100; box-shadow:0 0 10px black; color:white; font-size:20px;'>Okay</a>");
				out.println("</div>");
				out.println("</body></html>");
				}
			}catch(Exception ee){ee.printStackTrace();}
		}
		else{
				out.println("<html><body>");
				out.println("<div style='margin:50px auto; text-align:center; width:400px; height:200px; line-height:200px; border-radius:20px; background-color:red; color:red; box-shadow:0 0 10px black; font-size:20px;'> ");
				out.println("<p style='margin-top:50%; color:white; font-size:20px;'>You Already Voted</p>");
				out.println("<a href='election.jsp' style='text-align:center; width:180px; height:60px; line-height:60px; border-radius:10px; background-color:red; box-shadow:0 0 10px black; color:white; font-size:20px;'>Okay</a>");
				out.println("</div>");
				out.println("</body></html>");
		}
		}catch(Exception e){e.printStackTrace();}
	}
}