<%@ page import="career.*" %>
<%@ page import="java.sql.*" %>

<%@ page import="javax.servlet.*,
		javax.servlet.http.*,
		java.io.*,
		javax.mail.*,  
		javax.mail.internet.*,  
		javax.activation.*, 
		java.util.*,
		java.text.*"
%>

<%
	boolean bn = false;
	String recoverpass=null;
	String em = request.getParameter("em");
	String logname = (String)application.getAttribute("log");
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps = con.prepareStatement("select * from documentdrive_login where loginname=? and email=?");
		ps.setString(1,logname);
		ps.setString(2,em);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			recoverpass = rs.getString("password");
			bn = true;
		}
		else
		{
			application.setAttribute("val2","2");
			response.sendRedirect("http://localhost:9999/documentdrive/recoverpassword.jsp");
		}
		con.close();
	}
	catch(Exception e)
	{	
		System.out.println(e);
	}
%>

<%
	if(bn==true)
	{
		final String from = "documentdrive.com@gmail.com";
		final String pass = "document123";
		final String to = em;
		String subject = "Password Recovery Mail from DocumentDrive.com";
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		// Get the Session object.
		Session msession = Session.getInstance(props,
		new javax.mail.Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(from,pass);
		}
		});

	try
	{
		Message message = new MimeMessage(msession);
		message.setFrom(new InternetAddress(from));
		message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
		message.setSubject(subject);
		message.setContent("<h2>UserName :- "+logname+"</h2><b><p style='font-family:arial; font-size:15px; color:blue'>Password :- "+recoverpass,"text/html");
		Transport.send(message);
		msession=null;
		application.setAttribute("val2","1");
		response.sendRedirect("http://localhost:9999/documentdrive/recoverpassword.jsp");
	} 
	catch (MessagingException e)
	{
		application.setAttribute("val2","4");
		response.sendRedirect("recoverpassword.jsp");
	}
	}	
%>
