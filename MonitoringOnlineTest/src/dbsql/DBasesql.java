package dbsql;
import java.sql.*;
public class DBasesql {
	
	public static void main(String args[])
	{
	getCon();
	}
	public static Connection getCon()
	{
		Connection con=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/monitoringquiz","root",""); 
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return con;
	}
			
}
