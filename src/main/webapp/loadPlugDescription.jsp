<%--
  **************************************************-
  ingrid-iplug-admin-step1-sns
  ==================================================
  Copyright (C) 2014 - 2015 wemove digital solutions GmbH
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
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*" %>    
<%@ page import="de.ingrid.utils.xml.*" %>
<%@ page import="de.ingrid.utils.PlugDescription" %>
<%@ page import="de.ingrid.utils.BeanFactory"%>
<%@ include file="timeoutcheck.jsp"%>
<%
// get plug description from class path
PlugDescription description;
BeanFactory beanFactory = (BeanFactory) application.getAttribute("beanFactory");
File pd_file = (File) beanFactory.getBean("pd_file");

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
