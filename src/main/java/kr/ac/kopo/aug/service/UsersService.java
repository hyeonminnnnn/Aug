package kr.ac.kopo.aug.service;

import java.util.List;

import kr.ac.kopo.aug.model.Users;
import kr.ac.kopo.aug.pager.Pager;

public interface UsersService {

	boolean login(Users users);

	void signup(Users item);

	boolean checkId(String id);

	boolean checkLogin(String id);

	List<Users> list(Pager pager);

	void update(Users item);

	Users item(String id);

	void delete(String id);

}
