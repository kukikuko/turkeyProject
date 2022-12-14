<%@page import="lecture.dto.LectureInfo"%>
<%@page import="lecture.dao.LectureDao"%>
<%@page import="dao.Userdao"%>
<%@page import="dao.User"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생정보 수정</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>
	<!-- userDao에 현재 로그인한 유저의 정보를 리턴하는 메소드를 만들고  -->
	<!-- 리턴결과를 생성자로 넘겨서 화면에 출력합니다. -->
	<!-- 개인정보는 이름 이메일 전화번호를 수정할 수 있습니다. -->
	<h1>학생정보 수정</h1>

	<%
	Userdao userDao = new Userdao();
	User user = new User();
	user = userDao.selectStudent();
	%>
	<div>

		<h4>
			※<%=user.getUserName()%>님의 개인 정보※
		</h4>
		<br />
		<p>
			이름 :
			<%=user.getUserName()%></p>
		<p>
			이메일 :
			<%=user.getUserEmail()%></p>
		<p>
			전화번호 :
			<%=user.getUserPhoneNumber()%></p>
		<br /> <br /> <br />
		<h4>※수정할 정보※</h4>

		<form name="updateStudent">

			<p>
				수정할 이름을 입력하세요 : <input name="updateName"></input>
			</p>

			<p>
				수정할 이메일을 입력하세요 : <input name="updateEmail"></input>
			</p>

			<p>
				수정할 전화번호를 입력하세요: <input name="updatePn"></input>
			</p>

			<button id="updateStudentInfoBtn">수정하기</button>
		</form>
	</div>
<!-- 3가지 정보를 입력 후 수정하기 버튼을 누르면 자바스크립트 -->
<!-- 이벤트 리스너를 통해서 유효성검사를 하고, 수정할 데이터가 공백이 아니면 -->
<!-- updateStudent_proc.jsp로 이동합니다. -->
	<script>
		document.getElementById('updateStudentInfoBtn').addEventListener('click', (e)=>{
			e.preventDefault();
			let form = document.updateStudent;
			if(form.updateName.value == "" && form.updateEmail.value == "" && form.updatePn.value == "" ){//이름이 없는 경우
				alert('수정할 정보를 입력해주세요.');
				form.updateName.focus();
				return false;
			}else{//이름이 있는 경우
				if(confirm('정보를 수정하시겠습니까?')){
					form.action = "updateStudent_proc.jsp";
					form.submit();
				}
			}
		});
	</script>



	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>