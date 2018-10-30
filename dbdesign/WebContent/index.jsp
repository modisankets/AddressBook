<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<style>

		label { display: inline-block; width: 150px; text-align: right; }
	
	</style>
	
	<script type='text/javascript'>
		var address_rank = 1;
		var phone_rank = 1;
		var date_rank = 1;
		
		function addaddress()
		{
			bold = document.createElement('strong');
			textnode = document.createTextNode("Address " + (address_rank+1)); 
			bold.appendChild(textnode);
			container.appendChild(bold);
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
                        
            address_rank = address_rank + 1;
            document.getElementById("rank").value = address_rank;
             
            if(address_rank > 1)
        	{
        		document.getElementById("remove_address").disabled = false;
        	}
		}
		
		
		function removeaddress()
		{
			for (i=0;i<17;i++)
			{
                container.removeChild(container.lastChild);
			}
			address_rank = address_rank - 1;
			document.getElementById("rank").value = address_rank;
			
			if(address_rank < 2)
        	{
        		document.getElementById("remove_address").disabled = true;
        	}
		}
		
		
		function addphone()
		{
			bold = document.createElement('strong');
			textnode = document.createTextNode("Phone " + (phone_rank+1)); 
			bold.appendChild(textnode);
			phone_container.appendChild(bold);
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
            input.name = "number" + address_rank.toString();
            phone_container.appendChild(document.createTextNode("Number(in XXX-XXXX format): "));
            phone_container.appendChild(input);
            phone_container.appendChild(document.createElement("br"));
            
            
            phone_rank = phone_rank + 1;
            document.getElementById("rank1").value = phone_rank;
             
            if(phone_rank > 1)
           	{
           		document.getElementById("remove_phone").disabled = false;
           	}
		}
		
		
		function removephone()
		{
			for (i=0;i<11;i++)
			{
				phone_container.removeChild(phone_container.lastChild);
			}
			phone_rank = phone_rank - 1;
			document.getElementById("rank1").value = phone_rank;
			
			if(phone_rank < 2)
        	{
        		document.getElementById("remove_phone").disabled = true;
        	}
		}
		
		function adddate()
		{
			bold = document.createElement('strong');
			textnode = document.createTextNode("Date " + (date_rank+1)); 
			bold.appendChild(textnode);
			date_container.appendChild(bold);
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
            
            
            date_rank = date_rank + 1;
            document.getElementById("rank2").value = date_rank;
             
            if(date_rank > 1)
           	{
           		document.getElementById("remove_date").disabled = false;
           	}
            
		}
		
		
		function removedate()
		{
			for (i=0;i<8;i++)
			{
				date_container.removeChild(date_container.lastChild);
			}
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
	
	<h1 align="center" style="font-family:Arial">
	<strong>Add new contact</strong>
	</h1>
	<br>
	<h3 align="center">
	<a href="search.jsp" style="color:#bbbbbb">Search and Modify Contacts</a>
	</h3>
	
	<p style="color:green" align="center">
	${message}
	</p>
	
	<br>
	
	<div align="center">
	
		<form action='add'>
			
			
			<!--  personal info block -->
				<strong>Contact</strong><br><br>
				<label>First Name: </label><input type="text" name="first_name" maxlength="256"  required><br>
				<label>Middle Name: </label><input type="text" name="middle_name" maxlength="256" ><br>
				<label>Last name: </label><input type="text" name="last_name" maxlength="256" required><br>
			
			
			<!--  address block -->
				<br><hr><br>
				<strong>Address</strong><br><br>
				<label style="width:75px" >Type: </label>
				<select name="address_type0">
				  <option value="home">home</option>
				  <option value="work">work</option>
				</select>
				<br>
				<label>Street Address: </label><input type="text" name="address0" maxlength="256"><br>
				<label>city: </label><input type="text" name="city0" maxlength="128"><br>
				<label>State: </label><input type="text" name="state0" maxlength="128"><br>
				<label>zip: </label><input type="text" name="zip0" maxlength="5"><br>
				<br>
				<div id="container">
				</div>
				
				<input type="button" value = "Add Address" name="add_address" onclick = "addaddress()" ><br>
								
				<input type="button" value = "Remove Address" id="remove_address" name="remove_address" onclick = "removeaddress()" disabled><br>
				
		
				<input id="rank" type="hidden" name="rank" value="1" />

			<!--  phone block -->
				<br><hr><br>
				<strong>Phone</strong><br><br>
				<label style="width:75px">Type:</label>
				<select name="phone_type0">
				  <option value="home">home</option>
				  <option value="work">work</option>
				  <option value="cell">cell</option>
				</select>
				<br>
				<label>Area Code: </label><input type="text" name="area_code0" maxlength="3"><br>
				<label style="width:250px">Number (in XXX-XXXX format) : </label><input type="text" name="number0" maxlength="8"><br>
				
				<div id="phone_container">
				</div>
				
				<input type="button" value = "Add Phone" name="add_phone" onclick = "addphone()" ><br>
				
				<input type="button" value = "Remove Phone" id="remove_phone" name="remove_phone" onclick = "removephone()" disabled><br>
				
				<input id="rank1" type="hidden" name="rank1" value="1" />
				
			<!--  date block -->
				<br><hr><br>
				<strong>Date</strong><br><br>
				<label style="width:100px">Type:</label>
				<select name="date_type0">
				  <option value="birth">Birth date</option>
				  <option value="anniversary">Anniversary</option>
				</select>
				<br>
				<label style="width:200px">Date(yyyy-mm-dd): </label><input type="date" name="date0"><br> 
			
				<div id="date_container">
				</div>
				
				<input type="button" value = "Add date" name="add_date" onclick = "adddate()" ><br>
				
				<input type="button" value = "Remove Date" id="remove_date" name="remove_date()" onclick = "removedate()" disabled><br>
				
				<input id="rank2" type="hidden" name="rank2" value="1" />
			
			
			<!--  submit block -->
				<br><hr><br>
				<input type="submit" value="Add">
		
		</form>

	</div>
	
</body>
</html>