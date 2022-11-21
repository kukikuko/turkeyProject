package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lecture.dto.LectureInfo;
import lecture.dto.ProfessorInfo;

public class Userdao {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	public void connect() throws Exception {
		String db_url = "jdbc:oracle:thin:@localhost:1521:orcl"; // 占쏙옙占쏙옙 DB占쏙옙占쏙옙
		String db_id = "scott"; // 占쏙옙占쏙옙 占쏙옙占싱듸옙
		String db_pw = "tiger"; // 占쏙옙占쏙옙 占쏙옙占싱듸옙占쏙옙 占쏙옙橘占싫�

		Class.forName("oracle.jdbc.driver.OracleDriver");

		if (conn != null) {
			conn.close();
		}

		conn = DriverManager.getConnection(db_url, db_id, db_pw);

	}

	public void disConnect() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
//	SQL쿼리문을 작성하는데. user 정보는 신청가능 전체 학점정보로 사용할
//	sd_credit라는 정보가 있어서 SQL Developer와 컬럼 갯수를 맞추기 위해
//	쿼리문에는 5개의 정보가 user 파라미터로 받아오고
//	1개의 약속한 정보가 INSERT INTO 됍니다.
//	모든 학생은 18학점으로 신청가능한 학점을 약속합니다.
	public int join(User user) {

		int result = 0;

		String SQL = "INSERT INTO turkey_USER VALUES (?, ?, ?, ?, ?,18)";
		try {
			connect();
			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, user.getUserID());
			psmt.setString(2, user.getUserPassword());
			psmt.setString(3, user.getUserName());
			psmt.setString(4, user.getUserEmail());
			psmt.setString(5, user.getUserPhoneNumber());
			
			return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}

		return result;
	}

	public int studentLogin(String userID, String userPassword) {
		String SQL = "SELECT sd_pw FROM turkey_USER WHERE sd_id =?";
		try {
			connect();

			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, userID);
			rs = psmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 占싸깍옙占쏙옙 占쏙옙占쏙옙
				} else
					return 0; // 占쏙옙橘占싫� 占쏙옙占쏙옙치
			}
			return -1; // 占쏙옙占싱듸옙 占쏙옙占쏙옙

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return -2; // 占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占쏙옙
	}
	
	public int profLogin(String userID, String userPassword) {
		String SQL = "SELECT pf_no FROM turkey_PROF WHERE pf_no =?";
		try {
			connect();

			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, userID);
			rs = psmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 占싸깍옙占쏙옙 占쏙옙占쏙옙
				} else
					return 0; // 占쏙옙橘占싫� 占쏙옙占쏙옙치
			}
			return -1; // 占쏙옙占싱듸옙 占쏙옙占쏙옙

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
		return -2; // 占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占쏙옙
	}
	
	public int adminLogin(String userID, String userPassword) {
		String SQL = "SELECT admin_pw FROM turkey_admin WHERE admin_id = ?";
		try {
			connect();

			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, userID);
			rs = psmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 占싸깍옙占쏙옙 占쏙옙占쏙옙
				} else
					return 0; // 占쏙옙橘占싫� 占쏙옙占쏙옙치
			}
			return -1; // 占쏙옙占싱듸옙 占쏙옙占쏙옙

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
		return -2; // 占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占쏙옙
	}
	
	public int loginDb(String id) {

		int result = 0;

		String SQL = "insert into turkey_login_user "
				+ "values(?, (select sd_name from turkey_user where sd_id = ?))";
		try {
			connect();
			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, id);
			psmt.setString(2, id);
			return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}

		return result;
	}
	
	public int insertDept(int id) {
		int result = 0;

		String SQL = "insert into turkey_user_dept "
				+ "values((select user_id from turkey_login_user), (select NVL(MAX(dept_no), 0) +1 from turkey_user_dept where user_id = (select user_id from turkey_login_user)), ?, '-')";
		try {
			connect();
			psmt = conn.prepareStatement(SQL);
			psmt.setInt(1, id);
			return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return result;
	}
	
	public int deleteloginDb() {
		int result = 0;

		String SQL = "delete from turkey_login_user";
		try {
			connect();
			psmt = conn.prepareStatement(SQL);
			return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}

		return result;
	}

	public int insertProf(String userID) {
		int result = 0;
		String SQL = "insert into turkey_login_prof values(?)";
		try {
			connect();
			psmt = conn.prepareStatement(SQL);
			psmt.setInt(1, Integer.parseInt(userID));
			return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
		return result;
	}
	
	public int deleteProf() {
		int result = 0;
		String SQL = "delete from turkey_login_prof ";
		try {
			connect();
			psmt = conn.prepareStatement(SQL);
			return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
		return result;
	}

	public void updateStudent(String name, String email, String pn) {

		String SQL = "update turkey_user "
				+ "set "
				+ "sd_name = ?, "
				+ "sd_email = ?, "
				+ "sd_pn = ? "
				+ "where sd_id = "
				+ "(select user_id from turkey_login_user)";
				
		try {
			connect();
			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, name);
			psmt.setString(2, email);
			psmt.setString(3, pn);
			psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}

	}

	public User selectStudent(){
		String sql = "select * from turkey_user "
				+ "where sd_id = (select user_id from turkey_login_user)";
		
		User user = null;
		try{
			connect();
			psmt = conn.prepareStatement(sql);
	
			rs = psmt.executeQuery();
		
			user = new User();
			if(rs.next()) {

				user.setUserID(rs.getString("sd_id"));
				user.setUserPassword(rs.getString("sd_pw"));
				user.setUserName(rs.getString("sd_name"));
				user.setUserEmail(rs.getString("sd_email"));
				user.setUserPhoneNumber(rs.getString("sd_pn"));
			}
			
		
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
		

		return user;
	}
		
	public void updateStudentGrade(String grade, String userId, String deptId) {

		String SQL = "update turkey_user_dept "
				+ "set "
				+ "dept_grade = ? "
				+ "where user_id = ? "
				+ "and dept_id = ?";
				
		try {
			connect();
			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, grade);
			psmt.setString(2, userId);
			psmt.setString(3, deptId);
			psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
	}
	
	public int selectLoginProf(){
		String sql = "select * from turkey_login_prof";
		
		int pfNo = 0;
		try{
			connect();
			psmt = conn.prepareStatement(sql);
	
			rs = psmt.executeQuery();
		
			if(rs.next()) {

				pfNo = rs.getInt("PF_ID");
			}
			
		
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
		return pfNo;
	}

	public void insertCreateLecture(String subjectName, String classTime, String lectureRoom, String subjectNumber, int credit) {
		
		String SQL = "INSERT INTO turkey_create_lecture "
				+ "VALUES(?, "
				+ " ?, "
				+ " ?, "
				+ "(select t.pf_dept from turkey_prof t where t.pf_no = (select * from turkey_login_prof)), "
				+ "(select t.pf_name from turkey_prof t where t.pf_no = (select * from turkey_login_prof)), "
				+ " (SELECT nvl(max(lectureno)+1, 1) FROM turkey_create_lecture), "
				+ "?, ?)";
		try {
			connect();
			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, subjectName);
			psmt.setString(2, classTime);
			psmt.setString(3, lectureRoom);
			psmt.setString(4, subjectNumber);
			psmt.setInt(5, credit);
			
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
	}
	
	
	
}
