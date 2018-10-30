<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script type='text/javascript'>
		
		var address_rank;
		var phone_rank;
		var date_rank;
		
		function addaddress()
		{	
			address_rank = parseInt(document.getElementById("rank").value);
			container.appendChild(document.createTextNode("Address " + (address_rank + 1)));
			container.appendChild(document.createElement("br"));
			container.appendChild(document.createElement("br"));
			
			var address_types = ["home","work"];
			var input = document.createElement("select");
			input.name = "address_type" + address_rank.toString();
			container.appendChild(document.createTextNode("Address Type: "));
			container.appendChild(input);
			
			for (var i = 0; i < address_types.length; i++) 
			{
			    var option = document.createElement("option");
			    option.value = address_types[i];
			    option.text = address_types[i];
			    input.add(option);
			}
			
			container.appendChild(document.createElement("br"));
			
			var input = document.createElement("input");
            input.type = "text";
            input.name = "address" + address_rank.toString();
            container.appendChild(document.createTextNode("Address: "));
            container.appendChild(input);
            container.appendChild(document.createElement("br"));
            
            var input = document.createElement("input");
            input.type = "text";
            input.name = "city" + address_rank.toString();
            container.appendChild(document.createTextNode("City: "));
            container.appendChild(input);
            container.appendChild(document.createElement("br"));
            
            var input = document.createElement("input");
            input.type = "text";
            input.name = "state" + address_rank.toString();
            container.appendChild(document.createTextNode("State: "));
            container.appendChild(input);
            container.appendChild(document.createElement("br"));
            
            var input = document.createElement("input");
            input.type = "text";
            input.name = "zip" + address_rank.toString();
            container.appendChild(document.createTextNode("zip: "));
            container.appendChild(input);
            container.appendChild(document.createElement("br"));
			container.appendChild(document.createElement("br"));
			container.appendChild(document.createElement("br"));

            address_rank = address_rank + 1;
            document.getElementById("rank").value = address_rank;
            
            if(address_rank > 0)
        	{
        		document.getElementById("remove_address").disabled = false;
        	}
		}
		
		function removeaddress()
		{
			for (i=0;i<20;i++)
			{
                container.removeChild(container.lastChild);
			}
			address_rank = parseInt(document.getElementById("rank").value);
			address_rank = address_rank - 1;
			document.getElementById("rank").value = address_rank; 
			
			if(address_rank < 2)
        	{
        		document.getElementById("remove_address").disabled = true;
        	}
		}
		
		function addphone()
		{
			phone_rank = parseInt(document.getElementById("rank1").value);
			phone_container.appendChild(document.createTextNode("Phone " + (phone_rank+1)));
			phone_container.appendChild(document.createElement("br"));
            phone_container.appendChild(document.createElement("br"));

			var phone_types = ["home","work","cell"];
			var input = document.createElement("select");
			input.name = "phone_type" + phone_rank.toString();
			phone_container.appendChild(document.createTextNode("Phone Type: "));
			phone_container.appendChild(input);
			
			for (var i = 0; i < phone_types.length; i++) 
			{
			    var option = document.createElement("option");
			    option.value = phone_types[i];
			    option.text = phone_types[i];
			    input.add(option);
			}
			phone_container.appendChild(document.createElement("br"));
			
			
			var input = document.createElement("input");
            input.type = "text";
            input.name = "area_code" + phone_rank.toString();
            phone_container.appendChild(document.createTextNode("Area Code: "));
            phone_container.appendChild(input);
            phone_container.appendChild(document.createElement("br"));
            
            var input = document.createElement("input");
            input.type = "text";
            input.name = "number" + phone_rank.toString();
            phone_container.appendChild(document.createTextNode("Number(XXX-XXXX): "));
            phone_container.appendChild(input);
            phone_container.appendChild(document.createElement("br"));
            phone_container.appendChild(document.createElement("br"));
            phone_container.appendChild(document.createElement("br"));
            
            
            phone_rank = phone_rank + 1;
            document.getElementById("rank1").value = phone_rank;
            
            if(phone_rank > 0)
           	{
           		document.getElementById("remove_phone").disabled = false;
           	}
		}
		
		function removephone()
		{
			for (i=0;i<14;i++)
			{
				phone_container.removeChild(phone_container.lastChild);
			}
			phone_rank = parseInt(document.getElementById("rank1").value);
			phone_rank = phone_rank - 1;
			document.getElementById("rank1").value = phone_rank;
			
			if(phone_rank < 2)
        	{
        		document.getElementById("remove_phone").disabled = true;
        	}
			
		}
		
		function adddate()
		{
			date_rank = parseInt(document.getElementById("rank2").value);
			date_container.appendChild(document.createTextNode("Date " + (date_rank+1)));
			date_container.appendChild(document.createElement("br"));
            date_container.appendChild(document.createElement("br"));

			var date_types = ["birth","anniversary"];
			var input = document.createElement("select");
			input.name = "date_type" + date_rank.toString();
			date_container.appendChild(document.createTextNode("Date Type: "));
			date_container.appendChild(input);
			
			for (var i = 0; i < date_types.length; i++) 
			{
			    var option = document.createElement("option");
			    option.value = date_types[i];
			    option.text = date_types[i];
			    input.add(option);
			}
			date_container.appendChild(document.createElement("br"));
			
			
			var input = document.createElement("input");
            input.type = "date";
            input.name = "date" + date_rank.toString();
            date_container.appendChild(document.createTextNode("Date(yyyy-mm-dd): "));
            date_container.appendChild(input);
            date_container.appendChild(document.createElement("br"));
            date_container.appendChild(document.createElement("br"));
            date_container.appendChild(document.createElement("br"));

            
            date_rank = date_rank + 1;
            document.getElementById("rank2").value = date_rank;

            if(date_rank > 0)
           	{
           		document.getElementById("remove_date").disabled = false;
           	}
		}
		
		function removedate()
		{
			
			for (i=0;i<11;i++)
			{
				date_container.removeChild(date_container.lastChild);
			} 
			date_rank = parseInt(document.getElementById("rank2").value);
			date_rank = date_rank - 1;
			document.getElementById("rank2").value = date_rank;
			
			if(date_rank < 2)
        	{
        		document.getElementById("remove_date").disabled = true;
        	}
			
		}
	
	</script>

