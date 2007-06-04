<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*" %>    
<%@ page import="de.ingrid.utils.xml.*" %>
<%@ page import="de.ingrid.utils.PlugDescription" %>
<%@ include file="timeoutcheck.jsp"%>
<%
// get plug description from class path
PlugDescription description;
File pd_file = (File) application.getAttribute("pd_file");

if(pd_file.exists()){
	InputStream in = new FileInputStream(pd_file);
	
	XMLSerializer serializer = new XMLSerializer();
	serializer.aliasClass(PlugDescription.class.getName(), PlugDescription.class );
	description = (PlugDescription)serializer.deSerialize(in);		
} else {
	description = new PlugDescription();
}
request.getSession().setAttribute("description", description);

response.sendRedirect(response.encodeRedirectURL("selectWorkingFolder.jsp"));       
%>
