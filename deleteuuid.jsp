<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.io.FileUtils" %>
<%@ page import="career.dao" %>

<%

	String checkuuid[] = request.getParameterValues("check");
	String loginname = (String)session.getAttribute("loginuser");
			
	try
	{
		for(int i=0 ; i<checkuuid.length ; i++)
		{
			Connection con = dao.createconnection();		
			PreparedStatement ps = con.prepareStatement("update documentdrive_uuid set trash='true' where LOGINNAME=? and GENERATED_UID=? ");
			ps.setString(1,loginname);
			ps.setString(2,checkuuid[i]);
			ps.executeUpdate();
			String path = getServletContext().getRealPath("/") + File.separator + "guuid/"+checkuuid[i]; 	
			FileUtils.deleteDirectory(new File(path));
			con.close();
		}
		response.sendRedirect("generateuid.jsp");
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
%>
