<%    
String filename = request.getParameter("filename");

String folder = (String)session.getAttribute("uid");

String path = getServletContext().getRealPath("/") + java.io.File.separator + "documents/"+folder+"/"; 
	
response.setContentType("APPLICATION/OCTET-STREAM");  
 
response.setHeader("Content-Disposition"," attachment; filename=\"" + filename + "\" ");   
  
try
{
java.io.FileInputStream fis = new java.io.FileInputStream(path + filename);  
      
int i;   
while ((i=fis.read()) != -1) 
{  
    	out.write(i); //jsp wrtiter ka object 'out'  
}   
fis.close();
}
catch(Exception e)
{
	System.out.println(e);
}	   

%>   