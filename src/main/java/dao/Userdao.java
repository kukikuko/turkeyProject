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
		String db_url = "jdbc:oracle:thin:@localhost:1521:orcl"; // ���� DB����
		String db_id = "scott"; // ���� ���̵�
		String db_pw = "tiger"; // ���� ���̵��� ��й�ȣ

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
					return 1; // �α��� ����
				} else
					return 0; // ��й�ȣ ����ġ
			}
			return -1; // ���̵� ����

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return -2; // �����ͺ��̽� ����
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
					return 1; // �α��� ����
				} else
					return 0; // ��й�ȣ ����ġ
			}
			return -1; // ���̵� ����

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
		return -2; // �����ͺ��̽� ����
	}
	
	
}
