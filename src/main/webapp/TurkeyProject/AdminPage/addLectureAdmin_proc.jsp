<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="lecture.dao.LectureDao"%>
<%@page import="lecture.dto.LectureInfo"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<!-- addLectureAdmin_proc.jsp에서는 받아온 value를  -->
	<!-- LectureDao.deleteTempLecture로 전달하고. delete쿼리문을 실행 후 개설신청한 강의를 삭제합니다. -->
	<%
	LectureDao ld = new LectureDao();

	int lectureno = 0;
	if (request.getParameter("value") != null) {
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