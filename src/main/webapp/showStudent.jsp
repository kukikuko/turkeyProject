<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="lecture.dao.LectureDao"%>
<%@page import="lecture.dto.StudentInfo"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>학생정보 보여주기</title>
</head>
<body>
	<h1>학생정보 보여주기</h1>
	<%
		int id = Integer.parseInt(request.getParameter("indexId"));
		LectureDao lectureDao = new LectureDao();
		List<StudentInfo> studentList = null;
		if(!lectureDao.showStudent(id).isEmpty()) {
			studentList = lectureDao.showStudent(id);
	%>


	<table class="table">
		<thead>
			<tr>
				<th scope="col">학생 이름</th>
				<th scope="col">학생 이메일</th>
				<th scope="col">학생 전화번호</th>
				<th scope="col">학생 성적</th>
				<th scope="col"><button type="submit" form = "gradeForm">성적 저장</button></th>
			</tr>
		</thead>
		<tbody>

		<form name="gradeForm" action="studentGrade_proc.jsp" method="post" id = "gradeForm">
		<% 

			for (int i=0; i<studentList.size(); i++) { 
		
		%>

			<tr>
				<td><%=studentList.get(i).getName()%></td>
				<td><%=studentList.get(i).getEmail()%></td>
				<td><%=studentList.get(i).getPn()%></td>
				<td><%=studentList.get(i).getGrade()%></td>
				<td>
					<select id="changeGrade<%=i%>" name="changeGrade<%=i%>">
					<option disabled selected>성적</option>
					<option value="A+">A+</option>
					<option value="A">A</option>
					<option value="A-">A-</option>
					<option value="B+">B+</option>
					<option value="B">B</option>
					<option value="B-">B-</option>
					<option value="C+">C+</option>
					<option value="C">C</option>
					<option value="C-">C-</option>
					<option value="D">D</option>
					<option value="F">F</option>
					</select>
				</td>
				<input type="hidden" name="id<%=i%>" value="<%=studentList.get(i).getId()%>">
				<input type="hidden" name="grade<%=i%>" value="<%=studentList.get(i).getGrade()%>">
			</tr>	
			<% 		
			}
			%>
			<input type="hidden" name="size" value="<%=studentList.size()%>">
			<input type="hidden" name="index" value="<%=id%>">
		</form>	
		</tbody>
	</table>

	<% 
		} else if(lectureDao.showStudent(id).isEmpty()) {
	%>
	<p>학생없음</p>
	<% 
		}
	%>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>