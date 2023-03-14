package kr.ac.kopo.aug.dao;

import java.util.List;

import kr.ac.kopo.aug.model.Board;
import kr.ac.kopo.aug.pager.Pager;


public interface BoardDao {

	List<Board> mlist(Pager pager);
	
	List<Board> clist(Pager pager);

	void cwrite(Board item);

	Board item(int id);

	void update(Board item);

	void delete(int id);

	void mwrite(Board item);

	int total(Pager pager);

	int totals(Pager pager);

	void viewCount(int id);

	void commentCount(int id);

	int ntotal(Pager pager);

	List<Board> nlist(Pager pager);

	void nwrite(Board item);

}
