<%@page import="lecture.dto.LectureInfo"%>
<%@page import="java.util.List"%>
<%@page import="lecture.dao.LectureDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디별 수강신청한 목록을 보여주는 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-light">
    <a class="navbar-brand" href="home.jsp">인덱스홈</a>
    <button class="navbar-toggler" type="button" 
    		data-bs-toggle="collapse" 
    		data-bs-target="#navbarNavAltMarkup" 
    		aria-controls="navbarNavAltMarkup" 
    		aria-expanded="false" 
    		aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
	<div class="collapse navbar-collapse" id="navbarNav">
      <div class="navbar-nav">
        <a class="nav-link"  href="index.jsp">강의목록</a>
      </div>
      <div class="navbar-nav">
        <a class="nav-link"  href="sugangIndex.jsp">수강신청목록</a>
      </div>
  </div>
</nav>


<%
LectureDao lectureDao = new LectureDao();
List<LectureInfo> lectureInfoList = lectureDao.selectSugangLectureInfoList();
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
      <th scope="col">정원</th>
    </tr>
  </thead>
  <tbody>

    
    <%
    	if(lectureInfoList != null && lectureInfoList.size()>0 ){
    		for(LectureInfo info : lectureInfoList){
	%>
	
    		<tr>
    	    	<td><%=info.getDepartment()%></td>
    	    	<td><%=info.getSubjectNumber()%></td>
    	    	<td><button onclick="location.href='updateLecture.jsp?indexId=<%=info.getIndexId()%>'"><%=info.getSubjectName()%></button></td>
    	    	<td><%=info.getClassTime()%></td>
    	    	<td><%=info.getLectureRoom()%></td>
    	    	<td><%=info.getProfessor()%></td>
    	    	<td><%=info.getLectureCredit()%></td>
    	    	<td><%=info.getSubscriptioLimit()%></td>
    	    	
    	    	
    	    	<td><button type="button" class="btn btn-primary" onclick="location.href='lectureCancel_proc.jsp?indexId=<%=info.getIndexId()%>'">신청취소</button><td>
    	    </tr>
    <%    			
    		}
    	}
    %>
    
    
  </tbody>
</table>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>