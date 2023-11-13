/**
 *
 */
package com.packt.webstore.service;

import java.util.List;

import com.packt.webstore.domain.sanpham;

/**
 *
 */
public interface shopService {
	List<sanpham> getList();

	sanpham detail(int id);

	void update(int id, sanpham sp);

	void updateSlLow(int id);

	void updateSlHigh(int id);
}
