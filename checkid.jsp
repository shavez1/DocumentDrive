<%@ page import="java.sql.*" %>
<%@ page import="career.*" %>


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
        
       	<div id="content1">
		<div id="content_top"></div>
        	<div id="content_main1">
		<%
		String un = request.getParameter("un");
		String txtid = request.getParameter("txtid");
		out.print("<h1>Welcome, "+un.toUpperCase()+"</h1>");
		out.print("<h3>Documents Attach With Your UID : "+txtid+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='guestlogout.jsp?txtid="+txtid+"'>Logout</a></h3>");
		
		try
		{
			Connection con = dao.createconnection();
			PreparedStatement ps = con.prepareStatement("select * from documentdrive_uuid where GENERATED_UID='"+txtid+"' and used='not used'");
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				String list = rs.getString("files_attach");
				String filelist[] = list.split(",");
				out.print("<br><font face='verdana' color='blue' size='2'>Uploaded By :- "+rs.getString("loginname")+"</font><br>");
				for(int i=0 ; i<filelist.length ; i++)
				{
					out.print("<br><font face='verdana' color='green' size='3'>"+(i+1)+")&nbsp;<a href='downloadguidfile.jsp?filename="+filelist[i]+"&uid="+txtid+"'>"+filelist[i]+"</a></font>");
				}
			}
			else
			{
				application.setAttribute("val6","0");
				response.sendRedirect("getdocument.jsp");
			}
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
