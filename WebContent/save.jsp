<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="de.ingrid.utils.xml.*" %>    
<%@ page import="de.ingrid.iplug.*"%>
<%@ page import="java.io.*"%>
<%@ page import="de.ingrid.utils.PlugDescription"%>

<%
PlugDescription  description = (PlugDescription) request.getSession().getAttribute("description");
java.net.URL url = this.getClass().getClassLoader().getResource("conf");
File folder  = null;
if(url !=null){
	String	path = url.getPath();
	boolean WINDOWS = System.getProperty("os.name").startsWith("Windows");
	if (WINDOWS && path.startsWith("/")){ // patch a windows bug
	    path = path.substring(1);
	}
	try {
	    path = java.net.URLDecoder.decode(path, "UTF-8"); // decode the url path
	} catch (UnsupportedEncodingException e) {
	}
	folder = new File(path);
} else {
	folder = description.getWorkinDirectory();
}

File file = new File(folder, "plugdescription.xml");
XMLSerializer serializer = new XMLSerializer();
serializer.serialize(description,file);

response.sendRedirect(response.encodeRedirectURL("finish.jsp"));
%>