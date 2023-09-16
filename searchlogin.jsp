<%@ page import="java.sql.*" %>
<%@ page import="career.*" %>


<%
	String ln = request.getParameter("t1");
	if(ln.length()!=0)
	{
		boolean bn = ln.endsWith("@docdrive.com");
		if(bn==false)
		{	
			ln = ln+"@docdrive.com";
		}
		try
		{
			Connection con = dao.createconnection();		
			PreparedStatement ps = con.prepareStatement("select * from documentdrive_login where loginname=?");
			ps.setString(1,ln);
			ResultSet rs = ps.executeQuery();	
			if(rs.next())
			{
				out.print("already in use");
			}
			else
			{
				out.print("name available");	
			}
			con.close();
		}	
		catch(Exception e)
		{
			out.print(e);
		}
	}
	else
	{
		out.print(" ");
	}	
	
%>