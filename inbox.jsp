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
               	
		<%
			try
			{
				Connection con = dao.createconnection();
				PreparedStatement ps = con.prepareStatement("select * from documentdrive_inbox where receiver=? and trash='false'");
				ps.setString(1,loginname);
				ResultSet rs = ps.executeQuery();
				out.print("<form action='trashmessage.jsp' method='post'>");
				out.print("<table border='1' class='demo'>");
				out.print("<tr><th width='30'><input type='submit' value='Trash'></input></th><th width='100'>From</th><th width='200'>Subject</th><th width='100'>Date</th></tr>");
				while(rs.next())
				{
					out.print("<tr>");
					out.print("<td><input type='checkbox' name='delmails' value='"+rs.getString("msg_date")+"'></input></td>");
					out.print("<td>"+rs.getString("sender")+"</td>");
					out.print("<td><a href='showmessage.jsp?time="+rs.getString("msg_date")+"&sender="+rs.getString("sender")+"'>"+rs.getString("subject")+"</a></td>");
					out.print("<td>"+rs.getString("msg_date")+"</td>");
					out.print("</tr>");
				}
				out.print("</table>");
				out.print("</form>");
				con.close();
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		%>


        </div>
</div>

</body>

</html>
