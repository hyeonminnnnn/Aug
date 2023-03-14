package kr.ac.kopo.aug.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.aug.dao.HeartDao;


@Service
public class HeartServiceImpl implements HeartService {

	@Autowired
	HeartDao dao;
	
	@Override
	public boolean add(int boardId, String usersId) {
		if(dao.add(boardId, usersId) > 0) {
			return true;
		}else {
			return false;
		}
	}



}
