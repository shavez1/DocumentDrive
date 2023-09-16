<%@ page import="java.sql.*" %>
<%@ page import="career.dao" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.file.Files" %>

<%

	String checkfile[] = request.getParameterValues("check");
if(checkfile==null){
response.sendRedirect("generateuid.jsp?val22=2");
}
else {
System.out.println(checkfile);

	String loginname = (String)session.getAttribute("loginuser");
	String uid = (String)session.getAttribute("uid");
	String txtid = request.getParameter("txtid");
	String fls="";
	
	String destinationpath = getServletContext().getRealPath("/") + File.separator + "guuid/"+txtid+"/"; 	/*save uploaded files to a 'guuid' directory in the documentdrive*/
	String sourcepath = getServletContext().getRealPath("/") + File.separator + "documents/"+uid+"/"; 	/*source files of 'documents' directory in the documentdrive*/
	
	if (!(new File(destinationpath)).exists())
	{
		(new File(destinationpath)).mkdir();// creates the photos directory if it does not exist        
	}

	for(int i=0 ; i<checkfile.length ; i++)
	{
		File source = new File(sourcepath+checkfile[i]);
		File destin = new File(destinationpath+checkfile[i]);
		Files.copy(source.toPath(),destin.toPath());
		fls = fls + checkfile[i]+",";
	}
	
	DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	Date date = new Date();
	String dt = ""+dateFormat.format(date);
		
	try
	{
		Connection con = dao.createconnection();		
		PreparedStatement ps = con.prepareStatement("insert into documentdrive_uuid values(?,?,?,?,?,?,?)");
		ps.setString(1,loginname);
		ps.setString(2,txtid);
		ps.setString(3,fls);
		ps.setString(4,dt);
		ps.setString(5,"none");
		ps.setString(6,"not used");
		ps.setString(7,"false");
		int z = ps.executeUpdate();
		con.close();
		if(z>0)
		{
			response.sendRedirect("generateuid.jsp?val22=1");
		}
		else
		{
			response.sendRedirect("generateuid.jsp?val22=0");
		}
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
}
%>
