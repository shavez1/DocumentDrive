<%@ page import="java.sql.*" %>
<%@ page import="career.*" %>

<%
	String logn = (String)session.getAttribute("loginuser");
	String opw = request.getParameter("opw");
	String npw = request.getParameter("npw");
	try
	{
		Connection con = dao.createconnection();		
		PreparedStatement ps = con.prepareStatement("select * from documentdrive_login where loginname=? and password=?");
		ps.setString(1,logn);
		ps.setString(2,opw);
		ResultSet rs = ps.executeQuery();	
		if(rs.next())
		{
			PreparedStatement ps1 = con.prepareStatement("update documentdrive_login set password=? where loginname=?");
			ps1.setString(1,npw);
			ps1.setString(2,logn);
			int z = ps1.executeUpdate();
			if(z>0)
			{
				out.print("(password updated successfully....)");
			}
			else
			{
				out.print("(error! in updating password....)");
			}
		}
		else
		{
			out.print("(sorry! old password not matched)");
		}
		con.close();
	}	
	catch(Exception e)
	{
		System.out.print(e);
	}
%>