</head>
<body style="font-family:Arial; background-color:#ffffff; color:#555555">
	
	<h1 align="center">
	Modify contact
	</h1>
	<br>
	<br>
	
	<p style="color:green" align="center">
	${message}
	</p>
	
	<div align="center">
		
		<form action='modify'>
			
			<!--  ============================ personal info block ============================ -->
			
				<input type="hidden" name="id" value='${id}' ><br>
				First Name: <input type="text" name="first_name" maxlength="256" value='${fname}' ><br>
				Middle Name: <input type="text" name="middle_name" maxlength="256" value='${mname}'><br>
				Last Name: <input type="text" name="last_name" maxlength="256" value='${lname}'><br>
				<br>
				<hr>
				
			<!-- ============================ address block ============================ -->
				<div id="container">
				<c:choose>
					<c:when test="${address_size eq 0}">
						No address saved!
						<br>
					</c:when>
					<c:otherwise>
						<c:forEach items="${address_type}" var="item" varStatus="count">
							<br>
							Address ${count.index+1}
							<br>
							<c:choose>
								<c:when test="${item.equals('home')}">
									Address Type: 
									<select name="address_type${count.index}" >
									  <option value="home" selected>home</option>
									  <option value="work">work</option>
									</select>
									<br>
								</c:when>
								<c:when test="${item.equals('work')}">
									Address Type: 
									<select name="address_type${count.index}" >
									  <option value="home" >home</option>
									  <option value="work" selected>work</option>
									</select>
									<br>
								</c:when>
							</c:choose>
							Address: <input type="text" name="address${count.index}" maxlength="256" value='${address[count.index]}' ><br>
							City: <input type="text" name="city${count.index}" maxlength="256" value='${city[count.index]}' ><br>
							State: <input type="text" name="state${count.index}" maxlength="256" value='${state[count.index]}' ><br>
							ZIP: 
							<%-- <c:choose>
								<c:when test="${zip[count.index] eq ''}">
									<input type="text" name="zip${count.index}" maxlength="5" ><br>
								</c:when>
								<c:otherwise> --%>
									<input type="text" name="zip${count.index}" maxlength="5" value="${zip[count.index]}"><br>
								<%-- </c:otherwise>
							</c:choose>  --%>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
				
				</div>
				
				<input type="button" value = "Add Address" name="add_address" onclick = "addaddress()" ><br>
				
				<input type="button" value = "Remove Address" name="remove_address" id="remove_address" onclick = "removeaddress()" disabled><br>
				
				
				<input id="rank" type="hidden" name="rank" value='${address_size}' />
				
				<br>
				<hr>
			
			<!-- ============================ phone block ============================ -->
			
				<div id="phone_container">
				<c:choose>
					<c:when test="${phone_size eq 0}">
						No phone saved!
						<br>
					</c:when>
					<c:otherwise>
						<c:forEach items="${phone_type}" var="item" varStatus="count">
							<br>
							Phone ${count.index+1}
							<br>
							<c:choose>
								<c:when test="${item.equals('home')}">
									Phone Type: 
									<select name="phone_type${count.index}" >
									  <option value="home" selected>home</option>
									  <option value="work">work</option>
									  <option value="cell">cell</option>
									</select>
									<br>
								</c:when>
								<c:when test="${item.equals('work')}">
									Phone Type: 
									<select name="phone_type${count.index}" >
									  <option value="home" >home</option>
									  <option value="work" selected>work</option>
									  <option value="cell" >cell</option>
									</select>
									<br>
								</c:when>
								<c:otherwise>
									Phone Type: 
									<select name="phone_type${count.index}" >
									  <option value="home" >home</option>
									  <option value="work" >work</option>
									  <option value="cell" selected>cell</option>
									</select>
									<br>
								</c:otherwise>
							</c:choose>
							Area Code: <input type="text" name="area_code${count.index}" maxlength="3" value='${area_code[count.index]}' ><br>
							Number(XXX-XXXX): <input type="text" name="number${count.index}" maxlength="8" value='${number[count.index]}' ><br>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
				
				</div>
				
				<input type="button" value = "Add Phone" name="add_phone" onclick = "addphone()" ><br>
				
				<input type="button" value = "Remove Phone" name="remove_phone" id="remove_phone" onclick = "removephone()" disabled><br>
				
				<input id="rank1" type="hidden" name="rank1" value='${phone_size}' />	
					
				<br>
				<hr>
				
			<!-- ============================ date block ============================ -->
				
				<div id="date_container">
					<c:choose>
						<c:when test="${date_size eq 0}">
							No dates saved!
							<br>
						</c:when>
						<c:otherwise>
							<c:forEach items="${date_type}" var="item" varStatus="count">
								<br>
								Date ${count.index+1}
								<br>
								<c:choose>
									<c:when test="${item.equals('birth')}">
										Date Type: 
										<select name="date_type${count.index}" id="date_type${count.index}">
										  <option value="birth" selected>Birth Date</option>
										  <option value="anniversary">Anniversary</option>
										</select>
										<br>
									</c:when>
									<c:when test="${item.equals('anniversary')}">
										Date Type: 
										<select name="date_type${count.index}" id="date_type${count.index}">
										  <option value="birth" >Birth Date</option>
										  <option value="anniversary" selected>Anniversary</option>
										</select>
										<br>
									</c:when>
								</c:choose>
								Date(yyyy-mm-dd): <input type="text" name="date${count.index}" id="date${count.index}" maxlength="10" value='${date[count.index]}' ><br>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					
				
				</div>
				
				<input type="button" value = "Add date" name="add_date" onclick = "adddate()" ><br>
				
				<input type="button" value = "Remove Date" name="remove_date()" id="remove_date" onclick = "removedate()" disabled><br>
				
				<input id="rank2" type="hidden" name="rank2" value='${date_size}' />
				
				<br>
				<hr>
				
				<br>
				<input type="submit" value="Modify">
		</form>
	
	
	</div>
	
</body>
</html>