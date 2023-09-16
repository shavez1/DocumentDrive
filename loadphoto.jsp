<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.multipart.MultipartParser" %>
<%@ page import="com.oreilly.servlet.multipart.Part" %>
<%@ page import="com.oreilly.servlet.multipart.FilePart" %>

<html>

<%
	String t1 = (String)session.getAttribute("uuid");
System.out.println(t1);	
	String fileSavePath = getServletContext().getRealPath("/") + File.separator + "photos/"; /*save uploaded files to a 'photos' directory in the web app*/
	
	if (!(new File(fileSavePath)).exists())
	{
		(new File(fileSavePath)).mkdir();// creates the photos directory if it does not exist        
	}

	String resp="";
	try
	{
		MultipartParser parser = new MultipartParser(request, 1024 * 1024);  /* file limit size of 1GB*/
		Part _part;
		String n = t1;
		
		int i=1;
		while((_part = parser.readNextPart()) != null)
		{
			if (_part.isFile())
			{
        			FilePart fPart = (FilePart) _part;  // get some info about the file
        			String name = fPart.getFileName(); //n+".jpg";
        			if (name != null)
				{
        				long fileSize = fPart.writeTo(new File(fileSavePath+"/"+n+".jpg"));
        			}
        		}
        	}// end while 
        }
	catch(java.io.IOException ioe)
	{
		System.out.println(ioe);
        }
%>

<% response.sendRedirect("settings.jsp"); %>

</html>