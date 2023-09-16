<!DOCTYPE HTML>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>Document Drive</title>
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
        
        <div id="content">
               	<div id="content_top"></div>
        	<div id="content_main">
		<%
			String val = request.getParameter("val");
			if((String)session.getAttribute("loginuser")!=null)
			{
			session.removeAttribute("loginuser");
			session.removeAttribute("username");
			session.removeAttribute("lastname");
			session.removeAttribute("uuid");
			session.invalidate();
			out.print("<h2>Successfully Logout.....</h2>");
			}
			else
			{
			out.print("<h2>Please Login First.....</h2>");
			}
		%>
		</div>
        	<div id="content_bottom"></div>
        </div>
</div>

</body>

</html>
