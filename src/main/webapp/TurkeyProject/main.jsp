<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.Userdao"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<link href="CSS/MainCss.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<!--	프로젝트 시작점 -->
	<!-- 	학생 로그인과 회원가입을 하는 화면입니다 -->
	<!-- 	상단SIGN UP을 클릭하고 -->
	<!-- 	아이디 비밀번호 이름 이메일 전화번호를 적은 다음 -->
	<!-- 	하단SIGN UP을 클릭하면 addPerson_proc.jsp로 넘어가고 -->
	<div class="login-wrap">
		<div class="login-html">
			<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
				for="tab-1" class="tab">Sign In</label> <input id="tab-2"
				type="radio" name="tab" class="sign-up"><label for="tab-2"
				class="tab">Sign Up</label>
			<div class="login-form">
				<form name="loginForm" action="login_proc.jsp" method="post">
					<div class="sign-in-htm">
						<div class="group">
							<label for="user" class="label">아이디</label> <input id="user"
								name="userId" type="text" class="input">
						</div>
						<div class="group">
							<label for="pass" class="label">비밀번호</label> <input id="pass"
								name="userPw" type="password" class="input" data-type="password">
						</div>
						<div class="group">
							<input id="check" type="checkbox" class="check" checked>
							<label for="check"><span class="icon"></span> Keep me
								Signed in</label> <input type="radio" name="chk_info" value="학생" checked>학생
							<input type="radio" name="chk_info" value="교수">교수 <input
								type="radio" name="chk_info" value="관리자">관리자
						</div>
						<!-- 						main.jsp 상단의 SIGN IN 에서는 아이디와 비밀번호를 기입하고 -->
						<!-- 						비밀번호 하단에는 학생 교수 관리자 타입을 선택할 수 있습니다. -->
						<!-- 						폼을 작성 후 SIGN IN 버튼을 누르면 login_proc.jsp으로 이동 -->
						<div class="group">
							<input type="submit" class="button" value="Sign In">
						</div>
						<!-- 						올바르게 SIGN IN 을 할 경우 학생 교수 관리자 타입에 맞는 JSP 페이지로 이동합니다. -->
						<!-- 						각 페이지로 이동할 때 userId를 id값으로 같이 가져갑니다. -->
						<div class="hr"></div>
					</div>
				</form>
				<form name="addPersonForm" action="addPerson_proc.jsp" method="post">
					<div class="sign-up-htm">
						<div class="group">
							<label for="user" class="label">아이디</label> <input id="user"
								name="userId" type="text" class="input">
						</div>
						<div class="group">
							<label for="pass" class="label">비밀번호</label> <input id="pass"
								name="userpw" type="password" class="input" data-type="password">
						</div>
						<div class="group">
							<label for="pass" class="label">이름</label> <input name="userName"
								id="pass" type="text" class="input">
						</div>
						<div class="group">
							<label for="pass" class="label">이메일</label> <input
								name="userEmail" id="pass" type="text" class="input">
						</div>
						<div class="group">
							<label for="pass" class="label">전화번호</label> <input name="userPN"
								id="pass" type="text" class="input">
						</div>
						<div class="group">
							<input type="submit" class="button" value="Sign Up">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>