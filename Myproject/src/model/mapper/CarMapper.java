package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Car;
import model.Repair;

public interface CarMapper {

	@Insert("insert into car (id,cartype,repairtype,repairdate,repairno,inputkm,repaircost) values(#{id},#{cartype},1,#{repairdate},#{repairno},#{inputkm},#{repaircost})")
	int insert(Car car);	//정비 추가

	@Select({
		"<script>",
		"select * from car where id=#{id} and repairtype=#{repairtype} and cartype=#{cartype}",
		"<choose>",
		"<when test='repairtype!=3 and y != null'> and year(repairdate)=${y}</when>",
		"<when test='repairtype!=3 and m != null'> and month(repairdate)=${m}</when>",
		"<when test='repairtype==3 and y != null'> and year(insurancedate)=${y}</when>",
		"<when test='repairtype==3 and m != null'> and month(insurancedate)=${m}</when>",
		"</choose>",
		" order by insurancedate desc",
		"</script>"
	})
	List<Car> selectlist(Map<String, Object> map);

	@Delete({
		"<script>",
		"delete from car where id=#{id}",
		"<if test='cartype != null'> and cartype=#{cartype}</if>",
		"</script>"
	})
	int delete(Map<String, Object> map);

	@Insert("insert into car (id,cartype,repairtype,repairdate,fuelprice,fuel,tot) values(#{id},#{cartype},2,#{repairdate},#{fuelprice},#{fuel},#{fuelprice}*#{fuel})")
	int insert2(Car car);	//주유 추가

	@Insert("insert into car (id,cartype,repairtype,insurancedate,insurancecost) values(#{id},#{cartype},3,#{insurancedate},#{insurancecost})")
	int insert3(Car car);	//보험금 추가

	@Insert("insert into car (id,cartype,repairtype,repairdate,repairname,repaircost) values(#{id},#{cartype},4,#{repairdate},#{repairname},#{repaircost})")
	int insert4(Car car);	//기타유지비 추가

	@Insert("insert into repair (repairno, chgname, chgdate) values(#{repairno}, #{chgname}, #{chgdate})")
	int insert5(Map<String, Object> map);
	
	@Select({
		"<script>",
		"select * from car c join repair r where c.repairno=r.repairno and id=#{id} and cartype=#{cartype} and repairtype=#{repairtype}",
		"<if test='y != null'> and year(repairdate)=${y}</if>",
		"<if test='m != null'> and month(repairdate)=${m}</if>",
		"<if test='chgname != null'> and chgname=#{chgname}</if>",
		" order by repairdate desc",
		"</script>"
	})
	List<Car> selectFormlist(Map<String, Object> map);

	@Select("select * from car c join repair r where c.repairno=r.repairno and no=#{no}")
	Car selectOne(int no);

	@Select("select * from car where no=#{no}")
	Car selectOne2(int no);
	
	@Update("update car set repairno=#{repairno}, inputkm=#{inputkm}, repaircost=#{repaircost} where no=#{no}")
	int update(Map<String, Object> map);

	@Update("update car set fuelprice=#{fuelprice}, fuel=#{fuel}, tot=#{tot} where no=#{no}")
	int update2(Map<String, Object> map);
	
	@Update("update car set insurancecost=#{insurancecost} where no=#{no}")
	int update3(Map<String, Object> map);
	
	@Update("update car set repairname=#{repairname}, repaircost=#{repaircost} where no=#{no}")
	int update4(Map<String, Object> map);
	
	@Select("select * from repair")
	List<Repair> rplist();

	@Delete("delete from car where no=#{no}")
	int deleterepair(int no);

	/*
	 * @Select("SELECT m, SUM(s) t FROM" +
	 * " (SELECT MONTH(c1.repairdate) m, sum(IFNULL(c1.repaircost,0))+SUM(IFNULL(c1.tot,0))+SUM(IFNULL(c2.insurancecost,0)) s"
	 * +
	 * " FROM car c1 join car c2 WHERE c1.no=c2.no AND c1.id=#{id} AND c1.cartype=#{cartype} AND c1.repairdate is not null GROUP BY MONTH(c1.repairdate)"
	 * + " union" +
	 * " SELECT MONTH(c2.insurancedate) m, sum(IFNULL(c1.repaircost,0))+SUM(IFNULL(c1.tot,0))+SUM(IFNULL(c2.insurancecost,0)) s"
	 * +
	 * " FROM car c1 join car c2 WHERE c1.no=c2.no AND c1.id=#{id} AND c1.cartype=#{cartype} AND c2.insurancedate is not null GROUP BY MONTH(c1.insurancedate)) a"
	 * + " GROUP BY m") List<Map<String, Integer>> monthgraph(Map<String, Object>
	 * map);
	 */
	
	@Select({
		"<script>",
		"select m, sum(s) t from",
		" (select MONTH(c1.repairdate) m, sum(IFNULL(c1.repaircost,0))+sum(IFNULL(c1.tot,0)) s",
		" from car c1 join car c2 where c1.no=c2.no and c1.id=#{id} and c1.cartype=#{cartype} and c1.repairdate is not null and YEAR(c1.repairdate)=#{year} group by month(c1.repairdate)",
		" union",
		" select month(c2.insurancedate) m, sum(IFNULL(c2.insurancecost,0)) s",
		" from car c1 join car c2 where c1.no=c2.no and c1.id=#{id} and c1.cartype=#{cartype} and c2.insurancedate is not null and YEAR(c2.insurancedate)=#{year} group by month(c2.insurancedate)) a",
		" group by m",
		"</script>"
	})
	List<Map<String, Integer>> monthgraph(Map<String, Object> map);

	
	@Select({
		"<script>",
		"select m, sum(s) t from",
		" (select YEAR(c1.repairdate) m, sum(IFNULL(c1.repaircost,0))+sum(IFNULL(c1.tot,0)) s",
		" from car c1 join car c2 where c1.no=c2.no and c1.id=#{id} and c1.cartype=#{cartype} and c1.repairdate is not null",
		"<if test='year != null'> and year(c1.repairdate)=#{year}</if>",
		" group by YEAR(c1.repairdate)",
		" union",
		" select YEAR(c2.insurancedate) m, sum(IFNULL(c2.insurancecost,0)) s",
		" from car c1 join car c2 where c1.no=c2.no and c1.id=#{id} and c1.cartype=#{cartype} and c2.insurancedate is not null",
		"<if test='year != null'> and year(c2.insurancedate)=#{year}</if>",
		"group by YEAR(c2.insurancedate)) a",
		" group by m order by m",
		"</script>"
	})
	List<Map<String, Integer>> yeargraph(Map<String, Object> map);
	
	@Select({
		"<script>",
		"select month(repairdate) m, sum(ifnull(repaircost,0))+sum(ifnull(tot,0)) t from car where id=#{id}",
		" and cartype=${cartype} and repairtype=${repairtype} and year(repairdate)=${year} group by m",
		"</script>"
	})
	List<Map<String, Integer>> eachgraph(Map<String, Object> map);

	@Select("select max(repairno) from repair")
	int getno();

}