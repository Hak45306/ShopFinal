/**
 *
 */
package com.packt.webstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.packt.webstore.domain.giohang;
import com.packt.webstore.domain.repository.gioHangRepository;
import com.packt.webstore.service.gioHangService;

/**
 *
 */
@Service
public class gioHangServiceImpl implements gioHangService {

	@Autowired
	private gioHangRepository repository;

	@Override
	public List<giohang> getList() {
		// TODO Auto-generated method stub
		return repository.getList();
	}

	@Override
	public void add(giohang gh) {
		// TODO Auto-generated method stub
		repository.add(gh);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		for (giohang gh : repository.getList()) {
			if (gh.getId() == id) {
				repository.delete(id);
			}
		}
	}

	@Override
	public giohang detail(int id) {
		// TODO Auto-generated method stub
		return repository.detail(id);
	}

	@Override
	public void update(int id, giohang gh) {
		// TODO Auto-generated method stub
		repository.update(id, gh);
	}

	@Override
	public giohang detailIdSP(int idsp) {
		// TODO Auto-generated method stub
		return repository.detail(idsp);
	}

	@Override
	public List<giohang> getListUser(int iduser) {
		// TODO Auto-generated method stub
		return repository.getListUser(iduser);
	}

	@Override
	public void saveOrUpdate(giohang gh) {
		// TODO Auto-generated method stub
		repository.saveOrUpdate(gh);
	}

}
