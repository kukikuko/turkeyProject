<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lecture.dao.LectureDao"%>
<%@page import="lecture.dto.LectureInfo"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	LectureDao ld = new LectureDao();
	
	int lectureno = 0;
	if(request.getParameter("value") != null){
		lectureno = Integer.parseInt(request.getParameter("value"));
	}

	ld.deleteTempLecture(lectureno);

%>
<script>
					alert('삭제되었습니다.')
					location.href = "addLectureAdmin.jsp";
			</script>

</body>
</html>