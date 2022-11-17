<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.Userdao"%>
<%@ page import="dao.User"%>
<%@page import="lecture.dto.LectureInfo"%>
<%@page import="lecture.dao.LectureDao"%>
<%@page import="lecture.dto.classTimeInfo"%>
<%@ page import="java.util.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Userdao personDao = new Userdao();
		int id = Integer.parseInt(request.getParameter("id"));
		LectureDao lectureDao = new LectureDao();
		LectureInfo lectureInfo = new LectureInfo();
		classTimeInfo ci = new classTimeInfo();
		
		
		List<LectureInfo> lectureInfoList = lectureDao.selectSugangLectureInfoList();
		List<classTimeInfo> ciList = lectureDao.selectClassTimeLectureInfoList();
		ci = lectureDao.selectClassTimeByIndexId(id);		
		
		boolean is = false;
		int addStTime = ci.getA1() * 1000 + ci.getA2();
		int addEdTime = ci.getB1() * 1000 + ci.getB2();

		for(int i=0; i<ciList.size(); i++) {
			int stTime = ciList.get(i).getA1() * 1000 + ciList.get(i).getA2();
			int edTime = ciList.get(i).getB1() * 1000 + ciList.get(i).getB2();
			if(ciList.get(i).getFirst().equals(ci.getFirst())) {
				if(addStTime <= stTime && stTime <= addEdTime) {
					is = true;
				}else if(addStTime <= edTime && edTime <= addEdTime) {
					is = true;
				}else if(stTime <= addStTime && addStTime <= edTime) {
					is = true;
				}else if(stTime <= addEdTime && addEdTime <= edTime) {
					is = true;
				}
			}else if(ciList.get(i).getFirst().equals(ci.getSecond())) {
				if(addStTime <= stTime && stTime <= addEdTime) {
					is = true;
				} else if(addStTime <= edTime && edTime <= addEdTime) {
					is = true;
				} else if(stTime <= addStTime && addStTime <= edTime) {
					is = true;
				} else if(stTime <= addEdTime && addEdTime <= edTime) {
					is = true;
				}
				
			}else if(ciList.get(i).getSecond().equals(ci.getFirst())) {
				if(addStTime <= stTime && stTime <= addEdTime) {
					is = true;
				} else if(addStTime <= edTime && edTime <= addEdTime) {
					is = true;
				} else if(stTime <= addStTime && addStTime <= edTime) {
					is = true;
				} else if(stTime <= addEdTime && addEdTime <= edTime) {
					is = true;
				}

			}else if(ciList.get(i).getSecond().equals(ci.getSecond())) {
				if(addStTime <= stTime && stTime <= addEdTime) {
					is = true;
				} else if(addStTime <= edTime && edTime <= addEdTime) {
					is = true;
				} else if(stTime <= addStTime && addStTime <= edTime) {
					is = true;
				} else if(stTime <= addEdTime && addEdTime <= edTime) {
					is = true;
				}
			}
			
		}
		
		out.println(is);
		if(is == false) {
		int result = personDao.insertDept(id);
		if(result > 0) {
	%>
	<script>alert('추가 성공')</script>
	<%		
		} else {
	%>
			<script>alert('같은 강의는 신청 할 수 없습니다.')</script>
		
	<%		
			}
		}  else {
	%>
			<script>alert('시간이 중복된 강의는 신청 할 수 없습니다.')</script>
	<% } %>
	<script>location.href = "index.jsp"</script>
</body>
</html>