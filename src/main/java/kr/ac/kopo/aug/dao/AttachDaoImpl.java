package kr.ac.kopo.aug.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.aug.model.Attach;

@Repository
public class AttachDaoImpl implements AttachDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public void add(Attach attach) {
		sql.insert("attach.add", attach);
	}

	@Override
	public void deleteById(int boId) {
		sql.delete("attach.delete_id", boId);
	}

	@Override
	public boolean delete(int id) {
		if(sql.delete("attach.delete", id) == 1) {
			return true;
		}
			return false;
	}

}
