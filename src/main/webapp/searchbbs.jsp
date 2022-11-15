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
<title>Insert title here</title>
</head>
<body>
	<tbody>
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
					<td><button type="button" class="btn btn-primary"
							onclick="location.href='lectureDeatail.jsp?indexId=<%=list.get(i).getIndexId()%>'">수강신청</button>
					<td>
				</tr>

				<%
				}
				%>

			</tbody>
		</table>
</body>
</html>