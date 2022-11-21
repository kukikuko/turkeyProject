<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "lecture.dao.LectureDao"%>
<%@page import = "lecture.dto.LectureInfo"%>
<%@page import = "dao.UpdateLecture"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
		LectureDao lDao = new LectureDao();
	
		String subject = request.getParameter("updatelecture");
		int index = Integer.parseInt(request.getParameter("index_1"));
		String lectureName = request.getParameter("updatelecture1");
		String profName = request.getParameter("profSelect");
		
		LectureInfo lectureInfo = lDao.selectPersonInfoListByIndexId(index);
			
		if(lectureName.equals("")) {
			lectureName = lectureInfo.getSubjectName();
		}
		
		if(profName.equals("0")) {
			profName = lectureInfo.getProfessor();
		}
		
		
		
		
		UpdateLecture up = new UpdateLecture();
		up.updateLecture(lectureName, profName, index);
	%>
	
			<script>
					alert('수정되었습니다.')
					location.href = "adminLectureList.jsp";
			</script>
		
	
	
</body>
</html>