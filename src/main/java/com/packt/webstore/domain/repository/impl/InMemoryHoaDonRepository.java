/**
 * 
 */
package com.packt.webstore.domain.repository.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.packt.webstore.domain.hoadon;
import com.packt.webstore.domain.repository.hoaDonRepository;

/**
 * 
 */
@Repository
public class InMemoryHoaDonRepository implements hoaDonRepository {
	@Autowired
	private NamedParameterJdbcTemplate jdbcTemplate;

	private static final class hoadonMapper implements RowMapper<hoadon> {
		@Override
		public hoadon mapRow(ResultSet rs, int rowNum) throws SQLException {
			hoadon hd = new hoadon();
			hd.setId(rs.getInt("id"));
			hd.setIduser(rs.getInt("iduser"));
			hd.setNgaytao(rs.getDate("ngaytao"));
			hd.setNgaysua(rs.getDate("ngaysua"));
			hd.setNgaythanhtoan(rs.getDate("ngaythanhtoan"));
			hd.setNgayship(rs.getDate("ngayship"));
			hd.setNgaynhan(rs.getDate("ngaynhan"));
			return hd;
		}
	}

	@Override
	public List<hoadon> getList() {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<>();
		List<hoadon> result = jdbcTemplate.query("SELECT *FROM hoadon", params, new hoadonMapper());
		return result;
	}

	@Override
	public List<hoadon> getListUser(int iduser) {
		// TODO Auto-generated method stub
		String SQL = "SELECT * FROM hoadon where :iduser";
		Map<String, Object> map = new HashMap<>();
		map.put("iduser", iduser);
		List<hoadon> result = jdbcTemplate.query(SQL, map, new hoadonMapper());
		return result;
	}

	@Override
	public void add(hoadon hd) {
		// TODO Auto-generated method stub
		String SQL = "INSERT INTO hoadon(iduser,trangthai,ngaytao, tongtien)values(:iduser,:trangthai,:ngaytao, :tongtien)";
		Map<String, Object> map = new HashMap<>();
		map.put("iduser", hd.getIduser());
		map.put("trangthai", hd.getTrangthai());
		map.put("ngaytao", LocalDate.now());
		map.put("tongtien", hd.getTongTien());
		jdbcTemplate.update(SQL, map);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		String sqlupdate = "UPDATE hoadon SET idpro=null,iduser=null where id=:id";
		String sqldelete = "DELETE FROM hoadon where id=:id";
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		jdbcTemplate.update(sqlupdate, map);
		jdbcTemplate.update(sqldelete, map);
	}

	@Override
	public hoadon detail(int id) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		String SQL = "SELECT * FROM hoadon where id=:id";
		map.put("id", id);
		return jdbcTemplate.queryForObject(SQL, map, new hoadonMapper());
	}

	@Override
	public void update(int id, hoadon hd) {
		// TODO Auto-generated method stub
		String SQL = "UPDATE hoadon SET iduser:iduser,trangthai:trangthai,ngaysua:ngaysua where id=:id";
		Map<String, Object> map = new HashMap<>();
		map.put("iduser", hd.getIduser());
		map.put("trangthai", hd.getTrangthai());
		map.put("ngaysua", LocalDate.now());
		map.put("id", id);
		jdbcTemplate.update(SQL, map);
	}

	@Override
	public void saveOrUpdate(hoadon hd) {
		// TODO Auto-generated method stub

	}

	@Override
	public hoadon detailIduser(int iduser) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		String SQL = "SELECT * FROM hoadon where iduser=:iduser";
		map.put("iduser", iduser);
		return jdbcTemplate.queryForObject(SQL, map, new hoadonMapper());
	}

}
