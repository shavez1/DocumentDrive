<!DOCTYPE HTML>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>Document Drive</title>

	<style>
	.wraptocenter 
	{
  	display: table-cell;
  	text-align: center;
  	vertical-align: middle;
  	width: 115px;
  	height: 115px;
  	background-color: #999;
	}
	.wraptocenter * 
	{
  	vertical-align: middle;
	}

	.wraptext
	{
  	text-align: center;
  	vertical-align: middle;
	}
	.wraptext * 
	{
  	vertical-align: middle;
	}
	</style>
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
              	<li class="menuitem"><a href="contact.html">Contact</a></li>
            	</ul>
        </div>
        
	<%
		String s = (String)application.getAttribute("val1");
		try
		{
			if(s.equals("1"))
			{
				s = "<font face='verdana' color='red'> UserName : <a href='password.jsp'>"+(String)application.getAttribute("log")+"</a></font>";
				application.removeAttribute("val1");
			}
			if(s.equals("2"))
			{
				s = "<font face='verdana' color='red'>Please Enter Email or Phone Number</font>";
				application.removeAttribute("val1");
			}
			if(s.equals("3"))
			{
				s = "<font face='verdana' color='green'>Sorry! Invalid Email or Phone Number Try Again!</font>";
				application.removeAttribute("val1");
			}
		}
		catch(Exception e)
		{
			s="";
		}
	%>
	 
       	<div id="content1">
		<div id="content_top"></div>
        	<div id="content_main1">
			
			<center><img class="wraptocenter" src="images/default.png"></center>
			<br>
			<form name="myform" action="finduser.jsp">
				<table>
					<tr>
						<td><p class="wraptext"><%out.print("<font face='verdana' size='3' color='blue'>Enter any recovery email or phone <br>number associated with your account</font>");%></p></td>
					</tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr>
						<td class="wraptext"><input class="inputbox" type="text" name="fun"  placeholder="Enter Email or Phone Number"></input></td>
					</tr>
					
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr><td class="wraptext"><span id="amit"></span><%=s%></td></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>

					<tr>
						<td class="wraptext"><input class="btn" type="submit" value="Next"></input></td>
					</tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
	
				</table>
			</form>
		</div>

		<div id="content_bottom"></div>
        </div>
</div>

</body>

</html>
