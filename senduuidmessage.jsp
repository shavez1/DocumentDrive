<%@ page import="java.sql.*" %>
<%@ page import="career.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>


<%
	String to = request.getParameter("to");
	String txtid = request.getParameter("txtuuid");
	boolean bn = to.endsWith("@docdrive.com");
	if(bn==false)
	{	
		to = to+"@docdrive.com";
	}
	String subject = request.getParameter("subject");
	String message = request.getParameter("message");
	
	DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	Date date = new Date();
	String dt = ""+dateFormat.format(date);

	String loginname = (String)session.getAttribute("loginuser");	
	
	try
	{
		Connection con = dao.createconnection();		
		PreparedStatement ps = con.prepareStatement("insert into documentdrive_inbox values(?,?,?,?,?,?)");
		PreparedStatement ps2 = con.prepareStatement("update documentdrive_uuid set ISSUED_TOWHOM=? where GENERATED_UID=?");
		ps.setString(1,loginname);
		ps.setString(2,to);
		ps.setString(3,subject);
		ps.setString(4,message);
		ps.setString(5,dt);
		ps.setString(6,"false");
		int z = ps.executeUpdate();	
		if(z>0)
		{
			ps2.setString(1,to);
			ps2.setString(2,txtid);
			ps2.executeUpdate();
			session.setAttribute("msgsent","1");
			response.sendRedirect("compose.jsp");
		}
		else
		{
			session.setAttribute("msgsent","2");
			response.sendRedirect("compose.jsp");
		}
		con.close();
	}	
	catch(Exception e)
	{
		out.print(e);
	}
%>