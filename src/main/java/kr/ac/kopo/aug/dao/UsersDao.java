package kr.ac.kopo.aug.dao;

import java.util.List;

import kr.ac.kopo.aug.model.Users;
import kr.ac.kopo.aug.pager.Pager;

public interface UsersDao {

	Users login(Users users);

	void signup(Users item);

	int checkId(String id);

	int checkLogin(String id);

	int total(Pager pager);

	List<Users> list(Pager pager);

	Users item(String id);

	void update(Users item);

	void delete(String id);



}
