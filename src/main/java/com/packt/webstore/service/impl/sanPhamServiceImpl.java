/**
 *
 */
package com.packt.webstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.packt.webstore.domain.sanpham;
import com.packt.webstore.domain.repository.sanPhamRepository;
import com.packt.webstore.service.sanPhamService;

/**
 *
 */
@Service
public class sanPhamServiceImpl implements sanPhamService {

	@Autowired
	private sanPhamRepository repository;

	@Override
	public List<sanpham> getList() {
		// TODO Auto-generated method stub
		return repository.getList();
	}

	@Override
	public void add(sanpham sp) {
		// TODO Auto-generated method stub
		repository.add(sp);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		for (sanpham sp : repository.getList()) {
			if (sp.getId() == id) {
				repository.delete(id);
			}
		}
	}

	@Override
	public sanpham detail(int id) {
		// TODO Auto-generated method stub
		return repository.detail(id);
	}

	@Override
	public void update(int id, sanpham sp) {
		// TODO Auto-generated method stub
		sanpham update = repository.detail(id);
		update.setName(sp.getName());
		update.setPrice(sp.getPrice());
		update.setImg(sp.getImg());
		update.setMota(sp.getMota());
		update.setIddm(sp.getIddm());
		repository.update(id, sp);
	}

	@Override
	public void saveOrUpdate(sanpham sp) {
		// TODO Auto-generated method stub
		repository.saveOrUpdate(sp);
	}

}
