package kr.ac.kopo.aug.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class HeartDaoImpl implements HeartDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public int add(int boardId, String usersId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("boardId", boardId);
		map.put("usersId", usersId);
		
		return sql.insert("board.heart_add", map);
	}
	

}
