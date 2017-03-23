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
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="de.ingrid.iplug.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="de.ingrid.utils.PlugDescription"%>
<%@ include file="timeoutcheck.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Arbeitsverzeichnis w&#x00E4;hlen</title>
		<link href="<%=response.encodeURL("css/admin.css")%>" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<%String error = "";
	        boolean process = WebUtil.getParameter(request, "processed", "false").equalsIgnoreCase("true");
			PlugDescription description = (PlugDescription)request.getSession().getAttribute("description");
          
			
			String workingDirectory = WebUtil.getParameter(request, "workingDirectory", "");
            if(workingDirectory.equals("") && description.getWorkinDirectory()!=null){
            	workingDirectory = description.getWorkinDirectory().getAbsolutePath();
            }
          	boolean createDir = WebUtil.getParameter(request, "createDir", null) != null;
        
            if (!workingDirectory.equals("") && process) {
                File file = new File(workingDirectory);
                if (!file.exists() && !createDir) {
                    error = "Der angegegebene Ordner existiert nicht.";
                } else if (!file.exists() && createDir) {
                    if (!file.mkdirs()) {
                        error = "Der angegebene Ordner konnte nicht erzeugt werden.";
                    } else {
                        description.setWorkinDirectory(file);
                    	response.sendRedirect(response.encodeRedirectURL("providerMetadata.jsp"));
                        return;
                    }
                } else {
                    description.setWorkinDirectory(file);
                    response.sendRedirect(response.encodeRedirectURL("providerMetadata.jsp"));
                    return;
                }
            }
          %>
	<form method="post" action="<%=response.encodeURL("selectWorkingFolder.jsp")%>">
			<input type="hidden" name="processed" value="true" />
			<input type="hidden" name="error" value="fileNotFound" />
 		<center>
			<div class="headline"><br />
				Arbeitsverzeichnis w&#x00e4;hlen
				<br /><br />
				<span class="byline">Bitte geben Sie den Pfad zum iPlug Arbeitsverzeichnis an.</span>
			</div>
			<br />
<!-- 
			<table class="table" align="center">					
				<tr align="center">
				<td>
					<input type="button" name="back" value="Zur&#x00FC;ck" onclick="history.back()"/>
				</td>
				<td>
					<input type="button" name="cancel" value="Abbrechen" onclick="window.location.href='<%=response.encodeURL("../step1/index.jsp")%>'"/>						
				</td>
				<td>
					<input type="submit" name="cont" value="Weiter" />
				</td>
				</tr>
			</table>
-->	
			<%if (!error.equals("")) {

                %>
			<div class="error">
				<%=error%>
			</div>
			<%}

            %>
 
				<table class="table" width="400" align="center">
					<tr>
						<td colspan="2" class="tablehead">
							Pfad zum Ordner
						</td>
					</tr>
					<tr>
						<td class="tablecell" width="100">
							Pfad:
						</td>
						<td class="tablecell">
								<input type="text" name="workingDirectory" value="<%=workingDirectory%>" style="width:100%" />
						</td>
					</tr>
					<tr>
						<td class="tablecell" width="100">
							Bei Bedarf erzeugen:
						</td>
						<td class="tablecell">
								<input type="checkbox" name="createDir" value="true" <%if(createDir) {%>checked="checked"<%}%> />
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
							<input type="submit" value="Weiter" />
						</td>
					</tr>
				</table>
		</center>
		</form>
	</body>
<!-- ingrid-iplug-admin-step1 -->
</html>
