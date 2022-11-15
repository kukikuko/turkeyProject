package dao;

public class Lecture {
	public int indexID;
	public String department;
	public String subjectNumber;
	public String subjectName;
	public String classTime;
	public String LectureRoom;
	public String professor;
	public int getIndexID() {
		return indexID;
	}
	public void setIndexID(int indexID) {
		this.indexID = indexID;
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
		return LectureRoom;
	}
	public void setLectureRoom(String lectureRoom) {
		LectureRoom = lectureRoom;
	}
	public String getProfessor() {
		return professor;
	}
	public void setProfessor(String professor) {
		this.professor = professor;
	}
	
}
