package com.contacts;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Delete extends HttpServlet{

	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		PrintWriter out = res.getWriter();
		int id = Integer.parseInt(req.getParameter("id"));
		
		String message = "Record deleted successfully";
		try 
		{	
			Connectdb conn = new Connectdb();
			Connection con = conn.service();
		
			PreparedStatement st = con.prepareStatement("delete from date where contact_id=?");
			st.setInt(1,id);
			int result = st.executeUpdate();
			
			PreparedStatement st1 = con.prepareStatement("delete from phone where contact_id=?");
			st1.setInt(1,id);
			result = st1.executeUpdate();
			
			PreparedStatement st2 = con.prepareStatement("delete from address where contact_id=?");
			st2.setInt(1,id);
			result = st2.executeUpdate();
			
			PreparedStatement st3 = con.prepareStatement("delete from contact where contact_id=?");
			st3.setInt(1,id);
			result = st3.executeUpdate();
			
			req.setAttribute("message", message);
			req.getRequestDispatcher("search.jsp").forward(req, res);
		}
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	}
		
}
