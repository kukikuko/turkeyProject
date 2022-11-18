import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import lecture.dao.LectureDao;
import lecture.dto.LectureInfo;
import lecture.dto.Prof;

public class inesrtData {

	public static void main(String[] args) throws IOException, ParseException {
		// TODO Auto-generated method stub

//		LectureDao md = new LectureDao();
//		JSONParser parser = new JSONParser();
//		List<Prof> prof = new ArrayList();
//		Reader reader = new FileReader("D:\\data.json", Charset.forName("UTF-8"));
//		JSONArray arr = (JSONArray) parser.parse(reader);
//		for (int i = 0; i < arr.size(); i++) {
//			Prof p = new Prof();
//			JSONObject obj = (JSONObject) arr.get(i);
//			String a = (String) obj.get("교수진");
//			String b = (String) obj.get("학과");
//			System.out.println(obj);
//			if (a.indexOf(",") > 0) {
//				p.name = a.substring(0, a.indexOf(","));
//				p.dept = b;
//				prof.add(p);
//			} else {
//				p.name = a;
//				p.dept = b;
//				prof.add(p);
//			}
//		}
//		boolean isP = false;
//		for (int i = 0; i < prof.size(); i++) {
//			for (int j = 0; j < i; j++) {
//				if (prof.get(i).name.equals(prof.get(j).name) && prof.get(i).dept.equals(prof.get(j).dept)) { // 중복 검사
//					System.out.println("중복된 요소가 있습니다! 예외 발생시키기");
//					isP = true;
//				}
//			}
//			if (isP == false) {
//				md.insertProf(prof.get(i));
//			}
//			isP = false;
//		}

		JSONParser parser = new JSONParser();
		Reader reader = new FileReader("D:\\data.json", Charset.forName("UTF-8"));
		LectureDao lectureDao = new LectureDao(); 
		JSONArray arr = (JSONArray) parser.parse(reader);
		for(int i=0; i<arr.size(); i++) {
			JSONObject obj = (JSONObject) arr.get(i);
			LectureInfo Lectureinfo = new LectureInfo();
			
			Lectureinfo.department = (String) obj.get("학과");
			Lectureinfo.subjectNumber = (String) obj.get("과목번호");
			Lectureinfo.subjectName = (String) obj.get("과목명");
			Lectureinfo.classTime = (String) obj.get("수업시간/강의실");
			Lectureinfo.lectureRoom = (String) obj.get("수업시간/강의실");
			Lectureinfo.professor = (String) obj.get("교수진");

			lectureDao.insertLectureInfo(Lectureinfo);
		}

	}

}
