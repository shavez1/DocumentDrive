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

	.wrapanchor
	{
  	text-align: right;
  	vertical-align: middle;
	}
	.wrapanchor * 
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
              	<li class="menuitem"><a href="getdocument.jsp">Download Documents</a></li>
              	<li class="menuitem"><a href="contact.html">Contact</a></li>
            	</ul>
        </div>
        
	<%
		String s = (String)application.getAttribute("val");
		try
		{
			if(s.equals("1"))
			{
				s = "<font face='verdana' color='red'>Please Enter Login Name</font>";
				application.removeAttribute("val");
			}
			if(s.equals("2"))
			{
				s = "<font face='verdana' color='green'>Sorry! DocumentDrive doesn't recognize you</font>";
				application.removeAttribute("val");
			}
			if(s.equals("3"))
			{
				s = "<font face='verdana' color='green'>Please Login First</font>";
				application.removeAttribute("val");
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
			
			<%
				try
				{
				application.removeAttribute("log");
				application.removeAttribute("un");
				application.removeAttribute("ln");
				application.removeAttribute("uid");
				}
				catch(Exception e)
				{
					
				}
			%>

			<center><img class="wraptocenter" src="images/default.png"></center>
			<br>
			<form name="myform" action="usersearch.jsp">
				<table>
					<tr>
						<td><input class="inputbox" type="text" name="un"  placeholder="Enter Your Login Name"></input></td>
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
						<td><input class="btn" type="submit" value="Next"></input></td>
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
					<tr><td class="wrapanchor"><a href="recoverlogin.jsp">Find My Account</a></td></tr>
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
