<%@ page import="java.io.*" %>

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
              	<li class="menuitem"><a href="contact.html">Contact</a></li>
            	</ul>
        </div>
        
	<%
		String un = (String)application.getAttribute("un");
		un = un +" "+ (String)application.getAttribute("ln");
		String log = (String)application.getAttribute("log");
		String uid = (String)application.getAttribute("uid");

	%>

	<%
		String s = (String)application.getAttribute("value");
		try
		{
			if(s.equals("3"))
			{
				s = "<font face='verdana' color='red'>Please Enter Password</font>";
				application.removeAttribute("value");
			}
			if(s.equals("4"))
			{
				s = "<font face='verdana' color='green'>Invalid Password Try Again</font>";
				application.removeAttribute("value");
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

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="login.jsp"><img src="images/arrow.png"></img></a>
			<%
				char ch = un.charAt(0);
				int g=0;
				File fe = new File(getServletContext().getRealPath("/")+"/photos/");
				String str[] = fe.list();
				for(int i=0 ; i<str.length ; i++)
				{
					String fn = str[i].substring(0,str[i].indexOf("."));
					if(fn.equals(uid))
					{
						g=1;
						out.print("<img class='wraptocenter' src='photos/"+uid+".jpg' width='87' height='87'></img>");
						break;
					}
					else if(fn.equals(""+ch))
					{
						g=1;
						out.print("<img class='wraptocenter' src='photos/"+ch+".png' width='87' height='87'></img>");
						break;
					}
				}	
				if(g==0)
				{
					out.print("<img class='wraptocenter' src='photos/default.png'></img>");
				}
			%>
			<form name="myform" action="checkpassword.jsp" method="post" onsubmit="return cat()">
				<table>
					<tr>
						<td><p class="wraptext"><%out.print("<font face='verdana' size='3' color='blue'>"+un+"</font>");%></p></td>
					</tr>
					<tr>
						<td><p class="wraptext"><%out.print("<font face='verdana' color='black'>"+log+"</font>");%></p></td>
					</tr>
					
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					
					<tr>
						<td class="wraptext"><input class="inputbox1" type="password" name="pw" placeholder="Enter Password"></input></td>
					</tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr><td class="wraptext"><span id="amit"></span><%=s%></td></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr>
						<td class="wraptext"><input class="btn" type="submit" value="Login"></input></td>
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
					<tr><td class="wrapanchor"><a href="recoverpassword.jsp">Forget Password?</a></td></tr>
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
