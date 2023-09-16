<%@ page import="java.sql.*" %>
<%@ page import="career.*" %>

<%
	String pw = request.getParameter("pw");
	String ln = (String)application.getAttribute("log"); 

	if(pw==null || pw.trim().equals(""))
	{
		application.setAttribute("value","3");
		response.sendRedirect("http://localhost:9999/documentdrive/password.jsp");
	}
	else
	{
		try
		{
			Connection con = dao.createconnection();
			PreparedStatement ps = con.prepareStatement("select * from documentdrive_login where loginname=? and password=?");
			ps.setString(1,ln);
			ps.setString(2,pw);
			ResultSet rs = ps.executeQuery();	
			if(rs.next())
			{
				session.setAttribute("loginuser",ln);
				session.setAttribute("username",rs.getString("username"));
				session.setAttribute("lastname",rs.getString("lastname"));
				session.setAttribute("uid",rs.getString("uuid"));
				response.sendRedirect("http://localhost:9999/documentdrive/profile.jsp");
			}
			else
			{
				application.setAttribute("value","4");
				response.sendRedirect("http://localhost:9999/documentdrive/password.jsp");
			}
			con.close();
		}
		catch(Exception e)
		{
			out.print(e);
		}	
	}
%>