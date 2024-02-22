import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.oreilly.servlet.*;

public class AddCandidate extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();

		String path = getServletContext().getRealPath("image");
        MultipartRequest mpr = new MultipartRequest(req, path, 500 * 1024 * 1024);
        String path1 = mpr.getOriginalFileName("img");
        String path2 = path + "/" + path1;
        FileInputStream fis = new FileInputStream(path2);

        String idS=mpr.getParameter("id");
        int id=Integer.parseInt(idS);
		String eleName=mpr.getParameter("election");
		String name=mpr.getParameter("name");
		String partyName=mpr.getParameter("party");
		String address=mpr.getParameter("address");
		String phone=mpr.getParameter("phone");

		
        
        try{
        	Class.forName("com.mysql.jdbc.Driver");
		    Connection con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/Online_Vote", "root", "sumit123");	

		    Statement stmt=con.createStatement();
		    ResultSet rs=stmt.executeQuery("select * from candidates where id = '"+id+"'");

		    if(!rs.next()){

	            PreparedStatement ps=con.prepareStatement("insert into candidates(id,electionName,candidateName,party,address,phone,img,nV) values(?,?,?,?,?,?,?,?)");
		    	
		    	ps.setInt(1,id);
				ps.setString(2,eleName);
	            ps.setString(3, name);
	            ps.setString(4, partyName);
	            ps.setString(5, address);
	            ps.setString(6, phone);
				
	            ps.setBinaryStream(7, fis,(int)fis.available());
	            ps.setInt(8, 0);

	            ps.executeUpdate();
				con.close();
				out.println("<html><body>");
				out.println("<div style='margin:50px auto; text-align:center; width:400px; height:200px; line-height:200px; border-radius:20px; background-color:#2525d5; color:red; box-shadow:0 0 10px black; font-size:20px;'> ");
				out.println("<p style='margin-top:50%; color:white; font-size:20px;'>Candidate Added Successfully</p>");
				out.println("<a href='addCand.jsp' style='text-align:center; width:180px; height:60px; line-height:60px; border-radius:10px; background-color:#000482; box-shadow:0 0 10px black; color:white; font-size:20px;'>Okay</a>");
				out.println("</div>");
				out.println("</body></html>");
			}
			else{
				out.println("<html><body>");
				out.println("<div style='margin:50px auto; text-align:center; width:400px; height:200px; line-height:200px; border-radius:20px; background-color:red; color:red; box-shadow:0 0 10px black; font-size:20px;'> ");
				out.println("<p style='margin-top:50%; color:white; font-size:20px;'>This ID Already Exists</p>");
				out.println("<a href='addCand.jsp' style='text-align:center; width:180px; height:60px; line-height:60px; border-radius:10px; background-color:red; box-shadow:0 0 10px black; color:white; font-size:20px;'>Okay</a>");
				out.println("</div>");
				out.println("</body></html>");
			}
			}
			catch(Exception e)
			{	out.println(e);
				e.printStackTrace();}
			
	}
}