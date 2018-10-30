package com.contacts;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class Fetch extends HttpServlet{

	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		
		PrintWriter out = res.getWriter();
		int id = Integer.parseInt(req.getParameter("id"));
		req.setAttribute("id", id);
		
		try 
		{	
			Connectdb conn = new Connectdb();
			Connection con = conn.service();
			
			
		//=========================================FETCHING CONTACT===============================================
		
			String fname = null;
			String mname = null;
			String lname = null;
			
			PreparedStatement st = con.prepareStatement("select fname, mname, lname from contact where contact_id = ?");
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			rs.next();
			req.setAttribute("fname", rs.getString(1));
			req.setAttribute("mname", rs.getString(2));
			req.setAttribute("lname", rs.getString(3));
			
			
		//=========================================FETCHING ADDRESS===============================================
	
			
			List<String> address_type = new ArrayList<String>();
			List<String> address = new ArrayList<String>();
			List<String> city = new ArrayList<String>();
			List<String> state = new ArrayList<String>();
			List<String> zip = new ArrayList<String>();
			
			PreparedStatement st1 = con.prepareStatement("select address_type, address, city, state, zip from address where contact_id = ?");
			st1.setInt(1, id);
			ResultSet rs1 = st1.executeQuery();
			
			while(rs1.next())
			{
				address_type.add(rs1.getString(1));
				address.add(rs1.getString(2));
				city.add(rs1.getString(3));
				state.add(rs1.getString(4));
				zip.add(rs1.getString(5));
			}
			
			req.setAttribute("address_size", address_type.size());
			req.setAttribute("address_type", address_type);
			req.setAttribute("address", address);
			req.setAttribute("state", state);
			req.setAttribute("city", city);
			req.setAttribute("zip", zip);
	
	
		//=========================================FETCHING PHONE===============================================
	
			
			List<String> phone_type = new ArrayList<String>();
			List<String> area_code = new ArrayList<String>();
			List<String> number = new ArrayList<String>();
			
			PreparedStatement st2 = con.prepareStatement("select phone_type, area_code, number from phone where contact_id = ?");
			st2.setInt(1, id);
			ResultSet rs2 = st2.executeQuery();
			
			while(rs2.next())
			{
				phone_type.add(rs2.getString(1));
				area_code.add(rs2.getString(2));
				number.add(rs2.getString(3));
			}
			
			
			req.setAttribute("phone_size", phone_type.size());
			req.setAttribute("phone_type", phone_type);
			req.setAttribute("area_code", area_code);
			req.setAttribute("number", number);
	
			
		//=========================================FETCHING DATE===============================================
	
			
			List<String> date_type = new ArrayList<String>();
			List<String> date = new ArrayList<String>();
			
			PreparedStatement st3 = con.prepareStatement("select date_type, cast(date as char(10)) from date where contact_id = ?");
			st3.setInt(1, id);
			ResultSet rs3 = st3.executeQuery();
			
			while(rs3.next())
			{
				date_type.add(rs3.getString(1));
				date.add(rs3.getString(2));
			}
			
			
			req.setAttribute("date_size", date_type.size());
			req.setAttribute("date_type", date_type);
			req.setAttribute("date", date);
			
			req.getRequestDispatcher("modify.jsp").forward(req, res);
		}
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} 
		
	}
}
