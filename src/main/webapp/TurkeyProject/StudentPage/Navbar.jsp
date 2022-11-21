<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>

	<nav class="navbar navbar-expand-lg bg-light">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNavAltMarkup"
			aria-controls="navbarNavAltMarkup" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<div class="navbar-nav">
				<a class="nav-link" href="index.jsp">강의목록</a>
			</div>
			<div class="navbar-nav">
				<a class="nav-link" href="sugangIndex.jsp">수강신청목록</a>
			</div>

			<div class="navbar-nav">
				<a class="nav-link" href="gradeCheck.jsp">성적확인</a>
			</div>
			<!-- 검색기능 -->
			<!-- Navbar.jsp에는 강의목록 검색을 위한 기능이 포함되어있습니다. -->
			<!-- 선택을 클릭 후   학과 / 과목명 / 교수명  3가지 옵션으로 검색을 할 수 있습니다. -->
			<!-- 옵션 선택 후 검색어를 입력하고 검색 버튼을 누르면.  -->
			<!-- 검색할때 사용한 옵션과 검색어를 가지고 searchbbs.jsp로 이동합니다. -->
			<div class="navbar-nav">
				<form method="post" name="search" action="searchbbs.jsp">
					<table class="pull-right">
						<tr>
							<td><select class="form-control" name="searchField">
									<option value="0" disabled>선택</option>
									<option value="department">학과</option>
									<option value="subjectName" selected>과목명</option>
									<option value="professor">교수명</option>
									<option value="lecture_credit">학점</option>
							</select></td>
							<td><input type="text" class="form-control"
								placeholder="검색어 입력" name="searchText" maxlength="100"></td>
							<td><button type="submit" class="btn btn-success">검색</button></td>
						</tr>
					</table>
				</form>
			</div>
			<!-- 개인정보 수정 -->
			<!-- Navbar.jsp에는 개인정보 수정을 위한 기능이 포함되어있습니다. -->
			<!-- 개인정보 수정 버튼을 누르면 User의 sd_id를 가지고 updateStudent.jsp로 이동합니다. -->
			<button onclick="location.href='updateStudent.jsp?sd_id'">개인정보수정</button>
			<!--로그아웃 -->
			<button onclick="location.href='logoutStudent_proc.jsp?'">로그아웃</button>
		</div>
	</nav>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>