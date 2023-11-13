/**
 *
 */
package com.packt.webstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.packt.webstore.domain.sanpham;
import com.packt.webstore.domain.repository.shopRepository;
import com.packt.webstore.service.shopService;

/**
 *
 */
@Service
public class shopServiceImpl implements shopService {

	@Autowired
	private shopRepository repository;

	@Override
	public List<sanpham> getList() {
		// TODO Auto-generated method stub
		return repository.getList();
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
	public void updateSlLow(int id) {
		// TODO Auto-generated method stub
		repository.updateSlLow(id);
	}

	@Override
	public void updateSlHigh(int id) {
		// TODO Auto-generated method stub
		repository.updateSlHigh(id);
	}

}
