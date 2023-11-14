/**
 * 
 */
package com.packt.webstore.service;

import java.util.List;

import com.packt.webstore.domain.hoadonchitiet;

/**
 * 
 */
public interface hoaDonChiTietService {
	List<hoadonchitiet> getList();

	List<hoadonchitiet> getListHD(int id);

	void add(hoadonchitiet hdct);

	void delete(int id);

	hoadonchitiet detail(int id);

	void update(int id, hoadonchitiet hdct);

}
