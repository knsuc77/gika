<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request Method</title>
</head>
<body>
	<h2>서버 도메인 이름 : <%=request.getServerName() %></h2>
	<h2>서버 포트 번호 : <%=request.getServerPort() %></h2>
	<h2>서버 URL 주소 : <%=request.getRequestURL() %></h2>
	<h2>서버 URI 주소 : <%=request.getRequestURI() %></h2>
	
</body>
</html>