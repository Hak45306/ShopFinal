/**
 * 
 */
package com.packt.webstore.domain.repository;

import java.util.List;

import com.packt.webstore.domain.hoadon;

/**
 * 
 */
public interface hoaDonRepository {
	List<hoadon> getList();

	List<hoadon> getListUser(int iduser);

	void add(hoadon hd);

	void delete(int id);

	hoadon detail(int id);

	hoadon detailIduser(int iduser);

	void update(int id, hoadon hd);

	void saveOrUpdate(hoadon hd);
}
