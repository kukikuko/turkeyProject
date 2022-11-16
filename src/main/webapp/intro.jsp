<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="head.jsp"%>
<link href="MainCss.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>


<body>
<div class = 'main' style = "background-image : url('./img/2.jpg'); background-position: cover;
width : 100vw; height: 100vh; background-repeat: no-repeat; background-color: #212529">  
			

	
	
	<div class="login-wrap" >
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
						</div>
						<div class="group">
							<input type="submit" class="button" value="Sign In">
						</div>
						<div class="hr"></div>
						<div class="foot-lnk">
							<a href="#forgot">Forgot Password?</a>
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
	
	    
	      
	    
	  
	
	
	
</div>



<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>



</body>

<%@ include file="footer.jsp"%>
</html>
