<%@ page import="java.sql.*" %>
<%@ page import="career.*" %>


<%
	String ln = request.getParameter("un");

	if(ln==null || ln.trim().equals(""))
	{
		application.setAttribute("val","1");
		response.sendRedirect("http://localhost:9999/documentdrive/login.jsp");
	}
	else
	{
		boolean bn = ln.endsWith("@docdrive.com");
		if(bn==false)
		{
			ln = ln + "@docdrive.com";
		}	
		try
		{
			Connection con = dao.createconnection();		
			PreparedStatement ps = con.prepareStatement("select * from documentdrive_login where loginname=?");
			ps.setString(1,ln);
			ResultSet rs = ps.executeQuery();	
			if(rs.next())
			{
				application.setAttribute("log",ln);
				application.setAttribute("un",rs.getString("username"));
				application.setAttribute("ln",rs.getString("lastname"));
				application.setAttribute("uid",rs.getString("uuid"));
				response.sendRedirect("http://localhost:9999/documentdrive/password.jsp");
			}
			else
			{
				application.setAttribute("val","2");
				response.sendRedirect("http://localhost:9999/documentdrive/login.jsp");
			}
			con.close();
		}
		catch(Exception e)
		{
			out.print(e);
		}	
	}
%>