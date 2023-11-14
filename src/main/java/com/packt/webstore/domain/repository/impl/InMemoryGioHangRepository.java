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

import com.packt.webstore.domain.giohang;
import com.packt.webstore.domain.repository.gioHangRepository;

/**
 *
 */
@Repository
public class InMemoryGioHangRepository implements gioHangRepository {
	@Autowired
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Override
	public List<giohang> getList() {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<>();
		List<giohang> result = jdbcTemplate.query("SELECT *FROM giohang", params, new giohangMapper());
		return result;
	}

	private static final class giohangMapper implements RowMapper<giohang> {
		@Override
		public giohang mapRow(ResultSet rs, int rowNum) throws SQLException {
			giohang gh = new giohang();
			gh.setId(rs.getInt("id"));
			gh.setIdpro(rs.getInt("idpro"));
			gh.setIduser(rs.getInt("iduser"));
			gh.setSoluong(rs.getInt("soluong"));
			return gh;
		}
	}

	@Override
	public void add(giohang gh) {
		// TODO Auto-generated method stub
		String SQL = "INSERT INTO giohang(iduser,idpro,soluong)values(:iduser,:idpro,:soluong)";
		Map<String, Object> map = new HashMap<>();
		map.put("idpro", gh.getIdpro());
		map.put("iduser", gh.getIduser());
		map.put("soluong", gh.getSoluong());
		jdbcTemplate.update(SQL, map);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		String SQLupdate = "UPDATE giohang SET iduser=null,idpro=null where id=:id";
		String SQLdelete = "DELETE FROM giohang where id=:id";
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		jdbcTemplate.update(SQLupdate, map);
		jdbcTemplate.update(SQLdelete, map);

	}

	@Override
	public giohang detail(int id) {
		// TODO Auto-generated method stub
		String SQL = "SELECT * FROM giohang where id=:id";
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		return jdbcTemplate.queryForObject(SQL, map, new giohangMapper());
	}

	@Override
	public void update(int id, giohang gh) {
		// TODO Auto-generated method stub
		String SQL = "UPDATE giohang SET iduser:iduser,idpro:idpro,soluong:soluong where id=:id";

		Map<String, Object> map = new HashMap<>();
		map.put("idpro", gh.getIdpro());
		map.put("iduser", gh.getIduser());
		map.put("soluong", gh.getSoluong());
		map.put("id", id);
		jdbcTemplate.update(SQL, map);

	}

	@Override
	public List<giohang> getListUser(int iduser) {
		// TODO Auto-generated method stub
		String SQL = "SELECT * FROM giohang where :iduser";
		Map<String, Object> map = new HashMap<>();
		map.put("iduser", iduser);
		List<giohang> result = jdbcTemplate.query(SQL, map, new giohangMapper());
		return result;
	}

	@Override
	public void saveOrUpdate(giohang gh) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		if (gh.getId() > 0) {
			// update
			String sql = "UPDATE giohang SET idpro:idpro,iduser:iduser,soluong:soluong where id=:id";
			map.put("idpro", gh.getIdpro());
			map.put("iduser", gh.getIduser());
			map.put("soluong", gh.getSoluong());
			jdbcTemplate.update(sql, map);
		} else {
			// insert
			String sql = "INSERT INTO giohang(idpro,iduser,soluong) values(:idpro,:iduser,:soluong)";
			map.put("idpro", gh.getIdpro());
			map.put("iduser", gh.getIduser());
			map.put("soluong", gh.getSoluong());
			jdbcTemplate.update(sql, map);
		}
	}

	@Override
	public void updateSlHigh(int id) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		String sql = "UPDATE giohang SET soluong=soluong+1 where :id";
		map.put("id", id);
		jdbcTemplate.update(sql, map);
	}

	@Override
	public giohang detailIdSP(int idsp) {
		// TODO Auto-generated method stub
		String SQL = "SELECT * FROM giohang where idpro=:idpro";
		Map<String, Object> map = new HashMap<>();
		map.put("idpro", idsp);
		return jdbcTemplate.queryForObject(SQL, map, new giohangMapper());
	}
}
