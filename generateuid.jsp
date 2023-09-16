<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="career.dao" %>

<!DOCTYPE HTML>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>Document Drive</title>

	<script>
		var request;
		function cat()
		{
			var url = "generateid.jsp";	
			
			if(window.XMLHttpRequest)
			{  
				request = new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject)
			{ 	 	
				request = new ActiveXObject("Microsoft.XMLHTTP");  
			}  
  
			try  
			{  
				request.onreadystatechange = getInfo;  
				request.open("GET",url,true);  
				request.send();  
			}  
			catch(ex)  
			{  
				alert("Unable to connect to server");  
			}  
		}
	
		function getInfo()
		{
			if(request.readyState==4)
			{  
				var val = request.responseText;  
				document.myform.txtid.value = val; 
			}  
		}

		function checkform()
		{
			if(myform.txtid.value == "")
			{
				alert("Error: Generate UID First");
      				myform.txtid.focus();
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
		<h1>Generate UUID</h1><br>
		
		<%
			try
			{
			String t1 = (String)session.getAttribute("uid");
			String fileSavePath = getServletContext().getRealPath("/") + File.separator + "documents/"+t1+"/"; /*save uploaded files to a 'documents' directory in the webapp*/
	
			File fe = new File(fileSavePath);

			File str1[] = fe.listFiles();
			String str2[] = fe.list();
			if(str2.length==0)
			{
				out.print("<h3>There is no Document to Attach</h3>");
			}
			out.print("<br><form name='myform' action='saveid.jsp' onsubmit='return checkform()' method='get'>");
			out.print("<table>");
			out.print("<tr><td><input class='inputbox4' type='text' name='txtid'></input></td><td><a class='btn1' href='#' onclick='cat()'>Generate ID</a></td></tr><tr></tr><tr></tr><tr></tr>");	
			for(int i=0 ; i<str2.length ; i++)
			{
				String fs = ""+(str1[i].length()/1024f);
				fs = fs.substring(0,fs.indexOf(".")+3);
				out.print("<tr>");
				out.print("<td><font face='verdana' color='green' size='3'><input type='checkbox' name='check' value='"+str2[i]+"'>&nbsp;"+str2[i]+"</input></font></td>");
				out.print("</tr>");
			}
			out.print("<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr><td></td><td><input class='btn1' type='submit' value='Save UUID'></input></td></tr>");
			out.print("</table>");
			out.print("</form>");
			}
			catch(Exception e)
			{
				out.print("<p><font face='verdana' color='blue' size='3'>No Documents Previously Uploaded <a href='uploaddoc.jsp'>Upload</a> Now</font></p>");
			}
		%>
		<table>
		
		</table>

		<br><br>
		
		<%
			try
			{
				String val22 = request.getParameter("val22");
				if(val22.equals("1"))
				{
					out.print("<h3>UUID Saved Successfully....</h3>");
				}
				else 
				{
					if(val22.equals("2")) {
					out.print("<h3>Tick checkbox or select file first....</h3>");
					}
					else 
					{
					out.print("<h3>Error! in Saving UUID....</h3>");
					}
				}
				
			}
			catch(Exception e)
			{
			}
		%>

		<br><h2>Edit / Delete Existing UUID</h2><br>

		<form action="deleteuuid.jsp?guid=1">
		<table border="1">
			<tr><th><input type="submit" value="Delete"></input></th><th style='font-family:arial; font-size:16px; color:red' width='70'>UUID</th><th style='font-family:arial; font-size:16px; color:red'>Attachments</th><th style='font-family:arial; font-size:16px; color:red'>Created On</th><th style='font-family:arial; font-size:16px; color:red' width='150'>UUID Owner</th><th style='font-family:arial; font-size:16px; color:red' width='70'>Status</th></tr>
			<%
				try
				{
					Connection con = dao.createconnection();
					PreparedStatement ps = con.prepareStatement("select * from DOCUMENTDRIVE_UUID where loginname=? and trash='false'");
					ps.setString(1,loginname);
					ResultSet rs = ps.executeQuery();
					while(rs.next())
					{
						out.print("<tr>");
						out.print("<td><input type='checkbox' name='check' value='"+rs.getString("GENERATED_UID")+"'></input></td>");	
						out.print("<td style='font-family:arial; font-size:15px'>"+rs.getString("GENERATED_UID")+"</td>");
						out.print("<td style='font-family:arial; font-size:15px'><a href='viewfiles.jsp?txtid="+rs.getString("GENERATED_UID")+"'>Click Here</a></td>");
						out.print("<td style='font-family:arial; font-size:15px'>"+rs.getString("GENERATED_DATE")+"</td>");
						out.print("<td style='font-family:arial; font-size:15px'>"+rs.getString("ISSUED_TOWHOM")+"</td>");
						out.print("<td style='font-family:arial; font-size:15px'>"+rs.getString("USED")+"</td>");
						out.print("</tr>");
					} 
					con.close();
				}
				catch(Exception e)
				{
					System.out.println(e);
				}
			%>
		</table>
		</form>

		</div>
        	<div id="content_bottom"></div>
        </div>
</div>

</body>

</html>
