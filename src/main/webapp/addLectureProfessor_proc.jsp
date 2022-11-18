<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="lecture.dto.LectureInfo"%>
<%@page import="lecture.dao.LectureDao"%>
<%@page import="dao.Userdao"%>
<%@page import="dao.User"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		
		Userdao Ud = new Userdao();

			
			String subjectName = request.getParameter("insertSubject");
		
			String classTimeDay = request.getParameter("day");
			String classTimeStarthour = request.getParameter("starthour");
			String classTimeStartminute= request.getParameter("startminute");
			String classTimeFinishthour = request.getParameter("finishhour");
			String classTimeFinishtminute= request.getParameter("finishminute");
		
			String subjectNumber = request.getParameter("insertNumber");
			String lectureRoom = request.getParameter("insertRoom");	
			
			out.println(subjectNumber);
	
			String classTime = classTimeDay + " " + classTimeStarthour + ":" + classTimeStartminute +
				"~" + classTimeFinishthour + ":" + classTimeFinishtminute;
			
		Ud.insertCreateLecture(subjectName, classTime, lectureRoom, subjectNumber);
	%>
	
			<script>
					alert('개설되었습니다.')
					location.href = "profDetail.jsp";
			</script>
		
</body>
</html>