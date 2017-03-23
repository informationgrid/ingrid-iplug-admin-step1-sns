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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bearbeiten Modus w&#x00E4;hlen</title>
<link href="<%=response.encodeURL("css/admin.css")%>" rel="stylesheet" type="text/css" />
</head>
<body>
<center>
	<div class="headline">
		<br />Konfiguration geladen<br /><br />
		<span class="byline">Eine vorhandene Konfiguration konnte geladen werden. Bitte w&#x00E4;hlen Sie, ob Sie alle Einstellungen bearbeiten wollen oder nur die zeitgesteuerte Neuindizierung / sofortige Neuindizierung.</span>
	</div>
	<br />
	<form method="post" action="<%=response.encodeURL("selectWorkingFolder.jsp")%>">
		<table class="table" align="center">					
			<tr align="center">
				<td>
					<input type="submit" value="Alle Einstellungen bearbeiten"/>
				</td>
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
	</form>
</center>
</body>
</html>
