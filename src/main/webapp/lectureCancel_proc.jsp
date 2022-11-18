<%@page import="lecture.dao.LectureDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제중</title>
</head>
<body>
	<%
		//addPerson.jsp -> From 태그 양식 "name" -> submit->
		//action="addPerson_proc.jsp"
		int id = Integer.parseInt(request.getParameter("indexId"));
		LectureDao lectureDao = new LectureDao();
		int result = lectureDao.deleteLectureInfoById(id);
		if(result >0){
			
			lectureDao.MinusCurrentStudent(id);
		
	%>
		<script>
			alert('삭제되었습니다')
			location.href = "sugangIndex.jsp";
		</script>			
	<%
		}else{
	%>
		<script>
		alert('삭제실패했습니다')
		location.href = 'sugangIndex.jsp';
		</script>
	<%			
		}
	%>
</body>
</html>