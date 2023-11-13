/**
 *
 */
package com.packt.webstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.packt.webstore.domain.taikhoan;
import com.packt.webstore.domain.repository.taiKhoanRepository;
import com.packt.webstore.service.taiKhoanService;

/**
 *
 */
@Service
public class taiKhoanServiceImpl implements taiKhoanService {

	@Autowired
	taiKhoanRepository repository;

	@Override
	public List<taikhoan> list() {
		// TODO Auto-generated method stub
		return repository.list();
	}

	@Override
	public taikhoan accountName(String user) {
		// TODO Auto-generated method stub
		return repository.accountName(user);
	}

	@Override
	public void register(taikhoan tk) {
		// TODO Auto-generated method stub
		repository.register(tk);
	}

	@Override
	public taikhoan detail(int id) {
		// TODO Auto-generated method stub
		return repository.detail(id);
	}

	@Override
	public void saveOrUpdate(taikhoan tk) {
		// TODO Auto-generated method stub
		repository.saveOrUpdate(tk);
	}

	@Override
	public void update(int id, taikhoan tk) {
		// TODO Auto-generated method stub
		repository.update(id, tk);
	}

}
