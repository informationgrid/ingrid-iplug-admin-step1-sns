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
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="de.ingrid.utils.QueryExtensionContainer"%>
<%@ page import="de.ingrid.utils.PlugDescription" %>
<%@ page import="de.ingrid.iplug.util.*" %>
<%@ include file="timeoutcheck.jsp"%>
<%
int busIndex = Integer.parseInt(WebUtil.getParameter(request, "busIndex", "-1"));
PlugDescription  description = (PlugDescription) request.getSession().getAttribute("description");
String[] busUrls = description.getBusUrls();
for(int i=0; i < busUrls.length; i++){
	String busUrl = busUrls[i];
	if(i == busIndex){
		description.removeBusUrl(busUrl);
		QueryExtensionContainer container = (QueryExtensionContainer) description.get("QUERY_EXTENSION");
		container.removeQueryExtension(busUrl);
		response.sendRedirect(response.encodeRedirectURL("addIbus.jsp"));
	}
}
%>
