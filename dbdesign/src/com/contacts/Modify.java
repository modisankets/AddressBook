package com.contacts;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Modify extends HttpServlet{

	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		PrintWriter out = res.getWriter();
		
		String fname = req.getParameter("first_name");
		String mname = req.getParameter("middle_name");
		String lname = req.getParameter("last_name");
		int id = Integer.parseInt(req.getParameter("id"));
		
		int address_rank = Integer.parseInt(req.getParameter("rank"));
		int phone_rank = Integer.parseInt(req.getParameter("rank1"));
		int date_rank = Integer.parseInt(req.getParameter("rank2"));
		
//		out.println(address_rank);
//		out.println(phone_rank);
//		out.println(date_rank);
//		out.println();
//		out.println();
//		out.println();
		
//		for(var i = 0; i < address_rank ; i++) 
//		{
//			out.println(req.getParameter("address_type" + i));
//			out.println(req.getParameter("address" + i));
//			out.println(req.getParameter("city" + i));
//			out.println(req.getParameter("state" + i));
//			out.println(req.getParameter("zip" + i));
//			out.println();
//		}
//		out.println();
//		out.println();
//		
//		for(var i = 0; i < phone_rank ; i++) 
//		{
//			out.println(req.getParameter("phone_type" + i));
//			out.println(req.getParameter("area_code" + i));
//			out.println(req.getParameter("number" + i));
//			out.println();
//		}
//		out.println();
//		out.println();
//		
//		for(var i = 0; i < date_rank ; i++) 
//		{
//			out.println(req.getParameter("date_type" + i));
//			out.println(req.getParameter("date" + i));
//			out.println();
//		}
//		
		String message="Record updated successfully";
		
		try 
		{	
			Connectdb conn = new Connectdb();
			Connection con = conn.service();
			
			//---------------------------------------UPDATING CONTACT TABLE-----------------------------------------

			
			PreparedStatement st = con.prepareStatement("update contact set fname = ?, mname = ?, lname = ? where contact_id = ?");
			st.setString(1, fname);
			st.setString(2, mname);
			st.setString(3, lname);
			st.setInt(4, id);
			
			int result = st.executeUpdate();
		
			
			//---------------------------------------UPDATING ADDRESS TABLE-----------------------------------------

			PreparedStatement st1 = con.prepareStatement("delete from address where contact_id = ?");
			st1.setInt(1, id);
			int result1 = st1.executeUpdate();
			
			PreparedStatement st2 = con.prepareStatement("insert into address (contact_id, address_type, address, city, state, zip) values (?,?,?,?,?,?)");
			for(var i = 0; i < address_rank ; i++) 
			{
				st2.setInt(1, id);
				st2.setString(2, req.getParameter("address_type" + i));
				st2.setString(3, req.getParameter("address" + i));
				st2.setString(4, req.getParameter("city" + i));
				st2.setString(5, req.getParameter("state" + i));
				st2.setString(6, req.getParameter("zip" + i));
				
				int result_address = st2.executeUpdate();
				
			}
			
			//---------------------------------------UPDATING PHONE TABLE-----------------------------------------

			PreparedStatement st3 = con.prepareStatement("delete from phone where contact_id = ?");
			st3.setInt(1, id);
			int result2 = st3.executeUpdate();
			
			PreparedStatement st4 = con.prepareStatement("insert into phone (contact_id, phone_type, area_code, number) values (?,?,?,?)");
			for(var i = 0; i < phone_rank ; i++) 
			{
				st4.setInt(1, id);
				st4.setString(2, req.getParameter("phone_type" + i));
				st4.setString(3, req.getParameter("area_code" + i));
				st4.setString(4, req.getParameter("number" + i));

				
				int result_phone = st4.executeUpdate();
				
			}
			
			//---------------------------------------UPDATING DATE TABLE-----------------------------------------

			PreparedStatement st5 = con.prepareStatement("delete from date where contact_id = ?");
			st5.setInt(1, id);
			int result3 = st5.executeUpdate();
			
			PreparedStatement st6 = con.prepareStatement("insert into date (contact_id, date_type, date) values (?,?,?)");
			for(var i = 0; i < date_rank ; i++) 
			{
				st6.setInt(1, id);
				st6.setString(2, req.getParameter("date_type" + i));
				st6.setString(3, req.getParameter("date" + i));
				
				int result_date = st6.executeUpdate();
				
			}
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
