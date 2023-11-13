/**
 *
 */
package com.packt.webstore.service;

import java.util.List;

import com.packt.webstore.domain.sanpham;

/**
 *
 */
public interface sanPhamService {
	List<sanpham> getList();

	void add(sanpham sp);

	void delete(int id);

	sanpham detail(int id);

	void update(int id, sanpham sp);

	void saveOrUpdate(sanpham sp);
}
