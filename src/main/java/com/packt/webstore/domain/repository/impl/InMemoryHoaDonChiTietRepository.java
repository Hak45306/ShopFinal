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

import com.packt.webstore.domain.hoadonchitiet;
import com.packt.webstore.domain.repository.hoaDonChiTietRepository;

/**
 * 
 */
@Repository
public class InMemoryHoaDonChiTietRepository implements hoaDonChiTietRepository {

	@Autowired
	private NamedParameterJdbcTemplate jdbcTemplate;

	private static final class hoadonchitietMapper implements RowMapper<hoadonchitiet> {
		@Override
		public hoadonchitiet mapRow(ResultSet rs, int rowNum) throws SQLException {
			hoadonchitiet hdct = new hoadonchitiet();
			hdct.setIdhd(rs.getInt("idhd"));
			hdct.setIdpro(rs.getInt("idpro"));
			hdct.setDongia(rs.getInt("dongia"));
			hdct.setSoluong(rs.getInt("soluong"));
			return hdct;
		}
	}

	@Override
	public List<hoadonchitiet> getList() {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<>();
		List<hoadonchitiet> result = jdbcTemplate.query("SELECT *FROM hoadonchitiet", params,
				new hoadonchitietMapper());
		return result;
	}

	@Override
	public List<hoadonchitiet> getListHD(int id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM hoadonchitiet where :idhd";
		Map<String, Object> map = new HashMap<>();
		map.put("idhd", id);
		List<hoadonchitiet> result = jdbcTemplate.query(sql, map, new hoadonchitietMapper());
		return result;
	}

	@Override
	public void add(hoadonchitiet hdct) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO hoadonchitiet(idhd,idpro,dongia,soluong) values(:idhd,:idpro,:dongia,:soluong)";
		Map<String, Object> map = new HashMap<>();
		map.put("idhd", hdct.getIdhd());
		map.put("idpro", hdct.getIdpro());
		map.put("dongia", hdct.getDongia());
		map.put("soluong", hdct.getSoluong());
		jdbcTemplate.update(sql, map);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public hoadonchitiet detail(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(int id, hoadonchitiet hdct) {
		// TODO Auto-generated method stub

	}

}
