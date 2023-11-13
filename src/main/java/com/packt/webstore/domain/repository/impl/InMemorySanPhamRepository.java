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
import com.packt.webstore.domain.repository.sanPhamRepository;

/**
 *
 */
@Repository
public class InMemorySanPhamRepository implements sanPhamRepository {
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
	public void add(sanpham sp) {
		// TODO Auto-generated method stub
		String SQL = "INSERT INTO sanpham (name, price,soluong,img,mota,iddm) "
				+ "VALUES (:name,:price,:soluong,:img,:mota,:iddm)";
		Map<String, Object> map = new HashMap<>();
		map.put("name", sp.getName());
		map.put("price", sp.getPrice());
		map.put("soluong", sp.getSoluong());
		map.put("img", sp.getImg());
		map.put("mota", sp.getMota());
		map.put("iddm", sp.getIddm());
		jdbcTemplate.update(SQL, map);

	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		String SQL = "DELETE FROM sanpham where id=:id";
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		jdbcTemplate.update(SQL, map);
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
		String SQL = "UPDATE sanpham SET name:name, price:price,soluong:soluong,img:img,mota:mota,iddm:iddm WHERE id=:id";
		map.put("name", sp.getName());
		map.put("price", sp.getPrice());
		map.put("soluong", sp.getSoluong());
		map.put("img", sp.getImg());
		map.put("mota", sp.getMota());
		map.put("iddm", sp.getIddm());
		map.put("id", id);
		jdbcTemplate.update(SQL, map);
	}

	@Override
	public void updateSL(int id, sanpham sp) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		String SQL = "UPDATE sanpham SET soluong:soluong WHERE id=:id";
		map.put("soluong", sp.getSoluong());
		map.put("id", id);
		jdbcTemplate.update(SQL, map);
	}

	@Override
	public void saveOrUpdate(sanpham sp) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		if (sp.getId() > 0) {
			// update
			String sql = "UPDATE sanpham SET name:name, price:price,soluong:soluong,img:img,mota:mota,iddm:iddm WHERE id=:id";
			map.put("name", sp.getName());
			map.put("price", sp.getPrice());
			map.put("soluong", sp.getSoluong());
			map.put("img", sp.getImg());
			map.put("mota", sp.getMota());
			map.put("iddm", sp.getIddm());
			jdbcTemplate.update(sql, map);
		} else {
			// insert
			String sql = "INSERT INTO sanpham (name, price,soluong,img,mota,iddm)VALUES (:name,:price,:soluong,:img,:mota,:iddm)";
			map.put("name", sp.getName());
			map.put("price", sp.getPrice());
			map.put("soluong", sp.getSoluong());
			map.put("img", sp.getImg());
			map.put("mota", sp.getMota());
			map.put("iddm", sp.getIddm());
			jdbcTemplate.update(sql, map);
		}
	}
}
