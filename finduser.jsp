<%@ page import="java.sql.*" %>
<%@ page import="career.*" %>


<%
	String ln = request.getParameter("fun");

	if(ln==null || ln.trim().equals(""))
	{
		application.setAttribute("val1","2");
		response.sendRedirect("http://localhost:9999/documentdrive/recoverlogin.jsp");
	}
	else
	{
		try
		{
			Connection con = dao.createconnection();		
			PreparedStatement ps = con.prepareStatement("select * from documentdrive_login where email=? or mobile=?");
			ps.setString(1,ln);
			ps.setString(2,ln);
			ResultSet rs = ps.executeQuery();	
			if(rs.next())
			{
				application.setAttribute("val1","1");
				application.setAttribute("log",rs.getString("loginname"));
				application.setAttribute("un",rs.getString("username"));
				application.setAttribute("ln",rs.getString("lastname"));
				application.setAttribute("uid",rs.getString("uuid"));
//				response.sendRedirect("http://localhost:9999/documentdrive/recoverlogin.jsp");
				response.sendRedirect("http://localhost:9999/documentdrive/password.jsp");

			}
			else
			{
				application.setAttribute("val1","3");
				response.sendRedirect("http://localhost:9999/documentdrive/recoverlogin.jsp");
			}
			con.close();
		}
		catch(Exception e)
		{
			out.print(e);
		}	
	}
%>