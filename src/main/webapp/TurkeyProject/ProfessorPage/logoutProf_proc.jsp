`<%@page import="dao.Userdao"%>
<%@page import="dao.User"%>
<%@page import="lecture.dao.LectureDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
<!-- 각 페이지의 상단에는 로그아웃 버튼이 있고 현재 로그인 되어있는 테이블을 -->
<!-- delete하고 로그인 페이지로 돌아갑니다. -->
	<%
		Userdao user = new Userdao();
		int reusult = user.deleteProf();
		if(reusult > 0) {
	%>
		<script>
			alert('로그아웃 되었습니다.')
			location.href = "../main.jsp";
		</script>			
	<%
		}
	%>
</body>
</html>