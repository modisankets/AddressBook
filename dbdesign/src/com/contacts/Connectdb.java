package com.contacts;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;


import com.mysql.jdbc.Connection;

public class Connectdb{

	public Connection service()
	{
		
		String url = "jdbc:mysql://localhost:3306/contacts";
		String user = "root";
		String password = "Matangi@5991";
		Connection con = null;
		
		try 
		{
		Class.forName("com.mysql.jdbc.Driver");
		con = (Connection) DriverManager.getConnection(url, user, password);
		
		}
		
		catch (ClassNotFoundException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con;
		
		
		
		
	}
	
}
