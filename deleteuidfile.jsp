<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="career.dao" %>

<%    
String res = request.getParameter("res");
String filename = request.getParameter("filename");
String loginname = (String)session.getAttribute("loginuser");
String txtid = request.getParameter("txtid");

String path = getServletContext().getRealPath("/") + java.io.File.separator + "guuid/"+txtid+"/"; 
	
File fe = new File(path+filename);

fe.delete();

try
{
	Connection con = dao.createconnection();
	PreparedStatement ps1 = con.prepareStatement("select * from DOCUMENTDRIVE_UUID where LOGINNAME=? and GENERATED_UID=?");
	PreparedStatement ps2 = con.prepareStatement("update DOCUMENTDRIVE_UUID set FILES_ATTACH=? where LOGINNAME=? and GENERATED_UID=?");
	ps1.setString(1,loginname);
	ps1.setString(2,txtid);
	ResultSet rs = ps1.executeQuery();
	String fes="";
	if(rs.next())
	{
		String attach = rs.getString("FILES_ATTACH");
		String files[] = attach.split(",");
		
		for(int i=0 ; i<files.length ; i++)
		{
			if(!filename.equals(files[i]))
			{
				fes = fes + files[i]+",";
			}
		}
		ps2.setString(1,fes);
		ps2.setString(2,loginname);
		ps2.setString(3,txtid);
		ps2.executeUpdate();
	}
	con.close();	
}	
catch(Exception e)
{
	System.out.println(e);
}

response.sendRedirect("viewfiles.jsp?res="+res+"&txtid="+txtid);

%>   