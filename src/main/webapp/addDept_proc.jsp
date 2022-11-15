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
		int id = Integer.parseInt(request.getParameter("id"));
		int result = personDao.insertDept(id);
		
		if(result > 0) {
	%>
	<script>alert('추가 성공')</script>
	<%		
		} else {
	%>
	<script>alert('이미 존재하는 아이디입니다!')</script>
	<%		
		}
	%>
	<script>location.href = "index.jsp"</script>
</body>
</html>