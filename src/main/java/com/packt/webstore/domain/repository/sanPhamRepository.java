/**
 *
 */
package com.packt.webstore.domain.repository;

import java.util.List;

import com.packt.webstore.domain.sanpham;

/**
 *
 */
public interface sanPhamRepository {
	List<sanpham> getList();

	void add(sanpham sp);

	void delete(int id);

	sanpham detail(int id);

	void update(int id, sanpham sp);

	void updateSL(int id, sanpham sp);

	void saveOrUpdate(sanpham sp);
}
