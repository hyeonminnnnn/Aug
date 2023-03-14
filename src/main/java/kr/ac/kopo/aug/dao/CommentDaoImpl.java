package kr.ac.kopo.aug.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.aug.model.Comment;

@Repository
public class CommentDaoImpl implements CommentDao {

	@Autowired
	SqlSession sql;

	@Override
	public List<Comment> clist(int id) {
		return sql.selectList("comment.clist", id);
	}

	@Override
	public void write(Comment item) {
		sql.insert("comment.write", item);
	}

	@Override
	public void delete(Comment item) {
		sql.delete("comment.delete", item);
	}

	@Override
	public String idCheck(int cno) {
		return sql.selectOne("comment.comIdChk", cno);
	}
	
	

}
