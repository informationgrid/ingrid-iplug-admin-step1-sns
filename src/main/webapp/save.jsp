<%--
  **************************************************-
  ingrid-iplug-admin-step1-sns
  ==================================================
  Copyright (C) 2014 - 2017 wemove digital solutions GmbH
  ==================================================
  Licensed under the EUPL, Version 1.1 or – as soon they will be
  approved by the European Commission - subsequent versions of the
  EUPL (the "Licence");
  
  You may not use this work except in compliance with the Licence.
  You may obtain a copy of the Licence at:
  
  http://ec.europa.eu/idabc/eupl5
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the Licence is distributed on an "AS IS" basis,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the Licence for the specific language governing permissions and
  limitations under the Licence.
  **************************************************#
  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="de.ingrid.utils.xml.*" %>    
<%@ page import="de.ingrid.iplug.*"%>
<%@ page import="java.io.*"%>
<%@ page import="de.ingrid.utils.PlugDescription"%>
<%@ page import="de.ingrid.utils.BeanFactory"%>

<%@ include file="timeoutcheck.jsp"%>
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

BeanFactory beanFactory = (BeanFactory) application.getAttribute("beanFactory");
File pd_file = (File) beanFactory.getBean("pd_file");
XMLSerializer serializer = new XMLSerializer();
if (null == description) {
	System.out.println("ERROR: current values lost during session timeout, plugdescription was <null>");
} else {
    serializer.serialize(description,pd_file);
}

response.sendRedirect(response.encodeRedirectURL("finish.jsp"));
%>
