package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;
import model.BoardComment;
import model.Member;

public interface BoardMapper {
	
	@Select("select ifnull(max(num),0) from board")
	int selectMax();

	@Insert("insert into board (num,id, subject, content, file1, regdate, readcnt, grp,grplevel,grpstep,boardtype) "
			+ " values(#{num},#{id},#{subject},#{content},#{file1},now(),0,#{grp},#{grplevel},#{grpstep},#{boardtype})")
	void insert(Board board);

	@Select({
		"<script>",
		"select count(*) from board where boardtype=#{boardtype} and id != 'admin'",
		"<if test='search1 != null'> and ${search1} like '%${inputsearch}%'</if>",
		"<if test='search2 != null'> or ${search2} like '%${inputsearch}%'</if>",
		"<if test='search3 != null'> or ${search3} like '%${inputsearch}%'</if>",
		"</script>"
	})
	int boardCount(Map<String, Object> map);

	@Select({
		"<script>",
		"select * from board where boardtype=#{boardtype} and id != 'admin'",
		"<if test='search1 != null'> and ${search1} like '%${inputsearch}%'</if>",
		"<if test='search2 != null'> or ${search2} like '%${inputsearch}%'</if>",
		"<if test='search3 != null'> or ${search3} like '%${inputsearch}%'</if>",
		"<if test='num != null'> and num=#{num}</if>",
		"<if test='pageNum != null'> order by grp desc, grpstep asc limit #{pageNum},#{limit}</if>",
		"</script>"
	})
	List<Board> select(Map<String,Object> map);	//일반글 읽기
	
	@Select("select * from board where boardtype=#{boardtype} and num=#{num} and id='admin'")
	List<Board> select2(Map<String, Object> map);	//공지글 읽기

	@Update("update board set readcnt = readcnt + 1 where num = #{num}")	//숫자일 경우 #{value}, #{num} 모두 사용 가능
	void readcntAdd(int num);

	@Update("update board set grpstep = grpstep + 1 where grp = #{grp} and grpstep > #{grpstep}")
	void grpStepAdd(@Param("grp")int grp, @Param("grpstep")int grpstep);

	@Update("update board set subject=#{subject},content=#{content},file1=#{file1} where num=#{num} and boardtype=#{boardtype}")
	void update(Board board);

	@Delete("delete from board where num=#{value}")
	int delete(int num);

	@Delete("delete from board where id=#{id}")
	int deleteall(String id);
	
	@Select("select * from board where boardtype=0 and id!='admin' order by regdate desc limit 10")
	List<Board> selectmainlist();
	
	@Select("select * from board where boardtype=1 and id!='admin' order by regdate desc limit 10")
	List<Board> selectmainlist2();
	
	@Select({
		"<script>",
		"select b, sum(s) t from ",
		"(SELECT brand1 b, COUNT(*) s FROM member where brand1 is not null GROUP BY brand1",
		" union all",
		" SELECT brand2 b, COUNT(*) s FROM member WHERE brand2 IS NOT NULL GROUP BY brand2) a",
		" GROUP BY b",
		" order by t desc limit 5",
		"</script>"
	})
	List<Map<String, Integer>> top5list();

	@Insert("insert into boardcomment (cnum, num, id, comment, cregdate) values(${cnum}, ${num}, #{id}, #{comment}, #{cregdate})")
	int insertComment(BoardComment bc);

	@Select("select * from boardcomment where num=#{num}")
	List<BoardComment> selectComment(int num);

	@Select("select count(*) from boardcomment where num=#{num}")
	int Commentmaxnum(int num);

	@Delete({
		"<script>",
		"delete from boardcomment",
		"<if test='num != 0'> where num=#{num} </if>",
		"<if test='id != null'> where id=#{id} </if>",
		"</script>"
	})
	int deleteAllComment(Map<String, Object> map);

	@Delete("delete from boardcomment where cnum=#{cnum}")
	int deleteComment(int cnum);

	@Select("select * from board where id='admin' and boardtype=#{boardtype}")
	List<Board> adminlist(int boardtype);

	

}
