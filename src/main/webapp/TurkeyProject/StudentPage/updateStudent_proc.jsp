<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="lecture.dto.LectureInfo"%>
<%@page import="lecture.dao.LectureDao"%>
<%@page import="dao.Userdao"%>
<%@page import="dao.User"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		Userdao Ud = new Userdao();
		String name = null;
		String email = null;
		String pn = null;

		if(request.getParameter("updateName").equals("")) {
			name = Ud.selectStudent().getUserName();
		} else {
			name = request.getParameter("updateName");
		}
		
		if(request.getParameter("updateEmail").equals("")){
			email = Ud.selectStudent().getUserEmail(); 
		} else {
			email = request.getParameter("updateEmail");
		}
		
		if(request.getParameter("updatePn").equals("")){
			pn = Ud.selectStudent().getUserPhoneNumber();
		} else {
			pn = request.getParameter("updatePn");	
		}		
		
		Ud.updateStudent(name, email, pn);
	%>
	
			<script>
					alert('수정되었습니다.')
					location.href = "index.jsp";
			</script>
		
</body>
</html>