/**
 *
 */
package com.packt.webstore.domain.repository;

import java.util.List;

import com.packt.webstore.domain.sanpham;

/**
 *
 */
public interface shopRepository {

	List<sanpham> getList();

	sanpham detail(int id);

	void update(int id, sanpham sp);

	void updateSlLow(int id);

	void updateSlHigh(int id);

}
