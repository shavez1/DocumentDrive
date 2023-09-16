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
			String txtid = request.getParameter("txtid");
			
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
		<h1>Attachments with (<%=txtid%>)</h1><br>

	<%
		String res = "0";
		try
		{
			res = request.getParameter("res");
			if(res.equals("1"))
			{
				out.print("<a href='senduid.jsp'>Back</a>");
			}
			else
			{
				out.print("<a href='generateuid.jsp'>Back</a>");
			}
		}
		catch(Exception e)
		{
			out.print("<a href='generateuid.jsp'>Back</a>");
		}		
	%>	
		<%
			String fileSavePath = getServletContext().getRealPath("/") + File.separator + "guuid/"+txtid+"/"; /*save uploaded files to a 'documents' directory in the webapp*/
	
			File fe = new File(fileSavePath);

			File str1[] = fe.listFiles();
			String str2[] = fe.list();
			if(str2.length==0)
			{
				out.print("<br><br><h3>There is no Document with this Attachment</h3>");
			}
			out.print("<table>");
			for(int i=0 ; i<str2.length ; i++)
			{
				String fs = ""+(str1[i].length()/1024f);
				fs = fs.substring(0,fs.indexOf(".")+3);
				out.print("<tr>");
				out.print("<td><font face='verdana' color='green' size='3'>("+(i+1)+")</font></td><td><font face='verdana' color='green' size='3'><a href='downloadfile.jsp?filename="+str2[i]+"'>"+str2[i]+"</font></td><td>&nbsp;("+fs+" KB)</a></td><td>&nbsp;&nbsp;&nbsp;<a href='deleteuidfile.jsp?res="+res+"&txtid="+txtid+"&filename="+str2[i]+"'>delete</a></td>");
				out.print("</tr>");
			}
			out.print("</table>");
		%>
		<table>
		
		</table>

		<br><br>
		
		</div>
        	<div id="content_bottom"></div>
        </div>
</div>

</body>

</html>
