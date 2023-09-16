<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.multipart.MultipartParser" %>
<%@ page import="com.oreilly.servlet.multipart.Part" %>
<%@ page import="com.oreilly.servlet.multipart.FilePart" %>

<html>

<%
	String t1 = (String)session.getAttribute("uid");
	String resp="";

	String fileSavePath = getServletContext().getRealPath("/") + File.separator + "documents/"+t1+"/"; /*save uploaded files to a 'documents' directory in the webapp*/
	
	if (!(new File(fileSavePath)).exists())
	{
		(new File(fileSavePath)).mkdir();// creates the photos directory if it does not exist        
	}

	try
	{
		MultipartParser parser = new MultipartParser(request, 1024 * 1024);  /* file limit size of 1GB*/
		Part _part;
				
		int i=1;
		while((_part = parser.readNextPart()) != null)
		{
			if (_part.isFile())
			{
        			FilePart fPart = (FilePart) _part;  // get some info about the file
        			String name = fPart.getFileName();
        			if (name != null)
				{
        				float filesize = fPart.writeTo(new File(fileSavePath));
        				resp = resp + "<font face='verdana' color='green' size='3'>Uploaded File ( "+name+" ) Size = " + (filesize/1024)+" KB</font></br>";
				}
				else
				{
        				resp = "<br>Sorry! File(s) not uploaded";
        			}
        		}
        	}// end while 
        }
	catch(java.io.IOException ioe)
	{
		System.out.println(ioe);
        }
%>

<% response.sendRedirect("uploaddoc.jsp?status="+resp); %>

</html>