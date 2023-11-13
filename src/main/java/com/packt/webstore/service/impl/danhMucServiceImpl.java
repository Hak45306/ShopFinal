/**
 *
 */
package com.packt.webstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.packt.webstore.domain.danhmuc;
import com.packt.webstore.domain.repository.danhMucRepository;
import com.packt.webstore.service.danhMucService;

/**
 *
 */
@Service
public class danhMucServiceImpl implements danhMucService {

	@Autowired
	private danhMucRepository repository;

	@Override
	public List<danhmuc> getList() {
		// TODO Auto-generated method stub
		return repository.getList();
	}

	@Override
	public void add(danhmuc dm) {
		// TODO Auto-generated method stub
		repository.add(dm);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		for (danhmuc dm : repository.getList()) {
			if (dm.getId() == id) {
				repository.delete(id);
			}
		}
	}

	@Override
	public danhmuc detail(int id) {
		// TODO Auto-generated method stub
		return repository.detail(id);
	}

	@Override
	public void update(int id, danhmuc dm) {
		// TODO Auto-generated method stub
		danhmuc update = repository.detail(id);
		update.setName(dm.getName());
		repository.update(id, update);
	}

	@Override
	public void saveOrUpdate(danhmuc dm) {
		// TODO Auto-generated method stub
		repository.saveOrUpdate(dm);
	}

}
