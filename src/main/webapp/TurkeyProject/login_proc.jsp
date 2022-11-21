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
<title>로그인 처리</title>
</head>
<body>
	<!-- 	비밀번호가 틀리게 기입하면 로그인 실패 1이라는 알림이 뜹니다. -->
	<!-- 	아이디를 잘못 기입하거나. 로그인타입을 다르게 선택하면 -->
	<!-- 	로그인 실패 2라는 알림이 뜹니다. -->
	<!-- 	그외의 경우로 로그인이 실패하는 경우 로그인 실패 3이라는 알림이 뜹니다. -->
	<%
		Userdao personDao = new Userdao();
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		String type = request.getParameter("chk_info");
		int result = 0; 
		int loginResult = 0;
		
		if(type.equals("학생")) {
			result = personDao.studentLogin(id, pw);
			loginResult = 1;
		} else if(type.equals("교수")) {
			result = personDao.profLogin(id, pw);			
			loginResult = 2;
		} else if(type.equals("관리자")) {
			result = personDao.adminLogin(id, pw);			
			loginResult = 3;
		}
		if(result > 0) {
			if(loginResult == 1) {
				personDao.deleteloginDb();
				personDao.loginDb(id);
	%>
	<script>alert('학생 로그인 성공')</script>
	<script>location.href = 'StudentPage/index.jsp?<%=id%>';</script>
	<%		
			} else if(loginResult == 2){ 
	%>
	<script>alert('교수 로그인 성공')</script>
	<script>location.href = 'ProfessorPage/profDetail.jsp?<%=id%>';</script>
	<%
					personDao.deleteProf();
					personDao.insertProf(id);					
			} else if(loginResult == 3){ 
	%>
	<script>alert('관리자 로그인 성공')</script>
	<script>location.href = 'AdminPage/adminHome.jsp?<%=id%>';</script>
	<%
			}} else if(result == 0) {
	%>
	<script>alert('비밀번호를 확인 해주세요.')</script>
	<script>location.href = "main.jsp"</script>
	<%		
		} else if(result == -1) {
	%>
	<script>alert('아이디 또는 로그인 타입을 확인 해주세요.')</script>
	<script>location.href = "main.jsp"</script>
	<%	
		} else {
	%>
	<script>alert('로그인 실패')</script>
	<script>location.href = "main.jsp"</script>
	<%
		}; 
	%>
</body>
</html>