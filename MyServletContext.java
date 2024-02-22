import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class MyServletContext implements ServletContextListener
{
	 // Connection con ;
	public void contextInitialized(ServletContextEvent e)
	{
		try
		{
			ServletContext ctx=e.getServletContext();
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/Online_Vote", "root", "sumit123");		
			ctx.setAttribute("connection",con);
		}
		catch(Exception ee){ee.printStackTrace();}
	}
	public void contextDestroyed(ServletContextEvent e)
	{
		try{
			// con.close();
		}catch(Exception ee){}
	}
}