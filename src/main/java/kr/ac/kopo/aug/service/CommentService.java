package kr.ac.kopo.aug.service;

import java.util.List;

import kr.ac.kopo.aug.model.Comment;

public interface CommentService {

	List<Comment> clist(int id);

	void write(Comment item);

	void delete(Comment item);

	String idCheck(int cno);


}
