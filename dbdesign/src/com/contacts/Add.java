package com.contacts;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;  
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Add extends HttpServlet 
{

	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
	{
		String fname = req.getParameter("first_name");
		String mname = req.getParameter("middle_name");
		String lname = req.getParameter("last_name");
		
		PrintWriter out = res.getWriter();
		//out.println(fname);
		
		int address_rank = Integer.parseInt(req.getParameter("rank"));
		int phone_rank = Integer.parseInt(req.getParameter("rank1"));
		int date_rank = Integer.parseInt(req.getParameter("rank2"));

		//Date date1=new SimpleDateFormat("yyyy/MM/dd").parse(req.getParameter("date1"));
		//out.println(date1);
		
		//out.println(req.getParameter("address[1]"));
		//int i = 1;
		//String s = null;
		//out.println(s);
//		String t = null;
		//int i = 1;
//		for(var i = 1; i < address_rank ; i++) 
//		{
//			out.println(req.getParameter("address" + i));
//		
//		}
	
		String message="";
	
		try 
		{	
		Connectdb conn = new Connectdb();
		Connection con = conn.service();
		
		//---------------------------------------INSERTION IN CONTACT TABLE-----------------------------------------
		
		PreparedStatement st = con.prepareStatement("insert into contact (fname, mname, lname) values (?,?,?)");
		st.setString(1, fname);
		st.setString(2, mname);
		st.setString(3, lname);
		
		
//		Statement t = con.createStatement();
//		int x = t.executeUpdate("insert into date (contact_id, date_type, date) values (2, 'anniversary', '1995-03-02')");
		
		int result = st.executeUpdate();
		
		
		
		Statement fk = con.createStatement();
		ResultSet rs = st.executeQuery("select contact_id from contact order by contact_id desc limit 1");
		rs.next();
		int key = rs.getInt(1);		
		
		//---------------------------------------INSERTION IN ADDRESS TABLE-----------------------------------------
		
		
		
		PreparedStatement st1 = con.prepareStatement("insert into address (contact_id, address_type, address, city, state, zip) values (?,?,?,?,?,?)");
		for(var i = 0; i < address_rank ; i++) 
		{
			
			if(req.getParameter("address" + i)=="" && req.getParameter("city" + i)=="" && req.getParameter("state" + i)=="" && req.getParameter("zip" + i)=="")
			{
				continue;
			}
			
			st1.setInt(1, key);
			st1.setString(2, req.getParameter("address_type" + i));
			st1.setString(3, req.getParameter("address" + i));
			st1.setString(4, req.getParameter("city" + i));
			st1.setString(5, req.getParameter("state" + i));
			st1.setString(6, req.getParameter("zip" + i));
			
			
			int result_address = st1.executeUpdate();
			
		}
		
		
		//---------------------------------------INSERTION IN PHONE TABLE-----------------------------------------

		PreparedStatement st2 = con.prepareStatement("insert into phone (contact_id, phone_type, area_code, number) values (?,?,?,?)");
		for(var i = 0; i < phone_rank ; i++) 
		{
			if(req.getParameter("area_code" + i)=="" && req.getParameter("number" + i)=="")
			{
				continue;
			}
			
			st2.setInt(1, key);
			st2.setString(2, req.getParameter("phone_type" + i));
			st2.setString(3, req.getParameter("area_code" + i));
			st2.setString(4, req.getParameter("number" + i));

			
			int result_phone = st2.executeUpdate();
			
		}
		
		
		
		//---------------------------------------INSERTION IN DATE TABLE-----------------------------------------

		PreparedStatement st3 = con.prepareStatement("insert into date (contact_id, date_type, date) values (?,?,?)");
		for(var i = 0; i < date_rank ; i++) 
		{
			st3.setInt(1, key);
			st3.setString(2, req.getParameter("date_type" + i));
			if(req.getParameter("date" + i) == "")
			{
				st3.setString(3, "2050-12-12");
			}
			else
			{
				st3.setString(3, req.getParameter("date" + i));
			}
			
			int result_date = st3.executeUpdate();
			
		}
		
//		PreparedStatement st4 = con.prepareStatement("delete from address where zip=0");
//		int x = st4.executeUpdate();
//		
//		PreparedStatement st5 = con.prepareStatement("delete from phone where area_code=0");
//		x = st5.executeUpdate();
		
		PreparedStatement st6 = con.prepareStatement("delete from date where date='2050-12-12'");
		int x = st6.executeUpdate();
		
		
		message = "Record added successfully";
		
		//PrintWriter out = res.getWriter();
		//out.println("record added successfully");
		
		}
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} 
		req.setAttribute("message", message);
		req.getRequestDispatcher("index.jsp").forward(req, res);
		
		//PrintWriter out = res.getWriter();
		//out.println(address2);
		//out.println(address_rank);
		//out.println(phone_rank);
		//out.println(date_rank);
		
	/*
		try 
		{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, password);
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from t1");
		rs.next();
		rs.next();
		String s1 = rs.getString("b");
		PrintWriter out2 = res.getWriter();
		out2.println(s1);
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
		
	*/
		
		
	}
}
