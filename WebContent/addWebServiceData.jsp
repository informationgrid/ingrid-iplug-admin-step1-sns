<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="de.ingrid.utils.PlugDescription" %>
<%@ page import="de.ingrid.iplug.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WebService Daten hinzuf&#x00FC;gen</title>
<link href="<%=response.encodeURL("css/admin.css")%>" rel="stylesheet" type="text/css" />
</head>
<body>
<center>
	<div class="headline"><br />
		WebService Daten
		<br /><br />
		<span class="byline">Geben Sie hier die WebService Daten an.</span>		
	</div>
	<br />
	<form method="post" action="<%=response.encodeURL("addWebServiceData.jsp")%>">
	
	<%
	boolean submitted = (WebUtil.getParameter(request, "submitted", null) != null);
	
	String webServiceUrl = WebUtil.getParameter(request, "webServiceUrl", "");
	String maxWordAnalyzingString = WebUtil.getParameter(request, "maxWordAnalyzing", "1000");
	String language = WebUtil.getParameter(request, "language", "");
	String usernameValue = WebUtil.getParameter(request, "usernameValue", "");
	String passwordValue = WebUtil.getParameter(request, "passwordValue", "");
	PlugDescription  description = (PlugDescription) request.getSession().getAttribute("description");

	
	int maxWordAnalyzing = -1;
	boolean maxWordAnalyzingIsParsed = false;
	try {
		maxWordAnalyzing = Integer.parseInt(maxWordAnalyzingString);
		maxWordAnalyzingIsParsed = true;
	} catch (NumberFormatException nfe) {
		//suppress nfe
	}

	if (submitted) {
		if (!language.trim().equals("") && !webServiceUrl.trim().equals("")
	    		&& !passwordValue.trim().equals("") && !usernameValue.trim().equals("")  
	    		&& maxWordAnalyzingIsParsed && (maxWordAnalyzing > -1) ) {
	        description.put("serviceUrl", webServiceUrl);
	        description.put("language", language);
	        description.put("username", usernameValue);
	        description.put("password", passwordValue);
	        description.putInt("maxWordAnalyzing", maxWordAnalyzing);

	        response.sendRedirect(response.encodeRedirectURL("save.jsp"));
	    } 
	 	else {
	%>
	        <div class="error">Angaben sind nicht vollst&#x00E4;ndig oder falsch!</div>
	    	<br />
	<%
	    }
	} else if(!submitted && description.get("language") != null) {
	    language = (String) description.get("language");
	    webServiceUrl = (String) description.get("serviceUrl");
	    usernameValue = (String) description.get("username");
	    passwordValue = (String) description.get("password");
	    maxWordAnalyzingString = description.getInt("maxWordAnalyzing");
	}

	%>	
	
			<table class="table" width="400" align="center">
				<tr>
					<td colspan="2" class="tablehead">WebService Daten</td>
				</tr>
				<tr>
					<td class="tableCell" width="100">WebService-URL:</td>
					<td class="tableCell">
						<input type="text" name="webServiceUrl" value="<%=webServiceUrl%>" style="width:100%"/>
					</td>
				</tr>
				<tr>
				<td class="tableCell" width="100">maximal zu analysierende W&#x00F6;rter:</td>
				<td class="tableCell">
					<input type="text" name="maxWordAnalyzing" value="<%=maxWordAnalyzingString%>" style="width:100%"/>
				</td>
				</tr>
				<tr>
				<td class="tableCell" width="100">Benutzername:</td>
				<td class="tableCell">
					<input type="text" name="usernameValue" value="<%=usernameValue%>" style="width:100%"/>
				</td>
				</tr>
				<tr>
				<td class="tableCell" width="100">Kennwort:</td>
				<td class="tableCell">
					<input type="<% if (passwordValue.trim().equals("")) { %>text<% } else { %>password<% } %>" name="passwordValue" value="<%=passwordValue%>" style="width:100%"/>
				</td>
				</tr>
				<tr>
				<td class="tableCell" width="100">Sprache:</td>
				<td class="tableCell">
					<input type="text" name="language" value="<%=language%>" style="width:100%"/>
				</td>
			</tr>
			</table>
			<br />
			<table class="table" align="center">					
			<tr align="center">
				<td>
					<input type="button" name="back" value="Zur&#x00FC;ck" onclick="history.back()"/>
				</td>
				<td>
					<input type="button" name="cancel" value="Abbrechen" onclick="window.location.href='<%=response.encodeURL("../step1/index.jsp")%>'"/>						
				</td>
				<td>
					<input type="hidden" name="submitted" value="true">
					<input type="submit" value="Weiter" />
				</td>
			</tr>
			</table>
		</form>
</center>
</body>
<!-- ingrid-iplug-admin-step1-sns -->
</html>
