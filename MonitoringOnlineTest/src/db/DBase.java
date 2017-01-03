package db;
import java.sql.*;
public class DBase {

	public static void main(String args[])
	{
	getCon();
	}
	public static Connection getCon()
	{
		Connection con=null;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","shreyansh");
			System.out.println("Connected successfully with db server");
		}catch (Exception e) {
			System.out.println(e);
			
		}
		return con;
	}
}
