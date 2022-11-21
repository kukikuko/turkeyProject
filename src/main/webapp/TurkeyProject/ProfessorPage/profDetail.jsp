<%@page import="lecture.dto.LectureInfo"%>
<%@page import="lecture.dao.LectureDao"%>
<%@page import="dao.Userdao"%>
<%@page import="lecture.dto.ProfessorInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>교수 홈 화면</title>
</head>
<body>
<!-- profDetail.jsp페이지로 넘어오면 교수이름과 교수가 개설한 강의목록이 화면이 보이고. -->
<!-- 개설한 과목명을 클릭하면 indexid를 가지고 showStudent.jsp로 이동합니다. -->

	<%
	LectureDao lectureDao = new LectureDao();
	List<LectureInfo> lectureInfoList = lectureDao.professorInfo();
	
	Userdao ud = new Userdao();
	int profno = ud.selectLoginProf();		
	%>
	<h3><%=lectureInfoList.get(0).getProfessor()%></h3>
	<h5>교수님의 강의</h5>
	<button onclick="location.href='logoutProf_proc.jsp?'">로그아웃</button>
	<div style = "text-align : right">
<!-- 교수 로그인 후 profDetail에서 강의신청 버튼을 누르면 교수가 원하는 강의를 -->
<!-- 개설신청 할 수 있습니다. 개설신청 버튼을 누르면 addLectureProfessor.jsp로 이동합니다. -->
	<button onclick = "location.href ='addLectureProfessor.jsp?profno=<%=profno%>'">강의 신청</button>
	</div>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">학과</th>
				<th scope="col">과목번호</th>
				<th scope="col">과목명</th>
				<th scope="col">수업시간</th>
				<th scope="col">강의실</th>
				<th scope="col">교수진</th>
			</tr>
		</thead>

		<%
		for (LectureInfo l : lectureInfoList) {
		%>

		<tbody>
			<tr>
				<td><%=l.getDepartment()%></td>
				<td><%=l.getSubjectNumber()%></td>
				<td><button
					onclick="location.href='showStudent.jsp?indexId=<%=l.getIndexId()%>'"
					style="cusor: pointer"><%=l.getSubjectName()%></button></td>
				<td><%=l.getClassTime()%></td>
				<td><%=l.getLectureRoom()%></td>
				<td><%=l.getProfessor()%>
				<td>
			</tr>
		</tbody>

		<%
		}
		%>
	</table>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>