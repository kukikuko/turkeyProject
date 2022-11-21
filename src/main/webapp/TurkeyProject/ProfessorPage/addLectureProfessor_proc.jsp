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
<title>강의신청proc</title>
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
			
			int CTSH = Integer.parseInt(classTimeStarthour);
			int CTSM = Integer.parseInt(classTimeStartminute);
			int CTFH = Integer.parseInt(classTimeFinishthour);
			int CTFM = Integer.parseInt(classTimeFinishtminute);
			
			int time = CTFH * 100 + CTFM - CTSH * 100 - CTSM;
			int credit = 0;
			
			if(time < 200) {
				credit = 1;
			} else if(time < 300) {
				credit = 2;
			} else {
				credit = 3;
			}
			
			String classTime = classTimeDay + " " + classTimeStarthour + ":" + classTimeStartminute +
				"~" + classTimeFinishthour + ":" + classTimeFinishtminute;
			
		Ud.insertCreateLecture(subjectName, classTime, lectureRoom, subjectNumber, credit);
	%>
	
		<script>
				alert('개설되었습니다.')
				location.href = "profDetail.jsp";
		</script>
</body>
</html>