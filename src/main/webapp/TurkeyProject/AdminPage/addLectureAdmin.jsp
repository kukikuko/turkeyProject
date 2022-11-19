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
<%@ include file="adminNavbar.jsp"%>


	<%
	LectureDao lectureDao = new LectureDao();
	List<LectureInfo> createLectureList = lectureDao.createLecture();
	LectureInfo li = new LectureInfo();
%>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">학과</th>
				<th scope="col">과목번호</th>
				<th scope="col">과목명</th>
				<th scope="col">수업시간</th>
				<th scope="col">강의실</th>
				<th scope="col">교수진</th>
				<th scope="col">삭제</th>
				<th scope="col">승인</th>
			</tr>
		</thead>
		<tbody></tbody>

			<%
   			if(createLectureList != null && createLectureList.size()>0 ){
   			for(int i = 0; i<createLectureList.size();i++){
		%>
			
			
			<tr> 
				<td><%=createLectureList.get(i).getDepartment()%></td>
				<td><%=createLectureList.get(i).getSubjectNumber()%></td>
				<td><%=createLectureList.get(i).getSubjectName()%></td> 
				<td><%=createLectureList.get(i).getClassTime()%></td> 
				<td><%=createLectureList.get(i).getLectureRoom()%></td> 
				<td><%=createLectureList.get(i).getProfessor()%></td> 
				
				<td><form name = "Admin<%=i%>" method="post" 
				action="./addLectureAdmin_proc.jsp?value=<%=createLectureList.get(i).getIndexId()%>">
				<button type="submit"> 삭제하기</button></form></td>
				
				<td><form name = "Admin<%=i%>" method="post" 
				action="./addLectureAdmin_proc1.jsp?value=<%=i%>">
				<button type="submit"> 승인하기</button></form></td>
			</tr>
			
			
			<%    			
	   		}
	   	}
					
	   %>
		
		<tbody>
	</table>
</body>
</html>