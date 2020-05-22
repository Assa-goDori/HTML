package mybatisjava;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mapper.Member;

public class Main1 {
	public static void main(String[] args) {
		SqlSessionFactory sqlMap = null;
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader("mapper/mybatis-config.xml");
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
		int x = 0;
		SqlSession session = sqlMap.openSession();	//DB ���� session ���
		//selectOne : ��ȸ�Ǵ� ���ڵ尡 �Ѱ��� ���
		x = (Integer) session.selectOne("member.count");
		System.out.println("member ���̺��� ���ڵ� ���� : " + x);
		System.out.println("Member ���̺� ���� =================");
		//member ���̺��� ������ �о ȭ�鿡 ����ϱ�
		//selectList : ��ȸ�Ǵ� ���ڵ尡 �������� ���
		List<Member> list = session.selectList("member.list");
		for(Member m : list) {
			System.out.println(m);
		}
		//admin ���� ��ȸ�ϱ�
		System.out.println("admin ���� =================");
		Member mem = session.selectOne("member.selectid", "admin");
		System.out.println(mem);
		//�̸� ������ ��ȸ�ϱ�
		System.out.println("�̸� ������ ��ȸ�ϱ� =================");
//		list = session.selectList("member.selectname", "Ʈ");		// '%${value}%'
		list = session.selectList("member.selectname2", "%Ʈ%");		// #{value}
		for(Member m : list) {
			System.out.println(m);
		}
		//�ΰ��� �÷��� �������� ���
		System.out.println("�̸� ������ ������ ��ȸ�ϱ� ====================");
		//�̸��� 'Ʈ'�� �ְ�, ������ ���� ��ȸ�ϱ�
		Map<String,Object> map = new HashMap<>();
		map.put("name","%Ʈ%");
		map.put("gender",2);
		list = session.selectList("member.selectnamegender", map);
		for(Member m : list) {
			System.out.println(m);
		}
	}
}