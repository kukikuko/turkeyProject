<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.Userdao"%>
<%@ page import="dao.User"%>
<%@ page import="java.util.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Userdao personDao = new Userdao();
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
	
		int result = personDao.login(id, pw);
		
		if(result > 0) {
	%>
	<script>alert('로그인 성공')</script>
	<%		
		} else {
	%>
	<script>alert('로그인 실패')</script>
	<%		
		}
	%>
	<script>location.href = "main.jsp"</script>
</body>
</html>