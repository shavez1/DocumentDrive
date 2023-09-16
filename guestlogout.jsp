<%@ page import="java.sql.*" %>
<%@ page import="career.*" %>

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
		String txtid = request.getParameter("txtid");
		try
		{
			Connection con = dao.createconnection();
			PreparedStatement ps = con.prepareStatement("update documentdrive_uuid set used='used' where GENERATED_UID='"+txtid+"'");
			ps.executeUpdate();
			response.sendRedirect("index.html");
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		%>

		</div>
        	<div id="content_bottom"></div>
        </div>
</div>

</body>

</html>
