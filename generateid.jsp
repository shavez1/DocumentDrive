<%@ page import="java.util.UUID" %>

<%
	String uid = UUID.randomUUID().toString();
	uid = uid.substring(0,8);
	out.print(uid);
%>

