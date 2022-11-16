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
		String subject = request.getParameter("updatelecture");
		int index = Integer.parseInt(request.getParameter("index_1"));
		UpdateLecture up = new UpdateLecture();
		up.updateLecture(subject, index);
	%>
	
			<script>
					alert('수정되었습니다.')
					location.href = "index.jsp";
			</script>
		
	
	
</body>
</html>