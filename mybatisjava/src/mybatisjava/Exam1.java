package mybatisjava;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mapper.Student;

/*
 * 1. 학생 테이블의 등록된 레코드의 건수를 출력하기.
 * 2. 학생 테이블에 등록된 모든 레코드정보를 출력하기.
 * 3. 학년별 정보 출력하기.
 * 4. 학생 테이블에 등록된 레코드 중 이름이 2글자인 정보 출력하기.
 */
public class Exam1 {
	public static void main(String[] args) {
		SqlSessionFactory sqlMap = null;
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader("mapper/mybatis-config.xml");
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) { e.printStackTrace(); }
		int x = 0;
		SqlSession session = sqlMap.openSession();
		x = session.selectOne("student.count");
		//1번
		System.out.println("학생 테이블에 등록된 레코드 건수 : " + x);
		//2번
		System.out.println("학생 테이블의 모든 레코드 ================");
		List<Student> list = session.selectList("student.list");
		for(Student s : list) {
			System.out.println(s);
		}
		//3번
		System.out.println("학생 테이블의 1학년 학생들의 레코드 =============");
		list = session.selectList("student.grade", 1);
		for(Student s : list) {
			System.out.println(s);
		}
		System.out.println("학생 테이블의 2학년 학생들의 레코드 =============");
		list = session.selectList("student.grade", 2);
		for(Student s : list) {
			System.out.println(s);
		}
		System.out.println("학생 테이블의 3학년 학생들의 레코드 =============");
		list = session.selectList("student.grade", 3);
		for(Student s : list) {
			System.out.println(s);
		}
		//4번
		System.out.println("학생 테이블의 이름이 2자인 정보 출력하기");
		list = session.selectList("student.name2", "__");
		for(Student s : list) {
			System.out.println(s);
		}
	}
}
