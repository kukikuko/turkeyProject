<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.Userdao"%>
<%request.setCharacterEncoding("UTF-8");%>
<link href="MainCss.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
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
								Signed in</label>
						<input type="radio" name="chk_info" value="학생" checked>학생 
						<input type="radio" name="chk_info" value="교수">교수
						<input type="radio" name="chk_info" value="관리자">관리자
						</div>
						<div class="group">
							<input type="submit" class="button" value="Sign In">
						</div>
						<div class="hr">
						</div>
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