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
 * 1. �л� ���̺��� ��ϵ� ���ڵ��� �Ǽ��� ����ϱ�.
 * 2. �л� ���̺� ��ϵ� ��� ���ڵ������� ����ϱ�.
 * 3. �г⺰ ���� ����ϱ�.
 * 4. �л� ���̺� ��ϵ� ���ڵ� �� �̸��� 2������ ���� ����ϱ�.
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
		//1��
		System.out.println("�л� ���̺� ��ϵ� ���ڵ� �Ǽ� : " + x);
		//2��
		System.out.println("�л� ���̺��� ��� ���ڵ� ================");
		List<Student> list = session.selectList("student.list");
		for(Student s : list) {
			System.out.println(s);
		}
		//3��
		System.out.println("�л� ���̺��� 1�г� �л����� ���ڵ� =============");
		list = session.selectList("student.grade", 1);
		for(Student s : list) {
			System.out.println(s);
		}
		System.out.println("�л� ���̺��� 2�г� �л����� ���ڵ� =============");
		list = session.selectList("student.grade", 2);
		for(Student s : list) {
			System.out.println(s);
		}
		System.out.println("�л� ���̺��� 3�г� �л����� ���ڵ� =============");
		list = session.selectList("student.grade", 3);
		for(Student s : list) {
			System.out.println(s);
		}
		//4��
		System.out.println("�л� ���̺��� �̸��� 2���� ���� ����ϱ�");
		list = session.selectList("student.name2", "__");
		for(Student s : list) {
			System.out.println(s);
		}
	}
}
