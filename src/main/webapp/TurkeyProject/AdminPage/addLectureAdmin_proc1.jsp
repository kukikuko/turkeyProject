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
	LectureDao ld = new LectureDao();
	List<LectureInfo> createLectureList = ld.createLecture();
	

	int lectureno = Integer.parseInt(request.getParameter("value"));
	
	out.println(lectureno);
	out.println(createLectureList.get(lectureno).indexId);
	
	
	int indexId = createLectureList.get(lectureno).indexId;
	String department = createLectureList.get(lectureno).department;
	String subjectName = createLectureList.get(lectureno).subjectName;
	String classTime = createLectureList.get(lectureno).classTime;
	String lectureRoom = createLectureList.get(lectureno).lectureRoom;
	String professor = createLectureList.get(lectureno).professor;
	String subjectNumber = createLectureList.get(lectureno).subjectNumber;
	
	out.println(subjectNumber + " " + indexId + " " + lectureno);
	
	ld.insertLectureInfoAdmin(department, subjectNumber, subjectName, classTime, lectureRoom, professor);

%>
<script>
					alert('승인되었습니다.')
					location.href = "addLectureAdmin.jsp";
</script> 
<% ld.deleteTempLecture(indexId); %>
</body>
</html>