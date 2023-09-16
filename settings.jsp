<%@ page import="java.sql.*" %>
<%@ page import="career.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE HTML>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>Document Drive</title>

	<script>
		var request;

		function sendinfo1()
		{
			if(checkform())
			{
				var fn = myform.firstname.value;
				var ln = myform.lastname.value;
				var gen = myform.gender.value;
				var dob = myform.dob.value;
				var add = myform.address.value;
				var state = myform.state.value;
				var mob = myform.mobile.value;
				var em = myform.email.value;
	
				var url = "updateuser.jsp?firstname="+fn+"&lastname="+ln+"&gender="+gen+"&dob="+dob+"&address="+add+"&state="+state+"&mobile="+mob+"&email="+em;
				
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
					request.onreadystatechange = getinfo1;  
					request.open("GET",url,true);  
					request.send(); 
				}
				catch(e)
				{
					alert("Unable to connect to server");
				}
			}
		}
		function getinfo1()
		{
			if(request.readyState==4)
			{  
				var val = request.responseText;  
				document.getElementById('amit').innerHTML = val;  
			} 
		}


		function sendinfo2()
		{
			var opw = myform2.opw.value;
			var npw = myform2.npw.value;
			
			var url = "changepassword.jsp?opw="+opw+"&npw="+npw;
				
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
				request.onreadystatechange = getinfo2;  
				request.open("GET",url,true);  
				request.send(); 
			}
			catch(e)
			{
				alert("Unable to connect to server");
			}
		}

		function getinfo2()
		{
			if(request.readyState==4)
			{  
				var val = request.responseText;  
				document.getElementById('kamal').innerHTML = val;  
			} 
		}

		function strength()
		{
			var x = document.myform2.npw.value;
			if(x.length < 5)
			{
				document.getElementById('kamal').innerHTML = "weak";  
			}
			else if(x.length >=5 && x.length<8)
			{
				document.getElementById('kamal').innerHTML = "good";  
			}
			else			
			{
				document.getElementById('kamal').innerHTML = "strong";  
			}
		}

		function checkmobile(obj)
		{
			str="0123456789-"
        		l = obj.value.length;
			if(l<=10)
			{
	        		for(i=0;i<=l;i++)
	        		{
        			if(str.indexOf(obj.value.charAt(i))==-1)
         			{
          				alert("Please Enter Valid Mobile Number.");
          				obj.value="";
          				obj.focus();
          				return false;
         			}
				}
			}
			else
			{
				alert("Mobile Number Must be of 10 Digits");
				obj.value="";
          			obj.focus();
          			return false;
			}
        		return true;
		}

		function checkform()
		{
			if(myform.firstname.value == "")
			{
      				alert("Error: First Name cannot be blank!");
      				myform.firstname.focus();
      				return false;
    			}

			if(myform.lastname.value == "")
			{
      				alert("Error: Last Name cannot be blank!");
      				myform.lastname.focus();
      				return false;
    			}

			if(myform.gender.value.length == 0)
			{
      				alert("Error: Gender cannot be blank!");
      				return false;
    			}

			if(myform.dob.value == "")
			{
      				alert("Error: DOB cannot be blank!");
      				myform.dob.focus();
      				return false;
    			}

			if(myform.address.value == "")
			{
      				alert("Error: Address cannot be blank!");
      				myform.address.focus();
      				return false;
    			}
			
			if(myform.state.value == "")
			{
      				alert("Error: State cannot be blank!");
      				myform.state.focus();
      				return false;
    			}

			if(myform.mobile.value == "")
			{
      				alert("Error: Mobile cannot be blank!");
      				myform.mobile.focus();
      				return false;
    			}

			if(myform.email.value == "")
			{
      				alert("Error: Email cannot be blank!");
      				myform.email.focus();
      				return false;
    			}

			return true;
		}
	</script>

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
				
				char ch = username.charAt(0); //first character of the username/firstname
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

		<h2 style="font-weight: bold; font-size: 18px; color:blue">Upload Your Photo</h2><br>
		<table>
		<form action="loadphoto.jsp" method="post" enctype = "multipart/form-data">
		<tr>
			<td width="44%"><input type="file" name="file1" multiple="multiple" required></input></td>
		</tr>
		<tr>
		</tr>
		<tr>
		<tr>
			<td width="44%"><input class="btn1" type="submit" value="Upload Photo"></input></td>
		</tr>
		</form>
		</table>
		
		<br>
		<hr>
		<br>	
		
		<h2 style="font-weight: bold; font-size: 18px; color:blue">Change Password &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="kamal"></span></h2><br>
		<table>
		<form name="myform2">
		<tr>
		<td style="font-size: 15px; font-weight: bold;">Enter Old Password</td><td width="73%"><input size="24" type="password" name="opw"></input></td>
		</tr>
		<tr>
		<td style="font-size: 15px; font-weight: bold;">Enter New Password</td><td width="73%"><input size="24" type="password" name="npw" onkeyup="strength()"></input></td>
		</tr>
		<tr>
		</tr>
		<tr>
		</tr>
		<td></td><td><input class="btn1" type="button" onclick="sendinfo2()" value="submit"></input></td>
		</tr>
		</form>
		</table>
		
		<br>
		<hr>
		<br>	
		
		<%
			String un = null;
			String ln = null;
			String gen = null;
			String dob = null;
			String add = null;
			String state = null;
			String mob = null;
			String email = null;

			Connection con = dao.createconnection();
			PreparedStatement ps = con.prepareStatement("select * from documentdrive_login where loginname=?");
			ps.setString(1,loginname);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				un = rs.getString("username");
				ln = rs.getString("lastname");
				gen = rs.getString("gender");
				dob = rs.getString("dob");
				add = rs.getString("address");
				state = rs.getString("state");
				mob = rs.getString("mobile");
				email = rs.getString("email");
				session.setAttribute("uuid",rs.getString("uuid"));
			}
		%>

		<h2 style="font-weight: bold; font-size: 18px; color:blue">Update Your Profile &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="amit"></span></h2><br>
		<table>
		<form name="myform">
						
			<tr>
				<td style="font-size: 15px; font-weight: bold;">First Name</td><td width="73%"><input size="24" type="text" name="firstname" value="<%=un%>"></input></td>
			<tr>		
			<tr>
				<td style="font-size: 15px; font-weight: bold;">Last Name</td><td><input size="24" type="text" name="lastname" value="<%=ln%>"></input></td>
			<tr>		
			<tr>
				<td style="font-size: 15px; font-weight: bold;">Gender</td><td style="font-size: 15px; font-weight: bold;"><input size="24" type="text" name="gender" value="<%=gen%>"></td>
			<tr>		
			<tr>
				<td style="font-size: 15px; font-weight: bold;">Date of Birth</td><td><input size="24" type="text" name="dob" value="<%=dob%>"></input></td>
			<tr>
			<tr>
				<td style="font-size: 15px; font-weight: bold;">House Address</td><td><textarea rows="3" cols="25" name="address"><%=add%></textarea></td>
			<tr>		
			<tr>
				<td style="font-size: 15px; font-weight: bold;">State/Union Territory</td><td><input size="24" type="text" name="state" value="<%=state%>"></input></td>
			<tr>		
			<tr>
				<td style="font-size: 15px; font-weight: bold;">Mobile Number</td><td><input onkeyup="checkmobile(this)" size="24" type="text" name="mobile" value="<%=mob%>"></input></td>
			<tr>		
			<tr>
				<td style="font-size: 15px; font-weight: bold;">Current Email</td><td><input size="24" type="email" name="email" value="<%=email%>"></input></td>
			<tr>
	
			<tr></tr>	
			<tr></tr>	
			<tr><td></td><td><input class="btn1" type="button" onclick="sendinfo1()" value="update"></input></td></tr>	
								
		</table>
		</form>

		</div>
        	<div id="content_bottom"></div>
        </div>
</div>

</body>

</html>
