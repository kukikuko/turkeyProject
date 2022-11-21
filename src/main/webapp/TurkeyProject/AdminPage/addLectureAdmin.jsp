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
<!-- addLectureAdmin.jsp에서는 교수가 개설신청한 과목을 보여주고 관리자는 이것을 -->
<!-- 승인 또는 삭제 할 수 있습니다. 승인하기를 누르면 강의개설에 필요한 파라미터들을 가지고 -->
<!-- addLectureAdmin1_proc.jsp로 이동해서 LectureDao.insertLectureInfoAdmin을 실행 -->
<!-- 실행된 결과는 학생과 교수의 강의목록 화면에 생성됩니다. -->
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
				<th scope="col">학점</th>
				<th scope="col">삭제</th>
				<th scope="col">승인</th>
			</tr>
		</thead>
		<tbody>

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
				<td><%=createLectureList.get(i).getLectureCredit()%></td> 
				
				<td><form name = "Admin<%=i%>" method="post" 
				action="./addLectureAdmin_proc.jsp?value=<%=createLectureList.get(i).getIndexId()%>">
				<button type="submit"> 반려하기</button></form></td>
				
				<td><form name = "Admin<%=i%>" method="post" 
				action="./addLectureAdmin_proc1.jsp?value=<%=i%>">
				<button type="submit"> 승인하기</button></form></td>
			</tr>
			
		<%    			
	   			}
	   		}
		%>
		
		</tbody>
	</table>
</body>
</html>