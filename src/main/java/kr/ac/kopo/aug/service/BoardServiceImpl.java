package kr.ac.kopo.aug.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.aug.dao.AttachDao;
import kr.ac.kopo.aug.dao.BoardDao;
import kr.ac.kopo.aug.model.Attach;
import kr.ac.kopo.aug.model.Board;
import kr.ac.kopo.aug.pager.Pager;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;
	
	@Autowired
	AttachDao attachDao;
	
	@Override
	public List<Board> mlist(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.mlist(pager);
	}
	
	@Override
	public List<Board> clist(Pager pager) {
		int total = dao.totals(pager);
		
		pager.setTotal(total);
		
		return dao.clist(pager);
	}

	@Override
	public List<Board> nlist(Pager pager) {

		int total = dao.ntotal(pager);
		
		pager.setTotal(total);
		
		return dao.nlist(pager);
	}
	
	@Override
	@Transactional
	public void cwrite(Board item) {
		dao.cwrite(item);
		
		if(item.getAttachs() != null) {
			for(Attach attach : item.getAttachs()) {
				attach.setBoId(item.getid());
				
				attachDao.add(attach);
			}
		}
	}
	
	@Override
	@Transactional
	public void mwrite(Board item) {
		dao.mwrite(item);
		
		if(item.getAttachs() != null) {
			for(Attach attach : item.getAttachs()) {
				attach.setBoId(item.getid());
				
				attachDao.add(attach);
			}
		}
	}
	
	@Override
	@Transactional
	public void nwrite(Board item) {
		dao.nwrite(item);
		
		if(item.getAttachs() != null) {
			for(Attach attach : item.getAttachs()) {
				attach.setBoId(item.getid());
				
				attachDao.add(attach);
			}
		}
		
	}
	

	@Override
	public Board item(int id) {
		return dao.item(id);
	}
	
	@Transactional
	@Override
	public void update(Board item) {
		dao.update(item);
		
		if(item.getAttachs() != null) {
			for(Attach attach : item.getAttachs()) {
				attach.setBoId(item.getid());
				
				attachDao.add(attach);
			}
		}
	}

	@Override
	@Transactional
	public void delete(int id) {
		attachDao.deleteById(id);
		
		dao.delete(id);
	}

	@Override
	public void viewCount(int id) {
		dao.viewCount(id);
	}

	@Override
	public boolean deleteAttach(int id) {
		if(attachDao.delete(id)) {
			return true;
		} else
			return false;
	}

	@Override
	public void commentCount(int id) {
		dao.commentCount(id);
	}

	

	

}
