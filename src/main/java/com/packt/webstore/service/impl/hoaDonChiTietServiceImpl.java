/**
 * 
 */
package com.packt.webstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.packt.webstore.domain.hoadonchitiet;
import com.packt.webstore.domain.repository.hoaDonChiTietRepository;
import com.packt.webstore.service.hoaDonChiTietService;

/**
 * 
 */
@Service
public class hoaDonChiTietServiceImpl implements hoaDonChiTietService {
	@Autowired
	hoaDonChiTietRepository repository;

	@Override
	public List<hoadonchitiet> getList() {
		// TODO Auto-generated method stub
		return repository.getList();
	}

	@Override
	public List<hoadonchitiet> getListHD(int id) {
		// TODO Auto-generated method stub
		return repository.getListHD(id);
	}

	@Override
	public void add(hoadonchitiet hdct) {
		// TODO Auto-generated method stub
		repository.add(hdct);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public hoadonchitiet detail(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(int id, hoadonchitiet hdct) {
		// TODO Auto-generated method stub

	}

}
