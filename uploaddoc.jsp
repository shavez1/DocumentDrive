<%@ page import="java.io.*" %>

<!DOCTYPE HTML>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>Document Drive</title>

	<script>
		function checkform()
		{
			if(myform.to.value == "")
			{
				alert("Error: To field cannot be blank!");
      				myform.to.focus();
      				return false;
			}
			if(myform.subject.value == "")
			{
				alert("Error: Subject cannot be blank!");
      				myform.subject.focus();
      				return false;
			}
			if(myform.message.value == "")
			{
				alert("Error: Message cannot be blank!");
      				myform.message.focus();
      				return false;
			}
			return true;
		}
	</script>
</head>

<body>
<div id="container">
	
	<div id="header">
        	<h1>Document<span class="off">Drive.com</span></h1>
            	<h2 class="tooltip">
		<%
			String loginname="";	
			String username="";
			String lastname="";
			String uid="";
			try
			{
				loginname = (String)session.getAttribute("loginuser");
				username = (String)session.getAttribute("username");
				lastname = (String)session.getAttribute("lastname");
				uid = (String)session.getAttribute("uid");
				out.print(username+" "+lastname+"&nbsp;&nbsp;&nbsp;&nbsp;");
				char ch = username.charAt(0);
				int g=0;
				File fe = new File(getServletContext().getRealPath("/")+"/photos/");
				String str[] = fe.list();
				for(int i=0 ; i<str.length ; i++)
				{
					String fn = str[i].substring(0,str[i].indexOf("."));
					if(fn.equals(uid))
					{
						g=1;
						out.print("<img class='wraptocenter' src='photos/"+uid+".jpg' width='40' height='40'></img>");
						break;
					}
					else if(fn.equals(""+ch))
					{
						g=1;
						out.print("<img class='wraptocenter' src='photos/"+ch+".png' width='40' height='40'></img>");
					break;
					}
				}	
				if(g==0)
				{
					out.print("<img class='wraptocenter' src='photos/default.png' width='50' height='40'></img>");
				}
			}
			catch(Exception e)
			{
				application.setAttribute("val","3");
				response.sendRedirect("login.jsp");
			}
		%>

		<span class="tooltiptext"><%=loginname%></span>	
		</h2>
        </div>   
        
        <div id="menu">
        	<ul>
            	<li class="menuitem"><a href="settings.jsp">Settings</a></li>
                <li class="menuitem"><a href="logout.jsp">Logout</a></li>
                </ul>
        </div>

	<div id="leftmenu">

        <div id="leftmenu_top"></div>

		<div id="leftmenu_main">    
                
                <ul>
                    <li><a href="inbox.jsp">Inbox</a></li>
                    <li><a href="compose.jsp?forward=ok1&sender=ok2">Compose</a></li>
                    <li><a href="generateuid.jsp">Generate UID</a></li>
                    <li><a href="uploaddoc.jsp">Upload Documents</a></li>
                    <li><a href="downloaddoc.jsp">Download Documents</a></li>
                    <li><a href="senduid.jsp">Send UID</a></li>
                    <li><a href="deleteuid.jsp">Delete UID</a></li>
                    <li><a href="trash.jsp">Trash</a></li>
                </ul>
		</div>
	<div id="leftmenu_bottom"></div>
        </div>
        
        
        <div id="content">
               	<div id="content_top"></div>
        	<div id="content_main">
		<h1>Upload Documents</h1><br><br>
		<table>
		<form action="uploaddocuments.jsp" method="post" enctype = "multipart/form-data">
			
		<tr>
			<td width="44%"><input type="file" name="file1" multiple="multiple" required></input></td>
		</tr>
		<tr>
		</tr>
		<tr>
		<tr>
			<td width="44%"><input class="btn1" type="submit" value="Upload Documents"></input></td>
		</tr>
		</form>
		</table>

		<br><br>
		<%
			String resp="";
			try
			{
				resp = request.getParameter("status");
				if(resp!=null)
				{
				out.print(resp);
				resp="";
				}
			}
			catch(Exception e)
			{
			}
		%>

		</div>
        	<div id="content_bottom"></div>
        </div>
</div>

</body>

</html>
