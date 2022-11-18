package lecture.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lecture.dto.LectureInfo;
import lecture.dto.Prof;
import lecture.dto.StudentInfo;
import lecture.dto.classTimeInfo;


public class LectureDao {
	
	//DB 연결필드
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	//DB연결
	public void connect() {
		String db_url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String db_id = "scott";
		String db_pw = "tiger";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			if(conn != null) {
				conn.close();
			}
			conn = DriverManager.getConnection(db_url, db_id, db_pw);

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//DB연결해제
	public void disConnect() {
		try {
			if(rs != null) {
				rs.close();	
			}
			if(psmt != null) {
				psmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//강좌 API 정보 DB에 INSERT 하는데 사용한 클래스
	public void insertLectureInfo(LectureInfo info) {
		String sql = "INSERT INTO turkey_lecture_info "
				+ "				VALUES ("
				+ " (select nvl(max(indexId),0) + 1 from turkey_lecture_info), "
				+ " ?, ?, ?,"
				+ " (SELECT trim(NVL((SUBSTR( ? ,0, INSTR(?,'[')-1)),'정보없음')) FROM dual), "
				+ " (SELECT NVL(SUBSTR(?, INSTR(?,'[')+1, INSTR(?,']')-INSTR(?,'[')-1),'강의실정보없음')  FROM dual), "
				+ " ? , 3, ?, 0)";
		try {
			connect();
			int random=(int)(10+Math.random()*10);
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, info.department);
			psmt.setString(2, info.subjectNumber);
			psmt.setString(3, info.subjectName);
			psmt.setString(4, info.classTime);
			psmt.setString(5, info.classTime);
			psmt.setString(6, info.lectureRoom);
			psmt.setString(7, info.lectureRoom);
			psmt.setString(8, info.lectureRoom);
			psmt.setString(9, info.lectureRoom);
			psmt.setString(10, info.professor);
			psmt.setInt(11, random);
			System.out.println(random);
			int result = psmt.executeUpdate();
//			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
	}
	
	
	public List<LectureInfo> selectLectureInfoList(){
		String sql = "SELECT indexId,department, "
				+" subjectNumber, subjectName, "
				+" classTime, lectureRoom,professor, lecture_credit, currentstudent, subscription_limit from turkey_lecture_info";
		List<LectureInfo> lectureInfoList = null;
		try{
			
			connect();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			
			lectureInfoList = new ArrayList<LectureInfo>();
			while(rs.next()) {
				LectureInfo lectureInfo = new LectureInfo();
				lectureInfo.setIndexId(rs.getInt("indexId"));
				lectureInfo.setDepartment(rs.getString("department"));
				lectureInfo.setSubjectNumber(rs.getString("subjectNumber"));
				lectureInfo.setSubjectName(rs.getString("subjectName"));
				lectureInfo.setClassTime(rs.getString("classTime"));
				lectureInfo.setLectureRoom(rs.getString("lectureRoom"));
				lectureInfo.setProfessor(rs.getString("professor"));
				lectureInfo.setLectureCredit(rs.getInt("lecture_credit"));
				lectureInfo.setCurrentStudent(rs.getInt("currentstudent"));
				lectureInfo.setSubscriptioLimit(rs.getInt("subscription_limit"));
				
				lectureInfoList.add(lectureInfo);
			}
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return lectureInfoList;
	}
	
	public List<LectureInfo> selectSugangLectureInfoList(){
		
		String sql = " select li.indexId, li.department, li.subjectNumber, li.subjectName, li.classTime, li.LectureRoom, li.professor,"
				+ " li.lecture_credit, li.subscription_limit "
				+ " from turkey_lecture_info li, turkey_user_dept td, turkey_login_user lu "
				+ " where li.indexid = td.dept_id and td.user_id = lu.user_id ";
		
		List<LectureInfo> lectureInfoList = null;

		try{

			connect();

			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			
			lectureInfoList = new ArrayList<LectureInfo>();

			while(rs.next()) {
				LectureInfo lectureInfo = new LectureInfo();
				lectureInfo.setIndexId(rs.getInt("indexId"));
				lectureInfo.setDepartment(rs.getString("department"));
				lectureInfo.setSubjectNumber(rs.getString("subjectNumber"));
				lectureInfo.setSubjectName(rs.getString("subjectName"));
				lectureInfo.setClassTime(rs.getString("classTime"));
				lectureInfo.setLectureRoom(rs.getString("lectureRoom"));
				lectureInfo.setProfessor(rs.getString("professor"));

				lectureInfo.setLectureCredit(rs.getInt("lecture_credit"));	
				lectureInfo.setSubscriptioLimit(rs.getInt("subscription_limit"));
				
				lectureInfoList.add(lectureInfo);
			}

			
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
		

		return lectureInfoList;
	}
	
	
	
	public int deleteLectureInfoById(int id) {
		String sql = " delete from turkey_user_dept "
				+ " where user_id = (select user_id from turkey_login_user) and dept_id=? ";
		int result = 0;
		
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, id);			
			
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return result;
	}
	
	public LectureInfo selectPersonInfoListByIndexId(int indexId){

		String sql = "SELECT * FROM turkey_lecture_info WHERE indexId=?";

		LectureInfo lectureInfo = null;

		try{

			connect();

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, indexId);

			rs = psmt.executeQuery();

			
			lectureInfo = new LectureInfo();

			if(rs.next()) {

				lectureInfo.setIndexId(rs.getInt("indexId"));
				lectureInfo.setDepartment(rs.getString("department"));
				lectureInfo.setSubjectNumber(rs.getString("subjectNumber"));
				lectureInfo.setSubjectName(rs.getString("subjectName"));
				lectureInfo.setClassTime(rs.getString("classTime"));
				lectureInfo.setLectureRoom(rs.getString("lectureRoom"));
				lectureInfo.setProfessor(rs.getString("professor"));
				lectureInfo.setLectureCredit(rs.getInt("lecture_credit"));
				lectureInfo.setCurrentStudent(rs.getInt("currentstudent"));
	        	lectureInfo.setSubscriptioLimit(rs.getInt("subscription_limit"));
			}

			
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
		

		return lectureInfo;
	}
	
	//--회원 정보 검색
	public List<LectureInfo> getSearch(String searchField, String searchText){//특정한 리스트를 받아서 반환
	      List<LectureInfo> list = new ArrayList<LectureInfo>();
	      String sql ="select * from turkey_lecture_info WHERE "+searchField.trim();
	      try {
	            if(searchText != null && !searchText.equals("") ){
	            	sql +=" LIKE '%"+searchText.trim()+"%'";
	            }
	            connect();
	            psmt=conn.prepareStatement(sql);
				rs=psmt.executeQuery();//select
	         while(rs.next()) {
	        	 LectureInfo lectureInfo = new LectureInfo();
	        	 lectureInfo.setIndexId(rs.getInt("indexId"));
	        	 lectureInfo.setDepartment(rs.getString("department"));
	        	 lectureInfo.setSubjectNumber(rs.getString("subjectNumber"));
	        	 lectureInfo.setSubjectName(rs.getString("subjectName"));
	        	 lectureInfo.setClassTime(rs.getString("classTime"));
	        	 lectureInfo.setLectureRoom(rs.getString("lectureRoom"));
	        	 lectureInfo.setProfessor(rs.getString("professor"));
	        	 lectureInfo.setLectureCredit(rs.getInt("lecture_credit"));	
	        	 lectureInfo.setSubscriptioLimit(rs.getInt("subscription_limit"));
	        	 list.add(lectureInfo);//list에 해당 인스턴스를 담는다.
	         }
				
	      } catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	    	  disConnect();
//				System.out.println(list.size());
			}
	      return list;
	   }
	
	public List<LectureInfo> professorInfo(){
		String sql = "SELECT indexId,department, "
				+" subjectNumber, subjectName, "
				+" classTime, lectureRoom, professor "
				+ "FROM turkey_lecture_info "
				+ "WHERE professor = (SELECT pf_name FROM turkey_prof "
				+ "WHERE pf_no = (SELECT pf_id FROM turkey_login_prof))";
		List<LectureInfo> lectureInfoList = null;
		try{
			
			connect();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			
			lectureInfoList = new ArrayList<LectureInfo>();
			while(rs.next()) {
				LectureInfo lectureInfo = new LectureInfo();
				lectureInfo.setIndexId(rs.getInt("indexId"));
				lectureInfo.setDepartment(rs.getString("department"));
				lectureInfo.setSubjectNumber(rs.getString("subjectNumber"));
				lectureInfo.setSubjectName(rs.getString("subjectName"));
				lectureInfo.setClassTime(rs.getString("classTime"));
				lectureInfo.setLectureRoom(rs.getString("lectureRoom"));
				lectureInfo.setProfessor(rs.getString("professor"));
//				System.out.println(rs.getString("professor"));
				lectureInfoList.add(lectureInfo);
			}
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return lectureInfoList;
	}
	
	public List<StudentInfo> showStudent(int indexId){
		List<StudentInfo> list = new ArrayList<StudentInfo>();
		String sql = "select u.sd_name, u.sd_email, u.sd_pn "
				+ "from turkey_user_dept t, turkey_user u "
				+ "where t.user_id = u.sd_id and dept_id = ?";
		StudentInfo studentInfo = null;
		try{
			connect();
//			System.out.println(indexId);
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, indexId);
			rs = psmt.executeQuery();
//			System.out.println(rs);
			while(rs.next()) {
				studentInfo = new StudentInfo();
				studentInfo.setName(rs.getString("SD_NAME"));
				studentInfo.setEmail(rs.getString("SD_EMAIL"));
				studentInfo.setPn(rs.getString("SD_PN"));
				list.add(studentInfo);//list�� �ش� �ν��Ͻ��� ��´�.
//				System.out.println(rs.getString("SD_EMAIL"));
//				System.out.println(rs.getString("SD_PN"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
//		System.out.println("---");
//		System.out.println(list);

		return list;
	}
	
	public List<LectureInfo> createLecture(){
		String sql = "SELECT * FROM turkey_create_lecture";
		List<LectureInfo> createLectureList = null;
		try{
			
			connect();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			
			createLectureList = new ArrayList<LectureInfo>();
			while(rs.next()) {
				LectureInfo createLectureInfo = new LectureInfo();
				createLectureInfo.setDepartment(rs.getString("department"));
				createLectureInfo.setSubjectName(rs.getString("subjectName"));
				createLectureInfo.setSubjectNumber(rs.getString("subjectnumber"));
				createLectureInfo.setClassTime(rs.getString("classTime"));
				createLectureInfo.setLectureRoom(rs.getString("lectureRoom"));
				createLectureInfo.setProfessor(rs.getString("professor"));
				createLectureInfo.setIndexId(rs.getInt("lectureno"));
//				System.out.println(rs.getString("professor"));
				createLectureList.add(createLectureInfo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
	return createLectureList;
	}

			
	//저장 되어있는 데이터 시간자르는 메서드
	public List<classTimeInfo> selectClassTimeLectureInfoList() {


		String sql = "select substr(li.classtime, 0, 1) A, substr(li.classtime, instr(li.classtime, ',')+1, 1) B, "
				+ " substr(classtime, instr(classtime, ' ')+1, 2) A1 "
				+ ", substr(classtime, instr(classtime, ' ')+4, 2) A2 "
				+ ", substr(classtime, instr(classtime, '~')+1, 2) B1 "
				+ ", substr(classtime, instr(classtime, '~')+4, 2) B2  "
				+ " from turkey_user_dept tsd,  turkey_lecture_info li, turkey_login_user lu where tsd.dept_id= li.indexId and tsd.user_id = lu.user_id";
		
		List<classTimeInfo> classTimeInfoList = null;

		try {

			connect();

			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			classTimeInfoList = new ArrayList<classTimeInfo>();

			while (rs.next()) {
				classTimeInfo ci = new classTimeInfo();
				ci.setFirst(rs.getString("A"));
				ci.setSecond(rs.getString("B"));
				ci.setA1(Integer.parseInt(rs.getString("A1")));
				ci.setA2(Integer.parseInt(rs.getString("A2")));
				ci.setB1(Integer.parseInt(rs.getString("B1")));
				ci.setB2(Integer.parseInt(rs.getString("B2")));
				// System.out.println(ci.getFirst());
				// System.out.println(ci.getSecond());
				classTimeInfoList.add(ci);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}

		return classTimeInfoList;
	}
	//저장 하고싶은 데이터 시간자르는 메서드
	public classTimeInfo selectClassTimeByIndexId(int indexId) {

		String sql = "select substr(classtime, 0, 1) A, substr(classtime, instr(classtime, ',')+1, 1) B, "
				     +" substr(classtime, instr(classtime, ' ')+1, 2) A1 "
				     + ", substr(classtime, instr(classtime, ' ')+4, 2) A2 "
				     + ", substr(classtime, instr(classtime, '~')+1, 2) B1 "
				     + ", substr(classtime, instr(classtime, '~')+4, 2) B2 from turkey_lecture_info where indexId = ?";

		classTimeInfo ci = null;

		try {

			connect();

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, indexId);

			rs = psmt.executeQuery();

			ci = new classTimeInfo();

			if (rs.next()) {
				
				ci.setFirst(rs.getString("A"));
				ci.setSecond(rs.getString("B"));
				ci.setA1(Integer.parseInt(rs.getString("A1")));
				ci.setA2(Integer.parseInt(rs.getString("A2")));
				ci.setB1(Integer.parseInt(rs.getString("B1")));
				ci.setB2(Integer.parseInt(rs.getString("B2")));
				System.out.println(ci.getFirst());
				System.out.println(ci.getSecond());
				System.out.println(ci.getA1());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}

		return ci;
	}

	//저장 되어있는 데이터 subjectNumber 불러오는 메서드
	public List<LectureInfo> selectSubjectNumberinfoList(){
		String sql = " SELECT li.subjectnumber "
					+" FROM turkey_lecture_info li, turkey_user_dept tsd, turkey_login_user lu "
					+" WHERE tsd.dept_id = li.indexId and tsd.user_id=lu.user_id";
		
		List<LectureInfo> lectureInfoList = null;
		
		try {
			connect();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			lectureInfoList = new ArrayList<LectureInfo>();
			
			while(rs.next()) {
				LectureInfo li = new LectureInfo();
				li.setSubjectNumber(rs.getString("subjectNumber"));
				System.out.println(li.getSubjectNumber());
				lectureInfoList.add(li);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			disConnect();
		}
		return lectureInfoList;
	}
	
	//저장 하고싶은 데이터 subjectNumber 불러오는 메서드
	public LectureInfo selectSubjectNumberByIndexId(int indexId) {

		String sql = "select subjectnumber, subscription_limit ,currentstudent from turkey_lecture_info where indexId = ?";

		LectureInfo li = null;

		try {

			connect();

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, indexId);

			rs = psmt.executeQuery();

			li = new LectureInfo();

			if (rs.next()) {
				
				li.setSubjectNumber(rs.getString("subjectNumber"));
				li.setSubscriptioLimit(rs.getInt("subscription_limit"));
				li.setCurrentStudent(rs.getInt("currentstudent"));
//				System.out.println(li.getSubjectNumber());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}

		return li;
	}
	
	
	public List<LectureInfo> selectPlusLecture_creditList(){
		String sql = " SELECT li.lecture_credit "
				+ " FROM turkey_lecture_info li, turkey_user_dept tsd, turkey_login_user lu "
				+ " WHERE tsd.dept_id = li.indexId and tsd.user_id=lu.user_id ";
		
		List<LectureInfo> lectureInfoList = null;
		
		try {
			connect();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			lectureInfoList = new ArrayList<LectureInfo>();
			
			while(rs.next()) {
				LectureInfo li = new LectureInfo();
				li.setLectureCredit(rs.getInt("lecture_credit"));
				System.out.println(li.getLectureCredit());
				lectureInfoList.add(li);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			disConnect();
		}
		return lectureInfoList;
	}
	
	
	public void PlusCurrentStudent(int indexId) {

		String SQL = "update turkey_lecture_info "
				+ "set "
				+ "currentstudent = currentstudent + 1 "
				+ "where indexId = ?";
				
		try {
			connect();
			psmt = conn.prepareStatement(SQL);
			psmt.setInt(1, indexId);
			psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}

	} 
	
	public void MinusCurrentStudent(int indexId) {

		String SQL = "update turkey_lecture_info "
				+ "set "
				+ "currentstudent = currentstudent - 1 "
				+ "where indexId = ?";
				
		try {
			connect();
			psmt = conn.prepareStatement(SQL);
			psmt.setInt(1, indexId);
			psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}

	} 
	
	
	
	public int deleteTempLecture(int lectureno) {
		int result = 0;

		String SQL = "DELETE FROM turkey_create_lecture "
				+ "WHERE lectureno = ?";
		try {
			connect();
			
			psmt = conn.prepareStatement(SQL);
			psmt.setInt(1, lectureno);	
			
			return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}

		return result;
	}
	
	public void insertLectureInfoAdmin(String department, String subjectNumber, String sujectName, String classTime, String lectureRoom, String professor) {

		String sql = "INSERT INTO turkey_lecture_info "
				+ "VALUES((select max(indexid)+1 from turkey_lecture_info), ?, ?, ?, ?, ?, ?, 3, ?, 0)";
		try {
			connect();
			int random=(int)(10+Math.random()*10);
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, department);
			psmt.setString(2, subjectNumber);
			psmt.setString(3, sujectName);
			psmt.setString(4, classTime);
			psmt.setString(5, lectureRoom);
			psmt.setString(6, professor);
			psmt.setInt(7, random);
			int result = psmt.executeUpdate();
//			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
	}
	
	public void insertProf(Prof p) {
		String sqlQuery = "INSERT INTO turkey_PROF VALUES(?, ?, (select NVL(MAX(pf_no), 1000000) +1 from turkey_prof))";
		try {
			connect();
			psmt = conn.prepareStatement(sqlQuery);
			psmt.setString(1, p.name);
			psmt.setString(2, p.dept);
			int resultCnt = psmt.executeUpdate(); // executeUpdate 된 Row 수 리턴
			if (resultCnt > 0)
				System.out.println("INSERT 성공");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disConnect();
		}
	}
}
