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
<title>Insert title here</title>
</head>
<body>


	<%
	LectureDao lectureDao = new LectureDao();
	List<LectureInfo> lectureInfoList = lectureDao.professorInfo();
	
	
	Userdao ud = new Userdao();
	int profno = ud.selectLoginProf();		
	
	%>
	<h3><%=lectureInfoList.get(0).getProfessor()%></h3>
	<h5>교수님의 강의</h5>
	<div style = "text-align : right">
	<button onclick = "location.href ='addLectureProfessor.jsp?profno=<%=profno%>'">강의 개설</button>
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