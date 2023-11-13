/**
 *
 */
package com.packt.webstore.service;

import java.util.List;

import com.packt.webstore.domain.giohang;

/**
 *
 */
public interface gioHangService {

	List<giohang> getList();

	List<giohang> getListUser(int iduser);

	void add(giohang gh);

	void delete(int id);

	giohang detail(int id);

	giohang detailIdSP(int idsp);

	void update(int id, giohang gh);

	void saveOrUpdate(giohang gh);
}
