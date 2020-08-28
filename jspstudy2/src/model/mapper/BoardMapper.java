package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;

public interface BoardMapper {
	
	@Select("select ifnull(max(num),0) from board")
	int selectMax();

	@Insert("insert into board (num,name, pass, subject, content, file1, regdate, readcnt, grp,grplevel,grpstep) "
			+ " values(#{num},#{name},#{pass},#{subject},#{content},#{file1},now(),0,#{grp},#{grplevel},#{grpstep})")
	void insert(Board board);

	@Select({
		"<script>",
		"select count(*) from board",
		"<if test='search1 != null'> where ${search1} like '%${inputsearch}%'</if>",
		"<if test='search2 != null'> or ${search2} like '%${inputsearch}%'</if>",
		"<if test='search3 != null'> or ${search3} like '%${inputsearch}%'</if>",
		"</script>"
	})
	int boardCount(Map<String, Object> map);

	@Select({
		"<script>",
		"select * from board",
		"<if test='search1 != null'> where ${search1} like '%${inputsearch}%'</if>",
		"<if test='search2 != null'> or ${search2} like '%${inputsearch}%'</if>",
		"<if test='search3 != null'> or ${search3} like '%${inputsearch}%'</if>",
		"<if test='num != null'> where num=#{num}</if>",
		"<if test='pageNum != null'> order by grp desc, grpstep asc limit #{pageNum},#{limit}</if>",
		"</script>"
	})
	List<Board> select(Map<String,Object> map);

	@Update("update board set readcnt = readcnt + 1 where num = #{num}")	//숫자일 경우 #{value}, #{num} 모두 사용 가능
	void readcntAdd(int num);

	@Update("update board set grpstep = grpstep + 1 where grp = #{grp} and grpstep > #{grpstep}")
	void grpStepAdd(@Param("grp")int grp, @Param("grpstep")int grpstep);

	@Update("update board set name=#{name},subject=#{subject},content=#{content},file1=#{file1} where num=#{num}")
	void update(Board board);

	@Delete("delete from board where num=#{value}")
	void delete(int num);

	//[{name:'홍길동',cnt:9},{name:'123',cnt:3}, ...] 형태의 리스트

	@Select("select name, count(*) cnt from board group by name having count(*) > 1 order by cnt desc")
	List<Map<String,Integer>> graph();
	
	//"select date_format(regdate, '%Y-%m-%d') regdate, count(*) cnt from board group by date_format(regdate,'%Y%m%d') order by regdate desc LIMIT 0,7"
	@Select("select date_format(regdate, '%Y%m%d') d, count(*) cnt from board group by d having datediff(NOW(),d) BETWEEN 0 AND 7 order by d desc")
	List<Map<String,Integer>> graph2();
}
