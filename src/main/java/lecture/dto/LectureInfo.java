package lecture.dto;

import java.time.LocalDateTime;

// ������ DTO �κ� API �ѱ۷ε� Ű���� ���İ�� �˻��ؼ� �����ϰ� ���� �� ����
// ī��Ÿ������ �ۼ�
public class LectureInfo {
	public int indexId;					//���� �ε�����ȣ
	//�г⵵x
	//�б�x
	//�Ҽ�x
	public String department;			//�а�
	public String subjectNumber;		//�����ȣ
	//�й�x
	public String subjectName;			//�����
	//����x
	public String classTime;			//�����ð�
	public String lectureRoom;			//���ǽ�
	//�ð�x
	public String professor;			//������(�����̸�)
	//��������x
	//null�����ִ°� �Ұ����ε��ؼ� ���� ����
	public int lectureCredit;			//��������
	public int subscriptioLimit;		//���ǽ�û����
	public int currentStudent;			//��������л� ��

	public int getCurrentStudent() {
		return currentStudent;
	}
	public void setCurrentStudent(int currentStudent) {
		this.currentStudent = currentStudent;
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
	public int getLectureCredit() {
		return lectureCredit;
	}
	public void setLectureCredit(int lectureCredit) {
		this.lectureCredit = lectureCredit;
	}
	public int getSubscriptioLimit() {
		return subscriptioLimit;
	}
	public void setSubscriptioLimit(int subscriptioLimit) {
		this.subscriptioLimit = subscriptioLimit;
	}
	@Override
	public String toString() {
		return "LectureInfo [indexId=" + indexId + ", department=" + department + ", subjectNumber=" + subjectNumber
				+ ", subjectName=" + subjectName + ", classTime=" + classTime + ", lectureRoom=" + lectureRoom
				+ ", professor=" + professor + ", lectureCredit=" + lectureCredit + ", subscriptioLimit="
				+ subscriptioLimit + "]";
	}
	








}
