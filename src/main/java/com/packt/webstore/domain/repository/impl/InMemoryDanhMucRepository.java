/**
 *
 */
package com.packt.webstore.domain.repository.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.packt.webstore.domain.danhmuc;
import com.packt.webstore.domain.repository.danhMucRepository;

/**
 *
 */
@Repository
public class InMemoryDanhMucRepository implements danhMucRepository {
	@Autowired
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Override
	public List<danhmuc> getList() {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		List<danhmuc> result = jdbcTemplate.query("SELECT *FROM danhmuc", map, new DanhMucMapper());
		return result;
	}

	private static final class DanhMucMapper implements RowMapper<danhmuc> {
		@Override
		public danhmuc mapRow(ResultSet rs, int rowNum) throws SQLException {
			danhmuc dm = new danhmuc();
			dm.setId(rs.getInt("id"));
			dm.setName(rs.getString("name"));
			return dm;
		}
	}

	@Override
	public void add(danhmuc dm) {
		// TODO Auto-generated method stub
		String SQL = "INSERT INTO danhmuc (name) " + "VALUES (:ten)";
		Map<String, Object> map = new HashMap<>();
		map.put("ten", dm.getName());
		jdbcTemplate.update(SQL, map);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		String SQL = "Delete From danhmuc where id=:id";
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		jdbcTemplate.update(SQL, map);
	}

	@Override
	public danhmuc detail(int id) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		String SQL = "SELECT *FROM danhmuc where id=:id";
		map.put("id", id);
		return jdbcTemplate.queryForObject(SQL, map, new DanhMucMapper());
	}

	@Override
	public void update(int id, danhmuc dm) {
		// TODO Auto-generated method stub
		String SQL = "UPDATE danhmuc SET name=:ten WHERE id=:id";
		Map<String, Object> map = new HashMap<>();
		map.put("ten", dm.getName());
		map.put("id", id);
		jdbcTemplate.update(SQL, map);
	}

	@Override
	public void saveOrUpdate(danhmuc dm) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		if (dm.getId() > 0) {
			// update
			String sql = "UPDATE danhmuc SET name=:name where id=:id";
			map.put("name", dm.getName());
			jdbcTemplate.update(sql, map);
		} else {
			// insert
			String sql = "INSERT INTO danhmuc(name) values(:name)";
			map.put("name", dm.getName());
			jdbcTemplate.update(sql, map);
		}
	}

}
