<%@page import="java.io.PrintWriter"%>
<%@page import="lecture.dto.LectureInfo"%>
<%@page import="java.util.*"%>
<%@page import="lecture.dao.LectureDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<!-- 옵션과 검색어를 파라미터로 LectureDao에 전달합니다. -->
<!-- 쿼리문을 파라미터랑 잘 조합하고 유효성을 걸어서 작성. -->
<!-- 유효성은 옵션과 검색어 둘중 하나를 입력안하면 검색어결과거 없다는 알림이 뜹니다. -->
<!-- 조건에 맞게 리스트가 화면에 출력되고. 수강신청 버튼을 누르면 디테일페이지로 넘어갑니다. -->
<%@ include file="Navbar.jsp"%>
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
				LectureDao lectureDao = new LectureDao();
				List<LectureInfo> list = lectureDao.getSearch(request.getParameter("searchField"), request.getParameter("searchText"));
				if (list.size() == 0) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('검색결과가 없습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				for (int i = 0; i < list.size(); i++) {
			%>
				<tr>
					<td><%=list.get(i).getDepartment()%></td>
					<td><%=list.get(i).getSubjectNumber()%></td>
					<td><%=list.get(i).getSubjectName()%></td>
					<td><%=list.get(i).getClassTime()%></td>
					<td><%=list.get(i).getLectureRoom()%></td>
					<td><%=list.get(i).getProfessor()%></td>
					<td><%=list.get(i).getLectureCredit()%></td>
					<td><%=list.get(i).getSubscriptioLimit() - list.get(i).getCurrentStudent()%></td>
    	    		<td><%=list.get(i).getSubscriptioLimit()%></td>
					<td><button type="button" class="btn btn-primary"
							onclick="location.href='lectureDeatail.jsp?indexId=<%=list.get(i).getIndexId()%>'">수강신청</button>
					<td>
				</tr>

			<%
				}
			%>
			</tbody>
		</table>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>