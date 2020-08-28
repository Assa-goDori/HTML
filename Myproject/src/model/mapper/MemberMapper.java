package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Member;

public interface MemberMapper {
	@Insert("insert into member (id,pass,name,tel,email,picture,rating,writecount,brand1,carname1,brand2,carname2)"
			+ "values (#{id},#{pass},#{name},#{tel},#{email},#{picture},3,0,#{brand1},#{carname1},#{brand2},#{carname2})")
	int insert(Member mem);
	
	@Select({
			"<script>",
			"select * from member ",
			"<if test='id != null'> where binary id=#{id}</if>", 
			"</script>"
	})
	List<Member> select(Map<String, Object> map);
	
	@Select("select id from member where email=#{email} and tel=#{tel}")
	String idSearch(@Param("email")String email, @Param("tel")String tel);
	
	@Select("select pass from member where id=#{id} and email=#{email}")
	String pwSearch(@Param("id")String id, @Param("email")String email);

	@Update("update member set name=#{name}, email=#{email}, tel=#{tel}, picture=#{picture} where id=#{id}")
	int update(Member m);

	@Update("update member set pass=#{pass} where id=#{id}")
	int updatePass(@Param("id")String id, @Param("pass")String pass);

	@Delete("delete from member where id=#{value}")
	int delete(String id);
	
	@Select("select picture from member where id=#{value}")
	String selectPic(String id);
	
	@Select("select rating from member where id=#{value}")
	int selectRating(String id);

	@Update({
		"<script>",
		"update member",
		"<if test='brand1 != null'> set brand1=#{brand1}, carname1=#{carname1} </if>",
		"<if test='brand2 != null'> set brand2=#{brand2}, carname2=#{carname2} </if>",
		"where id=#{id}",
		"</script>"
	})
	int updatecar(Member mem);

	@Update({
		"<script>",
		"update member",
		"<if test='cartype == null'> set brand2=null, carname2=null </if>",
		"<if test='cartype != null'> set brand1=null, carname1=null </if>",	
		"where id=#{id}",
		"</script>"
	})
	int deletecar(Map<String,Object> map);

	@Update("update member set rating=2 where id=#{id}")
	int up(String id);

	@Update("update member set rating=3 where id=#{id}")
	int down(String id);

	@Update("update member set updown=1 where id=#{id}")
	int sendupdown(String login);

	@Select("select pass from member where id=#{id}")
	String checkpass(String id);

	@Select("select * from member where id=#{id}")
	Member check(String id);

	@Update("update member set writecount = writecount+1 where id=#{login}")
	int countup(String login);

	@Update("update member set writecount = writecount-1 where id=#{login}")
	int countdown(String login);

	@Select("select brand1, brand2 from member where id=#{id}")
	Member selectcheck(String id);
}