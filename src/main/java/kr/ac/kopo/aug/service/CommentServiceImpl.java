package kr.ac.kopo.aug.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.aug.dao.CommentDao;
import kr.ac.kopo.aug.model.Comment;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentDao dao;

	@Override
	public List<Comment> clist(int id) {
		return dao.clist(id);
	}

	@Override
	public void write(Comment item) {
		dao.write(item);
	}

	@Override
	public void delete(Comment item) {
		dao.delete(item);
	}

	@Override
	public String idCheck(int cno) {
		return dao.idCheck(cno);
	}

}
