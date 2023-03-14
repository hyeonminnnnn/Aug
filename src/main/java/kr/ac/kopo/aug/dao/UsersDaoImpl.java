package kr.ac.kopo.aug.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.aug.model.Users;
import kr.ac.kopo.aug.pager.Pager;

@Repository
public class UsersDaoImpl implements UsersDao {

	@Autowired
	SqlSession sql;

	@Override
	public Users login(Users users) {
		return sql.selectOne("users.login", users);
	}

	@Override
	public void signup(Users item) {
		sql.insert("users.signup", item);
	}

	@Override
	public int checkId(String id) {
		return sql.selectOne("users.check_id", id);
	}

	@Override
	public int checkLogin(String id) {
		return sql.selectOne("users.check_login", id);
	}

	@Override
	public int total(Pager pager) {
		return sql.selectOne("users.total", pager);
	}

	@Override
	public List<Users> list(Pager pager) {
		return sql.selectList("users.list", pager);
	}

	@Override
	public Users item(String id) {
		return sql.selectOne("users.item", id);
	}

	@Override
	public void update(Users item) {
		sql.update("users.update", item);
	}

	@Override
	public void delete(String id) {
		sql.delete("users.delete", id);
	}

	

}
