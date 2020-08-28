package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.BoardMapper;

public class BoardDao {
	private Class<BoardMapper> cls = BoardMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	//게시물의 최대 번호 리턴
	public int maxnum() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectMax();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	public boolean insert(Board board) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).insert(board);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}
	
	public int boardCount(String search, String inputsearch, int boardtype) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("boardtype", boardtype);
			if(search != null) {
				String[] searchs = search.split(",");
				map.put("search1", searchs[0]);
				if(searchs.length>1) {
					map.put("search2", searchs[1]);
				}
				if(searchs.length>2) {
					map.put("search3", searchs[2]);
				}
				map.put("inputsearch", inputsearch);
			}
			return session.getMapper(cls).boardCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	public List<Board> list(int pageNum, int limit, String search, String inputsearch, int boardtype) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("pageNum", (pageNum-1)*limit);
			map.put("limit", limit);
			map.put("boardtype", boardtype);
			if(search != null) {
				String[] searchs = search.split(",");
				map.put("search1", searchs[0]);
				if(searchs.length>1) {
					map.put("search2", searchs[1]);
				}
				if(searchs.length>2) {
					map.put("search3", searchs[2]);
				}
				map.put("inputsearch", inputsearch);
			}
			return session.getMapper(cls).select(map);
		} catch (Exception e) {	
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;		
	}	
	
	public Board selectOne(int num, int boardtype) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("num", num);
			map.put("boardtype", boardtype);
			return session.getMapper(cls).select(map).get(0);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	public Board selectOne2(int num, int boardtype) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("num", num);
			map.put("boardtype", boardtype);
			return session.getMapper(cls).select2(map).get(0);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	public void readcntAdd(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).readcntAdd(num);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
	}
	
	public void grpStepAdd(int grp,int grpstep) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).grpStepAdd(grp,grpstep);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
	}	
	
	public boolean update(Board board) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).update(board);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}
		
	public int delete(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).delete(num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public List<Board> mainlist() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectmainlist();
		} catch (Exception e) {	
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;	
	}
	
	public List<Board> mainlist2() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectmainlist2();
		} catch (Exception e) {	
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;	
	}
	
	public List<Map<String, Integer>> top5list() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).top5list();
		} catch (Exception e) {	
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public int insertComment(BoardComment bc) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).insertComment(bc);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public List<BoardComment> selectComment(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectComment(num);
		} catch (Exception e) {	
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;	
	}

	public int Commentmaxnum(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).Commentmaxnum(num);
		} catch (Exception e) {	
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;	
	}

	public int deleteall(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).deleteall(id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int deleteAllComment(String id, int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("id", id);
			map.put("num", num);
			return session.getMapper(cls).deleteAllComment(map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int deleteComment(int cnum) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).deleteComment(cnum);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public List<Board> adminlist(int boardtype) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).adminlist(boardtype);
		} catch (Exception e) {	
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	

}