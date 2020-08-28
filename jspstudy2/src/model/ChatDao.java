package model;

import org.apache.ibatis.session.SqlSession;
import model.mapper.ChatMapper;

public class ChatDao {
	public void insert(String message) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			String[] messages = message.split(":");
			String id = messages[0];
			String content = messages[1];
			session.getMapper(ChatMapper.class).insert(id, content);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
	}
}