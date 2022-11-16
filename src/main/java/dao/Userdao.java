package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



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

		String SQL = "INSERT INTO TEST_USER VALUES (?, ?, ?, ?, ?)";
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
		String SQL = "SELECT pf_pw FROM TEST_PROF WHERE pf_id =?";
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
	
	
	
	
	
	
	
	
	
	
	
	
	
}
