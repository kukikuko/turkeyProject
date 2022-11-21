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
		int loginResult = 0;
		
// 		result = personDao.profLogin(id, pw);
		
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
// 					personDao.deleteProf();
// 					personDao.insertProf(id);
		
			}} else if(result == 0) {
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
		<script>location.href = "main.jsp"</script>
	<%
		}; 
		
		
	%>	
</body>
</html>