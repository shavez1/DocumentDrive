<%@ page import="java.sql.*" %>
<%@ page import="career.dao" %>

<%

	String emaildate[] = request.getParameterValues("delmails");
	String loginname = (String)session.getAttribute("loginuser");
			
	try
	{
		for(int i=0 ; i<emaildate.length ; i++)
		{
		Connection con = dao.createconnection();		
		PreparedStatement ps = con.prepareStatement("update documentdrive_inbox set trash='true' where receiver=? and msg_date=?");
		ps.setString(1,loginname);
		ps.setString(2,emaildate[i]);
		ps.executeUpdate();
		con.close();
		}
		response.sendRedirect("inbox.jsp");
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
%>
