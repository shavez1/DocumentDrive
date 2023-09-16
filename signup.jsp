<!DOCTYPE HTML>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>Document Drive</title>

	<script>
		var request;

		function sendinfo1()
		{
			var x = document.myform.loginname.value;
			var url = "searchlogin.jsp?t1="+x;

			if(window.XMLHttpRequest)
			{  
				request = new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject)
			{  
				request = new ActiveXObject("Microsoft.XMLHTTP");  
			}

			try
			{
				request.onreadystatechange = getinfo1;  
				request.open("GET",url,true);  
				request.send(); 
			}
			catch(e)
			{
				alert("Unable to connect to server");
			}
		}
		function getinfo1()
		{
			if(request.readyState==4)
			{  
				var val = request.responseText;  
				document.getElementById('amit').innerHTML = val;  
			} 
		}

		function strength()
		{
			var x = document.myform.password.value;
			if(x.length < 5)
			{
				document.getElementById('kamal').innerHTML = "weak";  
			}
			else if(x.length >=5 && x.length<8)
			{
				document.getElementById('kamal').innerHTML = "good";  
			}
			else			
			{
				document.getElementById('kamal').innerHTML = "strong";  
			}
		}

		function confirm()
		{
			var x = document.myform.password.value;
			var y = document.myform.confirmpassword.value;
			if(x==y)
			{
				document.getElementById('deepak').innerHTML = "password matched";  
			}
			else
			{
				document.getElementById('deepak').innerHTML = "password not matched";  
			}
		}

		function checkmobile(obj)
		{
			str="0123456789-"
        		l = obj.value.length;
			if(l<=10)
			{
	        		for(i=0;i<=l;i++)
	        		{
        			if(str.indexOf(obj.value.charAt(i))==-1)
         			{
          				alert("Please Enter Valid Mobile Number.");
          				obj.value="";
          				obj.focus();
          				return false;
         			}
				}
			}
			else
			{
				alert("Mobile Number Must be of 10 Digits");
				obj.value="";
          			obj.focus();
          			return false;
			}
        		return true;
		}

		function checkform()
		{
			if(myform.loginname.value == "")
			{
      				alert("Error: Login Name cannot be blank!");
      				myform.loginname.focus();
      				return false;
    			}

			if(myform.password.value != "" && myform.password.value == myform.confirmpassword.value)
			{
	      			if(myform.password.value.length < 6)
				{
	        			alert("Error: Password must contain at least six characters!");
	        			myform.password.focus();
	        			return false;
	      			}
	      			if(myform.password.value == myform.firstname.value || myform.password.value == myform.loginname.value)
				{
	        			alert("Error: Password must be different from FirstName and LoginName!");
	        			myform.password.focus();
        				return false;
      				}
      	
				re = /[0-9]/;
      				if(!re.test(myform.password.value))
				{
        				alert("Error: password must contain at least one number (0-9)!");
       					myform.password.focus();
        				return false;
      				}
      				re = /[a-z]/;
      				if(!re.test(myform.password.value))
				{
        				alert("Error: password must contain at least one lowercase letter (a-z)!");
        				myform.password.focus();
        				return false;
      				}
	      			re = /[A-Z]/;
	      			if(!re.test(myform.password.value))
				{
	        			alert("Error: password must contain at least one uppercase letter (A-Z)!");
	        			myform.password.focus();
	        			return false;
	      			}
    			}
			else
			{
      				alert("Error: Please check that you've entered and confirmed your password!");
      				myform.password.focus();
      				return false;
    			}

			if(myform.firstname.value == "")
			{
      				alert("Error: First Name cannot be blank!");
      				myform.firstname.focus();
      				return false;
    			}

			if(myform.lastname.value == "")
			{
      				alert("Error: Last Name cannot be blank!");
      				myform.lastname.focus();
      				return false;
    			}

			if(myform.gender.value.length == 0)
			{
      				alert("Error: Gender cannot be blank!");
      				return false;
    			}

			if(myform.dob.value == "")
			{
      				alert("Error: DOB cannot be blank!");
      				myform.dob.focus();
      				return false;
    			}

			if(myform.address.value == "")
			{
      				alert("Error: Address cannot be blank!");
      				myform.address.focus();
      				return false;
    			}
			
			if(myform.state.value == "")
			{
      				alert("Error: State cannot be blank!");
      				myform.state.focus();
      				return false;
    			}

			if(myform.mobile.value == "")
			{
      				alert("Error: Mobile cannot be blank!");
      				myform.mobile.focus();
      				return false;
    			}

			if(myform.email.value == "")
			{
      				alert("Error: Email cannot be blank!");
      				myform.email.focus();
      				return false;
    			}
		}
	</script>

</head>

