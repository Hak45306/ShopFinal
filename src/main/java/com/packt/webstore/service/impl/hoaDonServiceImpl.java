/**
 * 
 */
package com.packt.webstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.packt.webstore.domain.hoadon;
import com.packt.webstore.domain.repository.hoaDonRepository;
import com.packt.webstore.service.hoaDonService;

/**
 * 
 */
@Service
public class hoaDonServiceImpl implements hoaDonService {
	@Autowired
	hoaDonRepository repository;

	@Override
	public List<hoadon> getList() {
		// TODO Auto-generated method stub
		return repository.getList();
	}

	@Override
	public List<hoadon> getListUser(int iduser) {
		// TODO Auto-generated method stub
		return repository.getListUser(iduser);
	}

	@Override
	public void add(hoadon hd) {
		// TODO Auto-generated method stub
		repository.add(hd);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		repository.delete(id);
	}

	@Override
	public hoadon detail(int id) {
		// TODO Auto-generated method stub
		return repository.detail(id);
	}

	@Override
	public void update(int id, hoadon hd) {
		// TODO Auto-generated method stub
		repository.update(id, hd);
	}

	@Override
	public void saveOrUpdate(hoadon hd) {
		// TODO Auto-generated method stub

	}

	@Override
	public hoadon detailIduser(int iduser) {
		// TODO Auto-generated method stub
		return repository.detailIduser(iduser);
	}

}
