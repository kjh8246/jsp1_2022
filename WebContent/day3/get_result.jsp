<%@page import="koreait.vo.HrdMember"%>
<%@page import="koreait.dao.HrdMemberDao"%>
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
		out.print("<br>");
		int no=0;
		
		if(custno == null){   //?custno 자체가 없을때  http://localhost:8081/jsp1/day3/get_result.jsp
			out.print("<script>alert('검색값이 없습니다.');location.href='get_test.jsp';");
			out.print("</script>");
		}else {
			try{
				no = Integer.parseInt(custno);
			}catch(NumberFormatException e) {
		//form 태그 조회값 없이 실행됬을 때 http://localhost:8081/jsp1/day3/get_result.jsp?custno=
				out.print("<script>alert('잘못된 검색값입니다.');location.href='get_test.jsp';");
				out.print("</script>");
			}
		}
		
		HrdMemberDao dao = HrdMemberDao.getInstance();
		HrdMember member = dao.selectOne(no);
		out.print(member);
	%>
	<button onclick="history.back()">뒤로가기</button>
</body>
</html>