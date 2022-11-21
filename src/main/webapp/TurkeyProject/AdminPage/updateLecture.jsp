<%@page import="lecture.dto.LectureInfo"%>
<%@page import="lecture.dao.LectureDao"%>
<%@page import="lecture.dto.Prof"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.Lecture"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 정보 업데이트</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>
	<%@ include file="adminNavbar.jsp"%>
	<h2>강의정보 업데이트</h2>

	<%
		int id = Integer.parseInt(request.getParameter("indexId"));
		LectureDao lectureDao = new LectureDao();
		LectureInfo lectureInfo = lectureDao.selectPersonInfoListByIndexId((id));
		Lecture lecture = new Lecture();
		
		
		List<Prof> proflist = lectureDao.selectProf(lectureInfo.getDepartment());
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
				<th scope="col">옵션</th>
			</tr>
		</thead>

		<tbody>
			<form name="deleteButton1">

				<tr>
					<td><%=lectureInfo.getDepartment()%></td>
					<td><%=lectureInfo.getSubjectNumber()%></td>
					<td><%=lectureInfo.getSubjectName()%></td>
					<td><%=lectureInfo.getClassTime()%></td>
					<td><%=lectureInfo.getLectureRoom()%></td>
					<td><%=lectureInfo.getProfessor()%></td>
					<td><button id="deleteButton" name="updatelecture2"
							value="<%=lectureInfo.getIndexId()%>">삭제하기</button> <input
						type="hidden" name="index_3" value="<%=lectureInfo.getIndexId()%>"
						required></td>

				</tr>
			</form>
		</tbody>



	</table>
	<form name="personDetailForm">

		<div class="input-group mb-3">
			<input type="text" class="form-control" placeholder="변경할 과목명"
				aria-label="Recipient's username" aria-describedby="button-addon2"
				name="updatelecture1" value=""> 
			<input type="hidden" name="index_1" value="<%=lectureInfo.getIndexId()%>" required>

			<select class="form-control" name="profSelect">
				<option  value="0">교수선택</option>
	<%
			for(Prof p : proflist){
	%>
				<option value="<%=p.getName()%>"><%=p.getDept()%> {{{<%=p.getName()%>}}}
				</option>
	<% 	
			};
	%>
			</select>

			<button class="btn btn-outline-secondary" type="button"
				id="button-addon3">변경하기</button>

		</div>




	</form>

	<script>
	
		document.getElementById('button-addon3').addEventListener('click', (e)=>{
			e.preventDefault();
			let form = document.personDetailForm;
			if(form.updatelecture1.value == "" && form.profSelect.value == 0){//이름이 없는 경우
				alert('과목명 또는 교수진을 변경해주세요');
				form.updatelecture1.focus();
				return false;
			}else{//이름이 있는 경우
				if(confirm('강의정보를 수정하시겠습니까?')){
					form.action = "updateLecture_proc.jsp";
					form.submit();
				}
			}
		});
		
		document.getElementById('deleteButton').addEventListener('click', (e)=>{
			e.preventDefault();
			let form = document.deleteButton1
			var del = confirm("정말 삭제 하시겠습니까?");
			
			if(del == true){
				alert('삭제 되었습니다.')
				form.action = "deleteLecture_proc.jsp";
				form.submit();
			}
			else{
				alert("취소 되었습니다.");
			}
			
			});
		
</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>