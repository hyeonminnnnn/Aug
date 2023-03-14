package kr.ac.kopo.aug.dao;

import kr.ac.kopo.aug.model.Attach;

public interface AttachDao {

	void add(Attach attach);

	void deleteById(int id);

	boolean delete(int id);

}
