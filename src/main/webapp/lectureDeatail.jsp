<%@page import="lecture.dto.LectureInfo"%>
<%@page import="lecture.dao.LectureDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 디테일</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="home.jsp">인덱스홈1</a>
    <button class="navbar-toggler" type="button" 
    		data-bs-toggle="collapse" 
    		data-bs-target="#navbarNavAltMarkup" 
    		aria-controls="navbarNavAltMarkup" 
    		aria-expanded="false" 
    		aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  </div>
</nav>
	
	
	<%
		int id = Integer.parseInt(request.getParameter("indexId"));
		LectureDao lectureDao = new LectureDao();
		LectureInfo lectureInfo = lectureDao.selectPersonInfoListByIndexId((id+1));
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
    </tr>
  </thead>
  <tbody>

	
    		<tr>
    	    	<td><%=lectureInfo.getDepartment()%></td>
    	    	<td><%=lectureInfo.getSubjectNumber()%></td>
    	    	<td><%=lectureInfo.getSubjectName()%></td>
    	    	<td><%=lectureInfo.getClassTime()%></td>
    	    	<td><%=lectureInfo.getLectureRoom()%></td>
    	    	<td><%=lectureInfo.getProfessor()%></td>
    	    	<td><button type="button" class="btn btn-primary" onclick="location.href='lectureDeatail.jsp'">수강신청</button><td>
    	    </tr>
    
    
  </tbody>
</table>
	
	
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>