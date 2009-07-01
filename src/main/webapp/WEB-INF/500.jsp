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