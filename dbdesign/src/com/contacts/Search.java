package com.contacts;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Search extends HttpServlet
{

	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
	{
		String search = req.getParameter("search");
		
		String[] keyword = search.split("\\s+");
		
		PrintWriter out = res.getWriter();

		
		Set<Integer> set = new HashSet<Integer>();
		
		try 
		{	
				Connectdb conn = new Connectdb();
				Connection con = conn.service();
				
				
		//=============================================SEARCH ON CONTACT TABLE===================================================
				
				PreparedStatement st = con.prepareStatement("select contact_id from contact where fname like ?");
				for(int i=0;i<keyword.length; i++) 
				{
					st.setString(1, "%"+ keyword[i] +"%");
					ResultSet rs = st.executeQuery();
					while(rs.next())
					{
						set.add(rs.getInt(1));
					}
				}
				
				PreparedStatement st1 = con.prepareStatement("select contact_id from contact where mname like ?");
				for(int i=0;i<keyword.length; i++) 
				{
					st1.setString(1, "%"+ keyword[i] +"%");
					ResultSet rs1 = st1.executeQuery();
					while(rs1.next())
					{
						set.add(rs1.getInt(1));
					}
				}
				
				PreparedStatement st2 = con.prepareStatement("select contact_id from contact where lname like ?");
				for(int i=0;i<keyword.length; i++) 
				{
					st2.setString(1, "%"+ keyword[i] +"%");
					ResultSet rs2 = st2.executeQuery();
					while(rs2.next())
					{
						set.add(rs2.getInt(1));
					}
				}
				
				
		//=============================================SEARCH ON ADDRESS TABLE===================================================

				
				PreparedStatement st3 = con.prepareStatement("select contact_id from address where address like ?");
				for(int i=0;i<keyword.length; i++) 
				{
					st3.setString(1, "%"+ keyword[i] +"%");
					ResultSet rs3 = st3.executeQuery();
					while(rs3.next())
					{
						set.add(rs3.getInt(1));
					}
				}
				
				PreparedStatement st4 = con.prepareStatement("select contact_id from address where city like ?");
				for(int i=0;i<keyword.length; i++) 
				{
					st4.setString(1, "%"+ keyword[i] +"%");
					ResultSet rs4 = st4.executeQuery();
					while(rs4.next())
					{
						set.add(rs4.getInt(1));
					}
				}
				
				PreparedStatement st5 = con.prepareStatement("select contact_id from address where state like ?");
				for(int i=0;i<keyword.length; i++) 
				{
					st5.setString(1, "%"+ keyword[i] +"%");
					ResultSet rs5 = st5.executeQuery();
					while(rs5.next())
					{
						set.add(rs5.getInt(1));
					}
				}
				
				
				PreparedStatement st6 = con.prepareStatement("select contact_id from address where zip like ?");
				for(int i=0;i<keyword.length; i++) 
				{
					st6.setString(1, "%"+ keyword[i] +"%");
					ResultSet rs6 = st6.executeQuery();
					while(rs6.next())
					{
						set.add(rs6.getInt(1));
					}
				}
				
		//=============================================SEARCH ON PHONE TABLE=====================================================
				
				PreparedStatement st7 = con.prepareStatement("select contact_id from phone where area_code like ?");
				for(int i=0;i<keyword.length; i++) 
				{
					st7.setString(1, "%"+ keyword[i] +"%");
					ResultSet rs7 = st7.executeQuery();
					while(rs7.next())
					{
						set.add(rs7.getInt(1));
					}
				}
				
				
				PreparedStatement st8 = con.prepareStatement("select contact_id from phone where number like ?");
				for(int i=0;i<keyword.length; i++) 
				{
					st8.setString(1, "%"+ keyword[i] +"%");
					ResultSet rs8 = st8.executeQuery();
					while(rs8.next())
					{
						set.add(rs8.getInt(1));
					}
				}
				
		//=============================================SEARCH ON DATE TABLE===================================================
				
				PreparedStatement st9 = con.prepareStatement("select contact_id from date where cast(date as char(10)) like ?");
				for(int i=0;i<keyword.length; i++) 
				{
					st9.setString(1, "%"+ keyword[i] +"%");
					ResultSet rs9 = st9.executeQuery();
					while(rs9.next())
					{
						set.add(rs9.getInt(1));
					}
				}

				
//				out.println(set);
				
				ArrayList<Integer> id = new ArrayList<>();
				ArrayList<String> name = new ArrayList<String>();
				
				for(int i : set)
				{
					PreparedStatement st10 = con.prepareStatement("select fname, mname, lname from contact where contact_id = ?");
					st10.setInt(1, i);
					ResultSet rs10 = st10.executeQuery();
					rs10.next();
					id.add(i);
					name.add(rs10.getString(1) + " " + rs10.getString(2) + " " + rs10.getString(3));
					
				}
//				out.println(id);
//				out.println(name);
				
				String heading = "Search Results";
				req.setAttribute("heading", heading);
				req.setAttribute("id", id);
				req.setAttribute("name", name);
				req.getRequestDispatcher("search.jsp").forward(req, res);
				
				

//				List<Integer> id = new List<Integer>();
//				ArrayList<String> fname = new ArrayList<String>();
//				ArrayList<String> mname = new ArrayList<String>();
//				ArrayList<String> lname = new ArrayList<String>();
//				
//				id.add(1);
//				fname.add("a");
//				mname.add("b");
//				lname.add("c");
//				
//				id.add(2);
//				fname.add("p");
//				mname.add("q");
//				lname.add("r");
//				
//				id.add(3);
//				fname.add("x");
//				mname.add("y");
//				lname.add("z");
//				
//				out.println(id[2]);
		
		}
		
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} 
	}

}
