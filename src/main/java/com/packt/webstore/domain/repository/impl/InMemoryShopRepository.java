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

import com.packt.webstore.domain.sanpham;
import com.packt.webstore.domain.repository.shopRepository;

/**
 *
 */
@Repository
public class InMemoryShopRepository implements shopRepository {
	@Autowired
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Override
	public List<sanpham> getList() {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<>();
		List<sanpham> result = jdbcTemplate.query("SELECT *FROM sanpham", params, new SanPhamMapper());
		return result;
	}

	private static final class SanPhamMapper implements RowMapper<sanpham> {
		@Override
		public sanpham mapRow(ResultSet rs, int rowNum) throws SQLException {
			sanpham sp = new sanpham();
			sp.setId(rs.getInt("id"));
			sp.setName(rs.getString("name"));
			sp.setPrice(rs.getDouble("price"));
			sp.setSoluong(rs.getInt("soluong"));
			sp.setImg(rs.getString("img"));
			sp.setMota(rs.getString("mota"));
			sp.setIddm(rs.getInt("iddm"));
			return sp;
		}
	}

	@Override
	public sanpham detail(int id) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		String SQL = "SELECT * FROM sanpham where id=:id";
		map.put("id", id);
		return jdbcTemplate.queryForObject(SQL, map, new SanPhamMapper());
	}

	@Override
	public void update(int id, sanpham sp) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		String SQL = "UPDATE sanpham SET soluong:soluong WHERE :id";
		map.put("soluong", sp.getSoluong());
		map.put("id", id);
		jdbcTemplate.update(SQL, map);
	}

	@Override
	public void updateSlLow(int id) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		String SQL = "UPDATE sanpham SET soluong=soluong-1 WHERE id=:id";
		map.put("id", id);
		jdbcTemplate.update(SQL, map);
	}

	@Override
	public void updateSlHigh(int id) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		String SQL = "UPDATE sanpham SET soluong=soluong+1 WHERE id=:id";
		map.put("id", id);
		jdbcTemplate.update(SQL, map);
	}

}
