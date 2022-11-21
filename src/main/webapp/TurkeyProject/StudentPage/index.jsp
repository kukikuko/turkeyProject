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
<title>강의정보</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>
<!-- 학생으로 로그인 후 index.jsp화면으로 넘어옵니다. -->
<!-- index.jsp 화면의 상단에는 미리 만들어둔 Navbar가 보여집니다. -->
<!-- Navbar는 전체 강의목록 / 로그인한 유저의 수강신청목록 / 검색창 / 개인정보수정 -->
<!-- 이 있습니다. -->
	<%@ include file="Navbar.jsp"%>

<!-- 강의목록을 보여주기 위해 LectureDao에 클래스를 만든 후  -->
<!-- SQL에서 실행할 SELECT 쿼리문작성하고 값을 저장 후 학생들에게 필요한 정보를 제공합니다. -->
	<%
	LectureDao lectureDao = new LectureDao();
	List<LectureInfo> lectureInfoList = lectureDao.selectLectureInfoList();
	StudentInfo si = new StudentInfo();
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
				<th scope="col">잔여인원</th>
				<th scope="col">정원</th>
			</tr>
		</thead>

		<tbody>
	<%
    	if(lectureInfoList != null && lectureInfoList.size()>0 ){
    		for(LectureInfo info : lectureInfoList){
	%>
<!-- 강의정보 옆에는 수강신청 버튼이 있고 특정 강의의 수강신청 버튼 클릭시. -->
<!-- 특정강의의 인덱스 번호를 읽어서 해당 데이터만 특정해서 보여주는 디테일페이지로 넘어오고. -->
<!-- 디테일 페이지에서 수강신청 버튼을 클릭 시 추가성공 알람이 뜨고 -->
<!-- 수강신청 목록에는 로그인한 계정이 신청한 강의가 생성됩니다. -->
			<tr>
				<td><%=info.getDepartment()%></td>
				<td><%=info.getSubjectNumber()%></td>
				<td><%=info.getSubjectName()%></td>
				<td><%=info.getClassTime()%></td>
				<td><%=info.getLectureRoom()%></td>
				<td><%=info.getProfessor()%></td>
				<td><%=info.getLectureCredit()%></td>
				<td><%=info.getSubscriptioLimit() - info.getCurrentStudent()%></td>
				<td><%=info.getSubscriptioLimit()%></td>
<!-- 강의정보 옆에는 수강신청 버튼이 있고 특정 강의의 수강신청 버튼 클릭시 -->
<!-- 강의정보의 indexId를 가지고 lectureDeatail.jsp 로 이동합니다. -->
				<td><button type="button" class="btn btn-primary"
						onclick="location.href='lectureDeatail.jsp?indexId=<%=info.getIndexId()%>'">수강신청</button>
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