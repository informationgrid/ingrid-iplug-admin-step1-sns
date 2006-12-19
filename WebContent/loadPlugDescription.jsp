<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*" %>    
<%@ page import="de.ingrid.utils.xml.*" %>
<%@ page import="de.ingrid.utils.PlugDescription" %>

<%
// get plug description from class path
PlugDescription description;
InputStream in = this.getClass().getResourceAsStream("/plugdescription.xml");
boolean exists = false;
if(in !=null ){
	XMLSerializer serializer = new XMLSerializer();
	serializer.aliasClass(PlugDescription.class.getName(), PlugDescription.class );
	description = (PlugDescription)serializer.deSerialize(in);		
	exists = true;
} else {
	description = new PlugDescription();
}
request.getSession().setAttribute("description", description);

response.sendRedirect(response.encodeRedirectURL("selectWorkingFolder.jsp"));       
%>
