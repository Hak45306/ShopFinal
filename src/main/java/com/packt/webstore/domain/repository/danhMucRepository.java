/**
 *
 */
package com.packt.webstore.domain.repository;

import java.util.List;

import com.packt.webstore.domain.danhmuc;

/**
 *
 */
public interface danhMucRepository {
	List<danhmuc> getList();

	void add(danhmuc dm);

	void delete(int id);

	danhmuc detail(int id);

	void update(int id, danhmuc dm);

	void saveOrUpdate(danhmuc dm);
}
