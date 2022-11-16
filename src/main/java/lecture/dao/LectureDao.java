package lecture.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lecture.dto.LectureInfo;


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
		String sql = "INSERT INTO lecture_info "
				+ "				VALUES ((select nvl(max(indexId),0) + 1 from lecture_info),?, ?, ?, (SELECT trim(NVL((SUBSTR( ? ,0, INSTR(?,'[')-1)),'정보없음')) FROM dual) "
				+ "                , (SELECT NVL(SUBSTR(?, INSTR(?,'[')+1, INSTR(?,']')-INSTR(?,'[')-1),'강의실정보없음')  FROM dual) "
				+ "                , ?)";
		try {
			connect();
			
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
			
			
			int result = psmt.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
	}
	
	
	public List<LectureInfo> selectLectureInfoList(){
		String sql = "SELECT indexId,department, "
				+" subjectNumber, subjectName, "
				+" classTime, lectureRoom,professor from lecture_info";
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
		
		String sql = " select li.indexId, li.department, li.subjectNumber, li.subjectName, li.classTime, li.LectureRoom, li.professor "
				+ " from lecture_info li, test_user_dept td, login_user lu "
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
		String sql = " delete from test_user_dept "
				+ " where user_id = (select user_id from login_user) and dept_id=? ";
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

		String sql = "SELECT * FROM lecture_info WHERE indexId=?";

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
	      String sql ="select * from lecture_info WHERE "+searchField.trim();
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
	
	
	
	
	
	
	
	
	
}
