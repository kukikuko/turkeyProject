<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="lecture.dao.LectureDao"%>
<%@ page import="lecture.dto.LectureInfo"%>
<%@ page import="lecture.dto.StudentInfo"%>
<%@ page import="java.util.*"%>
<%request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-light">
		<a class="navbar-brand" href="adminHome.jsp">인덱스홈</a>

		<div class="collapse navbar-collapse" id="navbarNav">
			<div class="navbar-nav">
				<a class="nav-link" href="addLectureAdmin.jsp">강의 승인</a>
			</div>
			<div class="navbar-nav">
				<a class="nav-link" href="adminLectureList.jsp">강의 수정</a>
			</div>
		</div>
	</nav>

</body>
</html>