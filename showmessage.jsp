<%@ page import="java.io.*" %>
<%@ page import="career.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE HTML>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>Document Drive</title>

	<style>
		
	</style>
</head>

<body>
<div id="container">
	
	<div id="header">
        	<h1>Document<span class="off">Drive.com</span></h1>
            	<h2 class="tooltip">
		<%
			String loginname = (String)session.getAttribute("loginuser");
			String username = (String)session.getAttribute("username");
			String lastname = (String)session.getAttribute("lastname");
			String uid = (String)session.getAttribute("uid");
			out.print(username+" "+lastname);
		%>

		<%
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
                    <li><a href="compose.jsp">Compose</a></li>
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

		<%
			String time = request.getParameter("time");
			String sender = request.getParameter("sender");
		%>
		
		<h2>Message from '<%=sender%>'</h2><br>
		<%
			String msg="";
			try
			{
				Connection con = dao.createconnection();
				PreparedStatement ps = con.prepareStatement("select * from documentdrive_inbox where msg_date=?");
				ps.setString(1,time);
				ResultSet rs = ps.executeQuery();
				if(rs.next())
				{
					msg = rs.getString("message");
				}
				else
				{
					msg = "there is no message";
				}
				con.close();
			}
			catch(Exception e)
			{
				System.out.println(e);
			}		
		%>
		<h3><a href="inbox.jsp">Back</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="compose.jsp?forward=<%=msg%>">Forward</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="compose.jsp?sender=<%=sender%>">Reply</a></h3>
		<br><p><%=msg%></p>
		
		</div>
        	<div id="content_bottom"></div>
        </div>
</div>

</body>

</html>
