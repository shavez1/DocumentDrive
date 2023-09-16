<%@ page import="java.io.*" %>
<%    
String filename = request.getParameter("filename");

String folder = (String)session.getAttribute("uid");

String path = getServletContext().getRealPath("/") + java.io.File.separator + "documents/"+folder+"/"; 
	
File fe = new File(path+filename);

fe.delete();

response.sendRedirect("downloaddoc.jsp");

%>   