import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;
import java.sql.SQLException;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import dao.User;
import dao.Userdao;
import lecture.dao.LectureDao;
import lecture.dto.LectureInfo;

public class test {

	public static void main(String[] args) throws IOException, ParseException {
		// TODO Auto-generated method stub
//		LectureDao lectureDao = new LectureDao();
//		List<LectureInfo> plus = lectureDao.selectPlusLecture_creditList();
//		System.out.println(plus);
//		int temp1 = 0;
//		int temp2 = 18;
//		System.out.println(temp1);
//		System.out.println(temp2);
//		for(int i = 0; i<plus.size(); i++) {
//			System.out.println(plus.get(i).lectureCredit);
//			temp1 += plus.get(i).lectureCredit;
//			System.out.println(temp1);
//			if(temp2<temp1) {
//				System.out.println("18초과");
//			}
//		}
		
//		System.out.println(lectureDao.selectPersonInfoListByIndexId(1));
//		LectureInfo a = lectureDao.selectPersonInfoListByIndexId(1);
//		System.out.println(a.getSubscriptioLimit());
//		
//		System.out.println(lectureDao.CountByLecture(1));
//		LectureInfo b = lectureDao.CountByLecture(1);
//		System.out.println(b.getSubscriptioLimit());
////		Userdao userDao = new Userdao();
////		System.out.println(lectureDao.selectPlusLecture_creditList());
//		User user = new User();
//		boolean pl = false;
//		
//		List<LectureInfo> plus = lectureDao.selectPlusLecture_creditList();
//		int temp1 = 0;
//		int temp2 = 18;
//		
//		for(int i = 0; i<plus.size(); i++){
//			temp1 = temp1 + plus.get(i).getLectureCredit();
//			if(temp2 < temp1){
//				pl=true;
//				break;
//			}
//		}
//		System.out.println(userDao.insertDept(322));
//		System.out.println(lectureDao.selectSubjectNumberByIndexId(322));
		
//		15 + 0~1 * 10
		
//		System.out.println((int)(10+Math.random()*10));

		
//		JSONParser parser = new JSONParser();
//		Reader reader = new FileReader("D:\\data.json", Charset.forName("UTF-8"));
////		LectureDao lectureDao = new LectureDao(); 
//		JSONArray arr = (JSONArray) parser.parse(reader);
//		for(int i=0; i<arr.size(); i++) {
//			JSONObject obj = (JSONObject) arr.get(i);
//			LectureInfo Lectureinfo = new LectureInfo();
//			
//			Lectureinfo.department = (String) obj.get("학과");
//			Lectureinfo.subjectNumber = (String) obj.get("과목번호");
//			Lectureinfo.subjectName = (String) obj.get("과목명");
//			Lectureinfo.classTime = (String) obj.get("수업시간/강의실");
//			Lectureinfo.lectureRoom = (String) obj.get("수업시간/강의실");
//			Lectureinfo.professor = (String) obj.get("교수진");
//
//			lectureDao.insertLectureInfo(Lectureinfo);
//		}
	}

}
