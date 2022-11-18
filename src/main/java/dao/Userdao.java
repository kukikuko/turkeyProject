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

	public int join(User user) {

		int result = 0;

		String SQL = "INSERT INTO TEST_USER VALUES (?, ?, ?, ?, ?,18)";
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
		String SQL = "SELECT sd_pw FROM TEST_USER WHERE sd_id =?";
		try {
			connect();

			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, userID);
			rs = psmt.executeQuery();
			if (rs.next()) {
				System.out.println(rs.getString(1));
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
		String SQL = "SELECT pf_no FROM TEST_PROF WHERE pf_no =?";
		try {
			connect();

			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, userID);
			rs = psmt.executeQuery();
			if (rs.next()) {
				System.out.println(rs.getString(1));
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
		String SQL = "SELECT admin_pw FROM admin WHERE admin_id = ?";
		try {
			connect();

			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, userID);
			rs = psmt.executeQuery();
			if (rs.next()) {
				System.out.println(rs.getString(1));
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

		String SQL = "insert into login_user "
				+ "values(?, (select sd_name from test_user where sd_id = ?))";
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

		String SQL = "insert into test_user_dept "
				+ "values((select user_id from login_user), (select NVL(MAX(dept_no), 0) +1 from test_user_dept where user_id = (select user_id from login_user)), ?)";
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

		String SQL = "delete from login_user";
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
		String SQL = "insert into login_prof values(?)";
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
		String SQL = "delete from login_prof ";
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

		String SQL = "update test_user "
				+ "set "
				+ "sd_name = ?, "
				+ "sd_email = ?, "
				+ "sd_pn = ? "
				+ "where sd_id = "
				+ "(select user_id from login_user)";
				
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
		String sql = "select * from test_user "
				+ "where sd_id = (select user_id from login_user)";
		
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
	
	public int selectLoginProf(){
		String sql = "select * from login_prof";
		
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

	public void insertCreateLecture(String subjectName, String classTime, String lectureRoom, String subjectNumber) {
		
		String SQL = "INSERT INTO create_lecture "
				+ "VALUES(?, "
				+ " ?, "
				+ " ?, "
				+ "(select t.pf_dept from test_prof t where t.pf_no = (select * from login_prof)), "
				+ "(select t.pf_name from test_prof t where t.pf_no = (select * from login_prof)), "
				+ " (SELECT nvl(max(lectureno)+1, 1) FROM create_lecture), "
				+ "?)";
		try {
			connect();
			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, subjectName);
			psmt.setString(2, classTime);
			psmt.setString(3, lectureRoom);
			psmt.setString(4, subjectNumber);
			
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
	}
	
	
	
}
