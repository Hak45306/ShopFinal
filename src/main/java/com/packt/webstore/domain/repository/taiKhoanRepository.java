/**
 *
 */
package com.packt.webstore.domain.repository;

import java.util.List;

import com.packt.webstore.domain.taikhoan;

/**
 *
 */
public interface taiKhoanRepository {

	List<taikhoan> list();

	taikhoan accountName(String user);

	void register(taikhoan tk);

	void update(int id, taikhoan tk);

	taikhoan detail(int id);

	void saveOrUpdate(taikhoan tk);
}
