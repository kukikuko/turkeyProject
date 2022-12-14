<%@page import="java.io.StringReader"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.parser.JSONParser"%>
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
<title>수강신청 유효성검사</title>
</head>
<body>
	<!-- 수강신청에는 몇가지 유효성검사를 걸어두었습니다. -->
	<!-- 1. 같은 과목명으로 수강신청할 수 없습니다. (같은 과목명만 수강해서 졸업?? X) -->
	<!-- 2. 정원을 초과하면 수강신청 할 수 없습니다. -->
	<!-- 3. 각 학생은 18학점을 초과해서 수강신청 할 수 없습니다. -->
	<!-- 4. 요일과 시간을 겹쳐서 수강신청 할 수 없습니다. (같은시간 두공간에 존재X) -->
	<%
		Userdao personDao = new Userdao();
		int id = Integer.parseInt(request.getParameter("id"));
		LectureDao lectureDao = new LectureDao();
		LectureInfo lectureInfo = new LectureInfo();
	
		classTimeInfo ci = new classTimeInfo();
		User user = new User();
		
		List<LectureInfo> lectureInfoList = lectureDao.selectSugangLectureInfoList();
		List<classTimeInfo> ciList = lectureDao.selectClassTimeLectureInfoList();
		ci = lectureDao.selectClassTimeByIndexId(id);
		List<LectureInfo> subNumList = lectureDao.selectSubjectNumberinfoList();
		LectureInfo subNum = lectureDao.selectSubjectNumberByIndexId(id);
		List<LectureInfo> plus = lectureDao.selectPlusLecture_creditList();
		
		boolean sn = false;
		int a = 0;
		for(int i=0; i<subNumList.size(); i++){
			if(subNumList.get(i).getSubjectNumber().equals(subNum.getSubjectNumber())){
				sn=true;
				break;
			}
		}
		if(sn==true) {
	%>
	<script>
				alert('같은 강의는 신청 할 수 없습니다.')
				location.href = "index.jsp"
	</script>
	<%		
			}
		
		boolean isd = false;
		if(subNum.getCurrentStudent() >= subNum.getSubscriptioLimit()) {
				isd = true;
	%>
	<script>
				alert('정원이 초과되었습니다')
				location.href = "index.jsp"
	</script>
	<%	
		}

	
		boolean pl = false;
		int temp1 = 0;
		int temp2 = 18;
		
		for(int i = 0; i<plus.size(); i++){
			temp1 +=  plus.get(i).lectureCredit;			
			if(temp2 <= temp1){
				pl=true;
				break;
			}
		}
		if(pl==true){
	%>
		<script>
			alert('신청가능 학점을 초과했습니다.')
			location.href = "index.jsp"
		</script>
	<%		
			
		}
		
		
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
		
		boolean tc = false;
		if(is == false && sn==false && pl==false && isd == false) {
		int result = personDao.insertDept(id);
		if(result > 0) {
		
	%>
	<script>alert('추가 성공')</script>
	<%		
			lectureDao.PlusCurrentStudent(id);
			} 
		}  else {
	%>
	<script>alert('시간이 중복된 강의는 신청 할 수 없습니다.')</script>
	<%	} %>
	<script>location.href = "index.jsp"</script>
</body>
</html>