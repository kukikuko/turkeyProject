<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>강의를 추가하는 페이지</h1>
	<h3>강의 추가</h3>
	
	<form name = "createLecture">
	<p>과목명		<input name = "insertSubject">	</input></p>
	<p>수업시간	<input name = "insertTime">		</input></p>
	<p>강의실		<input name = "insertRoom">		</input></p>
	<button id = "createLectureBtn">추가하기</button>
	</form>
	<script>
		document.getElementById('createLectureBtn').addEventListener('click', (e)=>{
			e.preventDefault();
			let form = document.createLecture;
			if(form.insertSubject.value == "" && form.insertTime.value == "" && form.insertRoom.value == "" ){//이름이 없는 경우
				alert('개설할 강의 정보를 입력해주세요.');
				form.insertSubject.focus();
				return false;
			}else{//이름이 있는 경우
				if(confirm('강의를 개설하시겠습니까?')){
					form.action = "addLectureProfessor_proc.jsp";
					form.submit();
				}
			}
		});
	</script>
	
</body>
</html>