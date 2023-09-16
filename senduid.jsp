<%@ page import="java.io.*" %>
<%@ page import="career.*" %>
<%@ page import="java.sql.*" %>

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
		<h1>UUID Not Issue</h1><br>
		<%
			String msg="";
			String sender="";

			try		
			{
				msg = request.getParameter("forward");
				if(msg.equals("ok1"))
				{
					msg = "";
				}
			}
			catch(Exception e)
			{
				if(msg==null)
				{
					msg="";
				}
				out.print("");
			}

			try
			{
				sender = request.getParameter("sender");
				if(sender.equals("ok2"))
				{
					sender = "";
				}
			}
			catch(Exception e)
			{
				if(sender==null)
				{
					sender="";
				}
				out.print("");
			}
			

			try
			{
				String val = (String)session.getAttribute("msgsent");
				session.removeAttribute("msgsent");
			
				if(val.equals("1"))
				{
					out.print("<font face='verdana' color='blue'>Message successfully sent</font><br><br>");
				}
				if(val.equals("2"))
				{
					out.print("<font face='verdana' color='blue'>Error! in sending message</font><br><br>");
				}
			}
			catch(Exception e)
			{
				out.print("");
			}
		%>
		
		<%
			try
			{
				Connection con = dao.createconnection();
				PreparedStatement ps = con.prepareStatement("select * from DOCUMENTDRIVE_UUID where loginname=? and used=? and issued_towhom='none' and trash='false'");
				ps.setString(1,loginname);
				ps.setString(2,"not used");
				ResultSet rs = ps.executeQuery();
				out.print("<table border='1'>");
				out.print("<tr><th style='font-family:arial; font-size:16px; color:red' width='75'>UUID</th><th style='font-family:arial; font-size:16px; color:red' width='450'>Attachments</th><th style='font-family:arial; font-size:16px; color:red' width='60'>Status</th><th style='font-family:arial; font-size:16px; color:red' width='50'>Edit</th></tr>");
				while(rs.next())
				{
					out.print("<tr>");
					out.print("<td style='font-family:arial; font-size:15px'><a href='sendidtoguest.jsp?txtid="+rs.getString("GENERATED_UID")+"'>"+rs.getString("GENERATED_UID")+"</a></td>");
					out.print("<td style='font-family:arial; font-size:15px'>"+rs.getString("FILES_ATTACH")+"</td>");
					out.print("<td style='font-family:arial; font-size:15px'>"+rs.getString("USED")+"</td>");
					out.print("<td style='font-family:arial; font-size:15px'><a href='viewfiles.jsp?res=1&txtid="+rs.getString("GENERATED_UID")+"'>edit</a></td>");
					out.print("</tr>");
				}
				out.print("</table>"); 
				con.close();
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		%>		

		
		<br><h1>Already Sent UUID</h1><br>

		<%
			try
			{
				Connection con = dao.createconnection();
				PreparedStatement ps = con.prepareStatement("select * from DOCUMENTDRIVE_UUID where loginname=? and used=? and issued_towhom!='none' and trash='false'");
				ps.setString(1,loginname);
				ps.setString(2,"not used");
				ResultSet rs = ps.executeQuery();
				out.print("<table border='1'>");
				out.print("<tr><th style='font-family:arial; font-size:16px; color:red' width='70'>UUID</th><th style='font-family:arial; font-size:17px; color:red' width='300'>Attachments</th><th style='font-family:arial; font-size:17px; color:red' width='200'>To Whome</th><th style='font-family:arial; font-size:17px; color:red' width='60'>Status</th></tr>");
				while(rs.next())
				{
					out.print("<tr>");
					out.print("<td style='font-family:arial; font-size:15px'>"+rs.getString("GENERATED_UID")+"</td>");
					out.print("<td style='font-family:arial; font-size:15px'>"+rs.getString("FILES_ATTACH")+"</td>");
					out.print("<td style='font-family:arial; font-size:15px'>"+rs.getString("Issued_towhom")+"</td>");
					out.print("<td style='font-family:arial; font-size:15px'>"+rs.getString("USED")+"</td>");
					out.print("</tr>");
				}
				out.print("</table>"); 
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
