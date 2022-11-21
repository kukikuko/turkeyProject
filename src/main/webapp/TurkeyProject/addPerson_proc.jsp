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
<title>회원가입 처리</title>
</head>
<body>
<!-- addPerson_proc.jsp에서 userId, userpw, userName, userEamil, userPN을 -->
<!-- request.getParameter로 받아서 만들어둔 User DTO로 보내고. -->
<!-- request한 user를 파라미터로 personDao.join(user) 을 진행. -->
	<%
		Userdao personDao = new Userdao();
		User user = new User();
		user.setUserID(request.getParameter("userId")) ;
		user.setUserPassword(request.getParameter("userpw"));
		user.setUserName(request.getParameter("userName")) ;
		user.setUserEmail(request.getParameter("userEmail")) ;
		user.setUserPhoneNumber(request.getParameter("userPN")) ;
		
// 		personDao.join(user)를 실행한 후 결과를 담아서 결과가 1이면 추가성공 알람이뜨고
// 		id에는 SQL테이블생성시 primary key를 걸어둬서 중복된 id를 생성시
// 		이미 존재하는 아이디입니다.  알람이뜹니다.
// 		추가에 성공하든 안하든 main페이지로 이동합니다.
		int result = personDao.join(user);	
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
	<script>location.href = "main.jsp"</script>
</body>
</html>