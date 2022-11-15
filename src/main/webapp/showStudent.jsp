<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lecture.dao.LectureDao"%>
<%@page import="lecture.dto.StudentInfo"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생정보 보여주기</title>
</head>
<body>
<h1>학생정보 보여주기</h1>
	<%
		int id = Integer.parseInt(request.getParameter("indexId"));
		LectureDao lectureDao = new LectureDao();
		List<StudentInfo> studentList = lectureDao.showStudent(id);
	%>


	<table class="table">
		<thead>
			<tr>
				<th scope="col">학생 이름</th>
				<th scope="col">학생 이메일</th>
				<th scope="col">학생 전화번호</th>
				
				
			</tr>
		</thead>
		<tbody>
		<% for (int i=0; i<studentList.size(); i++) { %>

			<tr>
				<td><%=studentList.get(i).getName()%></td>
				<td><%=studentList.get(i).getEmail()%></td>
				<td><%=studentList.get(i).getPn()%></td>
				
			</tr>	
<% } %>
		</tbody>
	</table>


	



</body>
</html>