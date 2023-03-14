package kr.ac.kopo.aug.dao;

import java.util.List;

import kr.ac.kopo.aug.model.Comment;

public interface CommentDao {

	List<Comment> clist(int id);

	void write(Comment item);

	void delete(Comment item);

	String idCheck(int cno);


}
