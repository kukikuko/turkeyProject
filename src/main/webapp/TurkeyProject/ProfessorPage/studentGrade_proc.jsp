<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.Userdao"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학점부여</title>

<%
	int size = Integer.parseInt(request.getParameter("size"));
	Userdao ud = new Userdao();
	
	for(int i=0; i<size; i++) {
		String grade = request.getParameter("grade"+i);
		if(request.getParameter("changeGrade"+i) != null) {
			 grade = request.getParameter("changeGrade"+i);
		}
		String id = request.getParameter("id"+i);
		String index = request.getParameter("index");
		
		ud.updateStudentGrade(grade, id, index);
	}
%>
		<script>
				alert('수정되었습니다.')
				location.href = "profDetail.jsp";
		</script>
</body>
</html>