<%@page import="lecture.dto.LectureInfo"%>
<%@page import="lecture.dao.LectureDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 디테일</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>
<%@ include file="Navbar.jsp"%>

<!-- 디테일 페이지는 받아온 indexid를 파라미터로 SELECT 쿼리를 진행. -->
<!-- 해당 인덱스의 강의만 보여줍니다. -->
<!-- 디테일 페이지에서 수강신청 버튼을 클릭시 index를 가지고 addDept_proc.jsp로 이동 합니다. -->
	<%
		int id = Integer.parseInt(request.getParameter("indexId"));
		LectureDao lectureDao = new LectureDao();
		LectureInfo lectureInfo = lectureDao.selectPersonInfoListByIndexId((id));
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

			<tr>
				<td><%=lectureInfo.getDepartment()%></td>
				<td><%=lectureInfo.getSubjectNumber()%></td>
				<td><%=lectureInfo.getSubjectName()%></td>
				<td><%=lectureInfo.getClassTime()%></td>
				<td><%=lectureInfo.getLectureRoom()%></td>
				<td><%=lectureInfo.getProfessor()%></td>
				<td><%=lectureInfo.getLectureCredit()%></td>
				<td><%=lectureInfo.getSubscriptioLimit() - lectureInfo.getCurrentStudent()%></td>
				<td><%=lectureInfo.getSubscriptioLimit()%></td>
<!-- 디테일 페이지는 받아온 indexid를 파라미터로 SELECT 쿼리를 진행. -->
<!-- 해당 인덱스의 강의만 보여줍니다. -->
<!-- 디테일 페이지에서 수강신청 버튼을 클릭시 index를 가지고 addDept_proc.jsp로 이동 합니다. -->
				<td>
					<form name="deptForm" action="addDept_proc.jsp" method="post">
						<button type="submit" class="btn btn-primary">수강신청</button>
						<input type="hidden" name="id" value="<%=id%>">
					</form>
				<td>
			</tr>
		</tbody>
	</table>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>