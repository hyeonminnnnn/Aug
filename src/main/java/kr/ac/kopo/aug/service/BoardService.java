package kr.ac.kopo.aug.service;

import java.util.List;

import kr.ac.kopo.aug.model.Board;
import kr.ac.kopo.aug.pager.Pager;

public interface BoardService {

	List<Board> mlist(Pager pager);
	
	List<Board> clist(Pager pager);
	
	List<Board> nlist(Pager pager);
	
	void cwrite(Board item);

	Board item(int id);

	void update(Board item);

	void delete(int id);

	void mwrite(Board item);

	void viewCount(int id);

	boolean deleteAttach(int id);

	void commentCount(int id);

	void nwrite(Board item);

	

}
