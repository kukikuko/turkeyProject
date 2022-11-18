<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "lecture.dao.LectureDao"%>
<%@page import = "lecture.dto.LectureInfo"%>
<%@page import = "dao.UpdateLecture"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
		
		int index = Integer.parseInt(request.getParameter("index_3"));
		UpdateLecture up = new UpdateLecture();
		up.deleteLecture(index);
		

		
	%>
	
			<script>
					alert('삭제되었습니다.')
					location.href = "index.jsp";
			</script>
		
	
	
</body>
</html>