<%@ page import="java.sql.*" %>
<%@ page import="career.dao" %>

<%

	String datetime = request.getParameter("time");
	String loginname = (String)session.getAttribute("loginuser");
			
	try
	{
		Connection con = dao.createconnection();		
		PreparedStatement ps = con.prepareStatement("update documentdrive_inbox set trash='false' where receiver=? and msg_date=?");
		ps.setString(1,loginname);
		ps.setString(2,datetime);
		ps.executeUpdate();
		con.close();
		response.sendRedirect("trash.jsp");
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
%>
