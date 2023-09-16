<%@ page import="java.sql.*" %>
<%@ page import="career.*" %>

<%
	String logn = (String)session.getAttribute("loginuser");
	String fn = request.getParameter("firstname");
	String ln = request.getParameter("lastname");
	String gen = request.getParameter("gender");
	String dob = request.getParameter("dob");
	String add = request.getParameter("address");
	String state = request.getParameter("state");
	String mob = request.getParameter("mobile");
	String email = request.getParameter("email");
	try
	{
		Connection con = dao.createconnection();		
		PreparedStatement ps = con.prepareStatement("update documentdrive_login set username=?,lastname=?,gender=?,dob=?,address=?,state=?,mobile=?,email=? where loginname=?");
		ps.setString(1,fn);
		ps.setString(2,ln);
		ps.setString(3,gen);
		ps.setString(4,dob);
		ps.setString(5,add);
		ps.setString(6,state);
		ps.setString(7,mob);
		ps.setString(8,email);
		ps.setString(9,logn);
		
		int z = ps.executeUpdate();	
		if(z>0)
		{
			out.print("(record updated successfully....)");
		}
		else
		{
			out.print("(error! in updating record....)");
		}
		con.close();
	}	
	catch(Exception e)
	{
		System.out.print(e);
	}
%>