<body>
<div id="container">
	
	<div id="header">
        	<h1>Document<span class="off">Drive.com</span></h1>
            	<h2>Provide Your Documents Anywhere</h2>
        </div>   
        
        <div id="menu">
        	<ul>
            	<li class="menuitem"><a href="index.html">Home</a></li>
                <li class="menuitem"><a href="login.jsp">Login</a></li>
                <li class="menuitem"><a href="signup.jsp">SignUp</a></li>
              	<li class="menuitem"><a href="getdocument.jsp">Download Documents</a></li>
              	<li class="menuitem"><a href="contact.html">Contact</a></li>
            	</ul>
        </div>
        
        <div id="content2">
               	<div id="content_top"></div>
        	<div id="content_main1">

		<table>
		<form name="myform" action="adduser.jsp" method="post" onsubmit="return checkform()">
			<tr>
				<td colspan="1" style="font-weight: bold; font-size: 18px; color:blue"><u>Login Details</u></td>
			</tr>
			<tr>
				<td style="font-size: 15px; font-weight: bold;">Choose Login Name</td><td width="70%"><input onkeyup="sendinfo1()" size="24" type="text" name="loginname"></input>&nbsp;&nbsp;<span style="font-size: 13px; color:red" id="amit"></span></td>
			<tr>

			<tr>
				<td style="font-size: 15px; font-weight: bold;">Choose Password</td><td><input onkeyup="strength()" size="24" type="password" name="password"></input>&nbsp;&nbsp;<span style="font-size: 13px; color:red" id="kamal"></span></td>
			<tr>
			
			<tr>
				<td style="font-size: 15px; font-weight: bold;">Confirm Password</td><td><input onkeyup="confirm()" size="24" type="password" name="confirmpassword"></input>&nbsp;&nbsp;<span style="font-size: 13px; color:red" id="deepak"></span></td>
			<tr>

			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
		
					
			<tr>
				<td colspan="1" style="font-weight: bold; font-size: 18px; color:blue"><u>Personal Details</u></td>
			</tr>
			
			<tr>
				<td style="font-size: 15px; font-weight: bold;">First Name</td><td><input size="24" type="text" name="firstname"></input></td>
			<tr>		
			<tr>
				<td style="font-size: 15px; font-weight: bold;">Last Name</td><td><input size="24" type="text" name="lastname"></input></td>
			<tr>		
			<tr>
				<td style="font-size: 15px; font-weight: bold;">Gender</td><td style="font-size: 15px; font-weight: bold;"><input type="radio" name="gender" value="male">&nbsp;Male</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="female">&nbsp;Female</input></td>
			<tr>		
			<tr>
				<td style="font-size: 15px; font-weight: bold;">Date of Birth</td><td><input style="font-size: 1rem" type="date" name="dob"></input></td>
			<tr>
			<tr>
				<td style="font-size: 15px; font-weight: bold;">House Address</td><td><textarea rows="3" cols="25" name="address"></textarea></td>
			<tr>		
			<tr>
				<td style="font-size: 15px; font-weight: bold;">State/Union Territory</td><td><select name="state">
<optgroup label="States" style="font-family:arial; font-size:18px; color:magenta"></optgroup>
<option>Andra Pradesh</option>
<option>Arunachal Pradesh</option>
<option>Assam</option>
<option>Bihar</option>
<option>Chhattisgarh</option>
<option>Goa</option>
<option>Gujarat</option>
<option>Haryana</option>
<option>Himachal Pradesh</option>
<option>Jammu and Kashmir</option>
<option>Jharkhand</option>
<option>Karnataka</option>
<option>Kerala</option>
<option>Madya Pradesh</option>
<option>Maharashtra</option>
<option>Manipur</option>
<option>Meghalaya</option>
<option>Mizoram</option>
<option>Nagaland</option>
<option>Orissa</option>
<option>Punjab</option>
<option>Rajasthan</option>
<option>Sikkim</option>
<option>Tamil Nadu</option>
<option>Tripura</option>
<option>Uttaranchal</option>
<option>Uttar Pradesh</option>
<option>West Bengal</option>			
<optgroup label="Union Territories" style="font-family:arial; font-size:18px; color:magenta"></optgroup>
<option>Andaman and Nicobar Islands</option>
<option>Chandigarh</option>
<option>Dadar and Nagar Haveli</option>
<option>Daman and Diu</option>
<option>Delhi</option>
<option>Lakshadeep</option>
<option>Pondicherry</option>

			</select></td>
			<tr>		
			<tr>
				<td style="font-size: 15px; font-weight: bold;">Mobile Number</td><td><input onkeyup="checkmobile(this)" size="24" type="text" name="mobile"></input></td>
			<tr>		
			<tr>
				<td style="font-size: 15px; font-weight: bold;">Current Email</td><td><input size="24" type="email" name="email"></input></td>
			<tr>
	
			<tr></tr>	
			<tr></tr>	
			<tr></tr>	
			<tr></tr>	
			<tr></tr>	
			<tr><td></td><td><input class="btn1" type="submit"></input>&nbsp;&nbsp;<input class="btn2" type="reset"></input></td></tr>	
								
		</table>
		</form>

		</div>
        	<div id="content_bottom"></div>
        </div>
</div>

</body>

</html>
