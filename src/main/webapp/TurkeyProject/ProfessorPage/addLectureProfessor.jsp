<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>
<!-- addLectureProfessor.jsp에서 과목명 / 수업시간 / 강의실 / 과목번호  를 입력하고 -->
<!-- 추가하기 버튼을 누르면 입력한 정보의 유효성을 검사하고. 통과 하면 강의개설 신청을 합니다. -->
	<h1>강의를 추가하는 페이지</h1>
	<h3>강의 추가</h3>

	<form name="createLecture">
		<p>
			과목명 <input name="insertSubject"> </input>
		</p>
		<p>수업시간
		<div class="container">
			<div class="row">

				<table class="pull-right">
					<tr>
						<td><select class="form-control" name="day">
								<option value="0">요일선택</option>
								<option value="월">월</option>
								<option value="화">화</option>
								<option value="수">수</option>
								<option value="목">목</option>
								<option value="금">금</option>
						</select></td>
						<td><select class="form-control" name="starthour">
								<option value="0">강의 시작 시간 선택</option>
								<option value="09">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
						</select></td>
						<td>:</td>
						<td><select class="form-control" name="startminute">
								<option value="10">강의 시작 시간 선택</option>
								<option value="00">00</option>
								<option value="15">15</option>
								<option value="30">30</option>
								<option value="45">45</option>
						</select></td>
						<td>~</td>
						<td><select class="form-control" name="finishhour">
								<option value="0">강의 종료 시간 선택</option>
								<option value="09">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
						</select></td>
						<td>:</td>
						<td><select class="form-control" name="finishminute">
								<option value="10">강의 종료 시간 선택</option>
								<option value="00">00</option>
								<option value="15">15</option>
								<option value="30">30</option>
								<option value="45">45</option>
						</select></td>
					</tr>
				</table>

			</div>
		</div>
		</p>
		<p>
			강의실 <input name="insertRoom" placeholder = "예)A000" > </input>
		</p>
		<p>
			과목번호 <input name="insertNumber" placeholder = "예)ABC1234"> </input>
		</p>
		<button id="createLectureBtn">추가하기</button>
	</form>


	<script>
		document.getElementById('createLectureBtn').addEventListener('click', (e)=>{
			e.preventDefault();
			let form = document.createLecture;
			if(form.insertSubject.value == "" || form.insertRoom.value == "" || form.insertNumber.value == ""
					|| form.day.value == 0 
					|| form.starthour.value == 0 || form.startminute.value == 10 
					|| form.finishhour.value == 0 || form.finishminute.value == 10){
				alert('개설할 강의 정보를 모두 입력해주세요.');
				form.insertSubject.focus();
				return false;			
				}
			
			let starthour = Number(form.starthour.value);
			let finishhour = Number(form.finishhour.value);
			if(starthour > finishhour){
				alert('강의 시간을 확인해주세요.');
					
			return false;
			
			}else if(starthour == finishhour){
				let startminute = Number(form.startminute.value);
				let finishminute = Number(form.finishminute.value);
				if(startminute >= finishminute ){
					alert('강의 시간을 확인해주세요.');
				return false;
				} else{//이름이 있는 경우
					if(confirm('강의를 개설하시겠습니까?')){
						form.action = "addLectureProfessor_proc.jsp";
						form.submit();
					}
			}} else{//이름이 있는 경우
				if(confirm('강의를 개설하시겠습니까?')){
					form.action = "addLectureProfessor_proc.jsp";
					form.submit();
				}
			}
			

		});
		
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>