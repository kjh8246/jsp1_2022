<%@page import="koreait.vo.HrdMember"%>
<%@page import="java.util.List"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day3 Hrd Member List</title>
</head>
<body>
	<%
		//테이블의 데이터 모두 가져오기
		HrdMemberDao dao = HrdMemberDao.getInstance();
		List<HrdMember> list = dao.selectAll();
	%>
	<h3>Hrd Member List</h3>
	<hr>
	<ul>
		<%
			for(int i=0;i<list.size();i++)  {
		%>
				<!-- 조회를 위해서 get 방식의 요청을 보냅니다.1) 요청 url 에 쿼리스트링으로 조회할 값을 전달합니다. 
						2) 검색값을 입력받아 처리할때에는 form 사용합니다. -->
				<li><a href=""><%=list.get(i).getCustNo() %></a>
					:<%=list.get(i).getCustName() %>
				</li>
		<%
			}
		%>
		
	</ul>
</body>
</html>