<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="lecture.dao.LectureDao"%>
<%@ page import="lecture.dto.LectureInfo"%>
<%@ page import="lecture.dto.StudentInfo"%>
<%@ page import="java.util.*"%>
<%request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의정보 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>


	<%
	LectureDao lectureDao = new LectureDao();
	List<LectureInfo> lectureInfoList = lectureDao.selectLectureInfoList();
	StudentInfo si = new StudentInfo();
%>

<nav class="navbar navbar-expand-lg bg-light">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNavAltMarkup"
			aria-controls="navbarNavAltMarkup" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<div class="navbar-nav">
				<a class="nav-link" href="addLectureAdmin.jsp">강의 승인</a>
			</div>
			<div class="navbar-nav">
				<a class="nav-link" href="adminLectureList.jsp">강의 수정</a>
			</div>
			<!-- 검색기능 보이는곳 -->
		<div class="navbar-nav" >
			<form method="post" name="search" action="adminSearch.jsp">
				<table class="pull-right">
					<tr>
						<td><select class="form-control" name="searchField">
								<option value="0">선택</option>
								<option value="department">학과</option>
								<option value="subjectName">과목명</option>
								<option value="professor">교수명</option>
						</select></td>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="searchText" maxlength="100"></td>
						<td><button type="submit" class="btn btn-success">검색</button></td>
					</tr>
				</table>
			</form>
		</div>
		</div>
	</nav>



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
    	    	<td><%=info.getSubjectName()%></td>
    	    	<td><%=info.getClassTime()%></td>
    	    	<td><%=info.getLectureRoom()%></td>
    	    	<td><%=info.getProfessor()%></td>
				<td><button type="button" class="btn btn-primary"
						onclick="location.href='updateLecture.jsp?indexId=<%=info.getIndexId()%>'">수정하기</button>
				<td>
    	    </tr>
    <%    			
    		}
    	}
    %>


		</tbody>
	</table>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>