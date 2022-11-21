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