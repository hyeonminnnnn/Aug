package kr.ac.kopo.aug.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.aug.dao.CateDao;
import kr.ac.kopo.aug.model.Cate;

@Service
public class CateServiceImpl implements CateService {

	@Autowired
	CateDao dao;
	
	@Override
	public List<Cate> list() {
		return dao.list();
	}

}
