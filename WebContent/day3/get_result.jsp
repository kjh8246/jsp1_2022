<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day3 get 요청 처리</title>
</head>
<body>
	<%
		String custno = request.getParameter("custno");
		out.print("custno :");
		out.print(custno);
	%>
</body>
</html>