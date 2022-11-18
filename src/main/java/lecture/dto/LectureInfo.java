package lecture.dto;

import java.time.LocalDateTime;

// 생성자 DTO 부분 API 한글로된 키값을 파파고로 검색해서 적절하게 번역 후 적용
// 카멜타입으로 작성
public class LectureInfo {
	public int indexId;					//강의 인덱스번호
	//학년도x
	//학기x
	//소속x
	public String department;			//학과
	public String subjectNumber;		//과목번호
	//분반x
	public String subjectName;			//과목명
	//학점x
	public String classTime;			//수업시간
	public String lectureRoom;			//강의실
	//시간x
	public String professor;			//교수진(교수이름)
	//수강생수x
	public String grade;
	//null값들어가있는게 소개글인듯해서 아직 보류


	@Override
	public String toString() {
		return "LectureInfo [indexId=" + indexId + ", department=" + department + ", subjectNumber=" + subjectNumber
				+ ", subjectName=" + subjectName + ", classTime=" + classTime + ", lectureRoom=" + lectureRoom
				+ ", professor=" + professor + "]";
	}
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getIndexId() {
		return indexId;
	}
	public void setIndexId(int indexId) {
		this.indexId = indexId;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getSubjectNumber() {
		return subjectNumber;
	}
	public void setSubjectNumber(String subjectNumber) {
		this.subjectNumber = subjectNumber;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getClassTime() {
		return classTime;
	}
	public void setClassTime(String classTime) {
		this.classTime = classTime;
	}
	public String getLectureRoom() {
		return lectureRoom;
	}
	public void setLectureRoom(String lectureRoom) {
		this.lectureRoom = lectureRoom;
	}
	public String getProfessor() {
		return professor;
	}
	public void setProfessor(String professor) {
		this.professor = professor;
	}









}
