package kr.ac.kopo.aug.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.aug.model.Cate;

@Repository
public class CateDaoImpl implements CateDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Cate> list() {
		return sql.selectList("cate.list");
	}

}
