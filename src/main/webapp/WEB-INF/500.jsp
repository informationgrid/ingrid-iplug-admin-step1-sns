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
<%
Throwable e = (Throwable) request.getAttribute("javax.servlet.error.exception");
e.printStackTrace();
%>
<html>
	<head>
		<link href="<%=response.encodeURL("error.css")%>" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<center>
		<br />
			<div class="error">
				<!-- error 'Internal Server Error'-->
				Diese Seite konnte auf Grund eines internen Fehlers nicht angezeigt werden.<br />
				Bitte versuchen Sie es zu einem sp&#x00E4;teren Zeitpunkt noch einmal.
			</div>
		</center>
	</body>
</html>
