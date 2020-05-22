package mybatisjava;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mapper.Student;
import mapper.StudentMapper;

public class Main4 {
	private final static String NS = "mapper.StudentMapper.";
	private static SqlSessionFactory sqlMap;
	static {
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream("mapper/mybatis-config.xml");
		} catch (IOException e) { e.printStackTrace(); }
		sqlMap = new SqlSessionFactoryBuilder().build(input);
	}
	public static void main(String[] args) {
		SqlSession session = sqlMap.openSession();
		
		System.out.println("================학생 전체 레코드 조회하기================");
		
		System.out.println("xml 방식으로 호출하기");
		List<Student> list = session.selectList(NS + "select");
		for(Student s : list) System.out.println(s);
		
		//StudentMapper.class : StudentMapper 클래스의 Class 객체 리턴.
		Class<StudentMapper> css = StudentMapper.class;
		System.out.println("인터페이스 방식으로 호출하기");
		list = session.getMapper(css).select(null);
		for(Student s : list) System.out.println(s);
		
		System.out.println("================1학년 학생 정보 조회하기================");
		Map<String,Object> map = new HashMap<>();
		map.put("grade", 1);
		list = session.getMapper(StudentMapper.class).select(map);
		for(Student s : list) System.out.println(s);
		
		map.clear();
		
		System.out.println("===========981213 학번을 가진 학생 정보 조회하기===========");
		map.put("studno", 981213);
		list = session.getMapper(StudentMapper.class).select(map);
		for(Student s : list) System.out.println(s);
		
		map.clear();
		
		System.out.println("===========몸무게가 80 이상인 학생 정보 조회하기===========");
		map.put("weight", 80);
		list = session.getMapper(StudentMapper.class).select(map);
		for(Student s : list) System.out.println(s);
		
		System.out.println("================김삿갓 학생 정보 추가하기================");
		Student st = new Student();
		st.setStudno(1001);
		st.setName("김삿갓");
		st.setJumin("1234561234567");
		st.setId("kimsk");
		int result = session.getMapper(mapper.StudentMapper.class).insert(st);
		System.out.println(result + "건 추가 완료");
		
		map.clear();
		
		System.out.println("================김삿갓 학생 정보 조회하기================");
		map.put("studno", 1001);
		list = session.getMapper(mapper.StudentMapper.class).select(map);
		for(Student s : list) System.out.println(s);
		
		System.out.println("======김삿갓 학생의 학년:1, 몸무게:80, 키:175 수정하기======");
		st.setGrade(1);
		st.setWeight(80);
		st.setHeight(175);
		result = session.getMapper(mapper.StudentMapper.class).update(st);
		System.out.println(result + "건 수정 완료");
		
		map.clear();
		
		System.out.println("================김삿갓 학생 정보 조회하기================");
		map.put("studno", 1001);
		list = session.getMapper(mapper.StudentMapper.class).select(map);
		for(Student s : list) System.out.println(s);
			
		System.out.println("==============학번:1001 학생 정보 삭제하기==============");
		result = session.getMapper(mapper.StudentMapper.class).delete("김삿갓",1001);
		System.out.println(result + "건 삭제 완료");
		
		map.clear();
		
		System.out.println("================김삿갓 학생 정보 조회하기================");
		map.put("studno", 1001);
		list = session.getMapper(mapper.StudentMapper.class).select(map);
		for(Student s : list) System.out.println(s);
	}
}