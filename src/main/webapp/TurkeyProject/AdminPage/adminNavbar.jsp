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
		<div class="collapse navbar-collapse" id="navbarNav">
<!-- 개설 대기 버튼을 누르면 addLectureAdmin.jsp로 이동합니다. -->
			<div class="navbar-nav">
				<a class="nav-link" href="addLectureAdmin.jsp">개설 대기</a>
			</div>
<!-- 강의수정 버튼을 누르면. 학생계정과 마찬가지로 강의목록들이 SELECT되고. -->
<!-- 특정 강의의 정보를 수정 할 수 있습니다. -->
			<div class="navbar-nav">
				<a class="nav-link" href="adminLectureList.jsp">강의 수정</a>
			</div>
<!-- 관리자 계정은 삭제되지 않고 그냥 main.jsp로 이동합니다. -->
			<button onclick="location.href='../main.jsp?'">로그아웃</button>
		</div>
	</nav>

</body>
</html>