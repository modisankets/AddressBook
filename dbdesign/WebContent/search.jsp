<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 	<script type='text/javascript'>
		
		function modify(id)
		{
			
		}
		
	</script> -->

</head>
<body style="font-family:Arial; background-color:#ffffff; color:#555555">
  
  	<h1 align="center">
	Search and Modify Contacts
	</h1>
	<br>
	<br>
	<h3 align="center">
	<a href="index.jsp">Add New Contact</a>
	</h3>
	
	<div align="center">
	
		<form action='search'>
			<br>
			<br>
			
			Enter keywords:
			<input type ="text" name="search">
			
			<br>
			<br>
			
			<input type="submit" value="Search">
					
		
		</form>
		
	</div>
	
	<p align="center" style="color:green">
		${message}
	</p>
	
	<p align="center">
	
		<h3 align="center">
		${heading}
		</h3>
		
		<table align="center">
		    <c:forEach items="${name}" var="item" varStatus="count">
		        <tr>
		        		<input type="hidden" name="id" value=""/>
			            <td>${count.index + 1}</td>
			            <td></td>
			            <td>${id[count.index]}</td>
			            <td></td>
			            <td>${item}</td>
			            <td><button onclick="window.location.href='fetch?id=${id[count.index]}'">Modify</button></td>
			            <td><button onclick="window.location.href='delete?id=${id[count.index]}'">Delete</button></td>
		        </tr>
		    </c:forEach>
		</table> 
	
	</p>
	
	<p id="test1">
	
	</p>


</body>

</html>