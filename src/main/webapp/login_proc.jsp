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
		String type = request.getParameter("chk_info");
		int result = 0; 
		out.println(type);
		
// 		result = personDao.profLogin(id, pw);
		
		if(type.equals("학생")) {
			result = personDao.studentLogin(id, pw);
		} else if(type.equals("교수")) {
			result = personDao.profLogin(id, pw);			
		}
		
		if(result > 0) {
	%>
		<script>alert('로그인 성공')</script>
		<script>location.href = "index.jsp"</script>
	<%		
		} else if(result == 0) {
	%>
		<script>alert('로그인 실패1')</script>
		<script>location.href = "main.jsp"</script>
	<%		
		} else if(result == -1) {
	%>
		<script>alert('로그인 실패2')</script>
		<script>location.href = "main.jsp"</script>
	<%		
		} else {
	%>	
		<script>alert('로그인 실패3')</script>
	<%		
		};
	%>	
</body>
</html>