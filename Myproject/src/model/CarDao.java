package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.CarMapper;

public class CarDao {
	private Class<CarMapper> cls = CarMapper.class;
	private Map<String, Object> map = new HashMap<>();

	public int insert(Car car) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).insert(car);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public List<Car> selectlist(String id, String cartype, int repairtype, String y, String m) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("id", id);
			map.put("cartype", cartype);
			map.put("repairtype", repairtype);
			map.put("y",y);
			map.put("m",m);
			return session.getMapper(cls).selectlist(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public int delete(String id, int cartype) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("id", id);
			if(cartype==0) {
				map.put("cartype", null);
			} else {
				map.put("cartype",cartype);
			}
			return session.getMapper(cls).delete(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int insert2(Car car) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).insert2(car);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int insert3(Car car) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).insert3(car);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int insert4(Car car) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).insert4(car);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	public int insert5(int repairno, String chgname, int chgdate) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("repairno", repairno);
			map.put("chgname", chgname);
			map.put("chgdate", chgdate);
			return session.getMapper(cls).insert5(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public List<Car> selectFormlist(String id, String cartype, String repairtype, String y, String m, String chgname) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("id", id);
			map.put("cartype", cartype);
			map.put("repairtype", repairtype);
			map.put("y", y);
			map.put("m", m);
			map.put("chgname", chgname);
			return session.getMapper(cls).selectFormlist(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public Car selectOne(int no) {	//沥厚包府
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectOne(no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	public Car selectOne2(int no) {	//林蜡包府, 焊氰陛包府, 扁鸥包府
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectOne2(no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public int update(int no, int repairno, int inputkm, int repaircost) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("no", no);
			map.put("repairno", repairno);
			map.put("inputkm", inputkm);
			map.put("repaircost", repaircost);
			return session.getMapper(cls).update(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int update2(int no, int fuelprice, int fuel, int tot) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("no", no);
			map.put("fuelprice", fuelprice);
			map.put("fuel", fuel);
			map.put("tot", tot);
			return session.getMapper(cls).update2(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	public int update3(int no, int insurancecost) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("no", no);
			map.put("insurancecost", insurancecost);
			return session.getMapper(cls).update3(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	public int update4(int no, String repairname, int repaircost) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("no", no);
			map.put("repairname", repairname);
			map.put("repaircost", repaircost);
			return session.getMapper(cls).update4(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	public List<Repair> rplist() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).rplist();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public int deleterepair(int no) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).deleterepair(no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public List<Map<String, Integer>> monthgraph(String id, String cartype, String year) {
		SqlSession session = MyBatisConnection.getConnection();
		List<Map<String,Integer>> list = null;
		try {
			map.clear();
			map.put("id", id);
			map.put("cartype", cartype);
			map.put("year", year);	
			list = session.getMapper(cls).monthgraph(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return list;
	}

	public List<Map<String, Integer>> yeargraph(String id, String cartype) {
		SqlSession session = MyBatisConnection.getConnection();
		List<Map<String,Integer>> list = null;
		try {
			map.clear();
			map.put("id", id);
			map.put("cartype", cartype);
			list = session.getMapper(cls).yeargraph(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return list;
	}

	public List<Map<String, Integer>> eachgraph(String id, String cartype, String year, String repairtype) {
		SqlSession session = MyBatisConnection.getConnection();
		List<Map<String,Integer>> list = null;
		try {
			map.clear();
			map.put("id", id);
			map.put("cartype", cartype);
			map.put("year", year);
			map.put("repairtype", repairtype);
			list = session.getMapper(cls).eachgraph(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return list;
	}

	public List<Map<String, Integer>> cost(String id, String cartype, String year) {
		SqlSession session = MyBatisConnection.getConnection();
		List<Map<String,Integer>> list = null;
		try {
			map.clear();
			map.put("id", id);
			map.put("cartype", cartype);
			map.put("year", year);
			list = session.getMapper(cls).yeargraph(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return list;
	}

	public int getno() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).getno();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

}