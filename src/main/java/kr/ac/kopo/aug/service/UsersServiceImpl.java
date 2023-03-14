package kr.ac.kopo.aug.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.aug.dao.UsersDao;
import kr.ac.kopo.aug.model.Users;
import kr.ac.kopo.aug.pager.Pager;

@Service
public class UsersServiceImpl implements UsersService {
	
	@Autowired
	UsersDao dao;
	
	@Override
	public boolean login(Users users) {
		Users item = dao.login(users);
		
		if(item != null) {
			users.setPasswd(null);
			users.setNickname(item.getNickname());
			users.setRegDate(item.getRegDate());
			users.setGrade(item.getGrade());
			
			return true;
		}else {
			return false;
		}
	}

	@Override
	public void signup(Users item) {
		dao.signup(item);
	}

	@Override
	public boolean checkId(String id) {
		if(dao.checkId(id) == 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean checkLogin(String id) {
		if(dao.checkLogin(id) == 0)
			return true;
		else
			return false;
	}

	@Override
	public List<Users> list(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.list(pager);
	}

	@Override
	public Users item(String id) {
		return dao.item(id);
	}

	@Override
	public void update(Users item) {
		dao.update(item);
	}

	@Override
	public void delete(String id) {
		dao.delete(id);
	}



}
