<%@ page import="java.sql.*" %>
<%@ page import="career.*" %>
<%@ page import="java.util.UUID" %>	//for uuid

<%
	String id = UUID.randomUUID().toString();
	id = id.substring(0,5);	
System.out.println(id+" This uuid is used for uploading the photo ");
	
	String logn = request.getParameter("loginname");
	String pw = request.getParameter("password");
	String fn = request.getParameter("firstname");
	String ln = request.getParameter("lastname");
	String gen = request.getParameter("gender");
	String dob = request.getParameter("dob");
	String add = request.getParameter("address");
	String state = request.getParameter("state");
	String mob = request.getParameter("mobile");
	String email = request.getParameter("email");
	
	boolean bn = logn.endsWith("@docdrive.com");
	
	if(bn==false)
	{	
		logn = logn + "@docdrive.com";
	}
	
	try
	{
		Connection con = dao.createconnection();		
		PreparedStatement ps = con.prepareStatement("insert into documentdrive_login values(?,?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1,fn);
		ps.setString(2,ln);
		ps.setString(3,logn);
		ps.setString(4,pw);
		ps.setString(5,gen);
		ps.setString(6,dob);
		ps.setString(7,add);
		ps.setString(8,state);
		ps.setString(9,mob);
		ps.setString(10,email);
		ps.setString(11,id);
		
		int z = ps.executeUpdate();	
		if(z>0)
		{
	%>
		<jsp:forward page="success.jsp?val=1"></jsp:forward>
	<%
		}
		else
		{
	%>
		<jsp:forward page="success.jsp?val=0"></jsp:forward>
	<%	
		}
		con.close();
	}	
	catch(Exception e)
	{
		out.print(e);
	}
%>