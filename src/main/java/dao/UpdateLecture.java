package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UpdateLecture {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	public void connect() throws Exception {
		String db_url = "jdbc:oracle:thin:@localhost:1521:orcl"; // 접속 DB정보
		String db_id = "scott"; // 접속 아이디
		String db_pw = "tiger"; // 접속 아이디의 비밀번호

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

	public void updateLecture(String name, int index) {

		String SQL = "UPDATE lecture_info SET " + "subjectName = ?" + "WHERE indexid = ?	";
		try {
			connect();
			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, name);
			psmt.setInt(2, index);
			psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}

	}
	public void updateProfessor(String name, int index) {

		String SQL = "UPDATE lecture_info SET " + "professor = ?" + "WHERE indexid = ?	";
		try {
			connect();
			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, name);
			psmt.setInt(2, index);
			psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}

	}
	public void deleteLecture(int index) {

		String SQL = "delete from lecture_info "
				+ "where indexid = ?";
		try {
			connect();
			psmt = conn.prepareStatement(SQL);
			psmt.setInt(1, index);
			
			psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}

	}

	
}
