package kr.ac.kopo.aug.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.aug.model.Board;
import kr.ac.kopo.aug.pager.Pager;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Board> mlist(Pager pager) {
		return sql.selectList("board.mlist", pager);
	}
	
	@Override
	public List<Board> clist(Pager pager) {
		return sql.selectList("board.clist", pager);
	}

	@Override
	public List<Board> nlist(Pager pager) {
		return sql.selectList("board.nlist", pager);
	}

	@Override
	public void nwrite(Board item) {
		sql.insert("board.nwrite", item);
	}

	@Override
	public void cwrite(Board item) {
		sql.insert("board.cwrite", item);
	}

	@Override
	public Board item(int id) {
		return sql.selectOne("board.item", id);
	}

	@Override
	public void update(Board item) {
		sql.update("board.update", item);
	}

	@Override
	public void delete(int id) {
		sql.delete("board.delete", id);
	}

	@Override
	public void mwrite(Board item) {
		sql.insert("board.mwrite", item);
	}

	@Override
	public int total(Pager pager) {
		return sql.selectOne("board.total", pager);
	}

	@Override
	public int totals(Pager pager) {
		return sql.selectOne("board.totals", pager);
	}

	@Override
	public void viewCount(int id) {
		sql.update("board.viewCount", id);
	}

	@Override
	public void commentCount(int id) {
		sql.update("board.commentCount", id);
	}

	@Override
	public int ntotal(Pager pager) {
		return sql.selectOne("board.ntotal", pager);
	}

}
