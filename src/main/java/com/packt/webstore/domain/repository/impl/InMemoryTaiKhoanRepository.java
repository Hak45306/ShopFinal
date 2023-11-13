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

import com.packt.webstore.domain.taikhoan;
import com.packt.webstore.domain.repository.taiKhoanRepository;

/**
 *
 */
@Repository
public class InMemoryTaiKhoanRepository implements taiKhoanRepository {
	@Autowired
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Override
	public List<taikhoan> list() {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		List<taikhoan> result = jdbcTemplate.query("SELECT *FROM taikhoan", map, new AccountMapper());
		return result;
	}

	private static final class AccountMapper implements RowMapper<taikhoan> {
		@Override
		public taikhoan mapRow(ResultSet rs, int rowNum) throws SQLException {
			taikhoan a = new taikhoan();
			a.setId(rs.getInt("id"));
			a.setUser(rs.getString("user"));
			a.setPass(rs.getString("pass"));
			a.setEmail(rs.getString("email"));
			a.setAddress(rs.getString("address"));
			a.setTel(rs.getString("tel"));
			a.setRole(rs.getString("role"));
			return a;
		}
	}

	@Override
	public taikhoan accountName(String user) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		String sql = "Select * from taikhoan where user=" + ":user" + "";
		map.put("user", user);
		return jdbcTemplate.queryForObject(sql, map, new AccountMapper());
	}

	@Override
	public void register(taikhoan tk) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO taikhoan (user,pass,email,address,tel,role) VALUES (:user,:pass,:email,:address,:tel,'USER')";
		Map<String, Object> map = new HashMap<>();
		map.put("user", tk.getUser());
		map.put("pass", tk.getPass());
		map.put("email", tk.getEmail());
		map.put("address", tk.getAddress());
		map.put("tel", tk.getTel());
		jdbcTemplate.update(sql, map);
	}

	@Override
	public taikhoan detail(int id) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		String SQL = "SELECT * FROM taikhoan where id=:id";
		map.put("id", id);
		return jdbcTemplate.queryForObject(SQL, map, new AccountMapper());
	}

	@Override
	public void update(int id, taikhoan tk) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		String SQL = "UPDATE taikhoan SET user:user, pass:pass,email:email,address:address,tel:tel WHERE id=:id";
		map.put("user", tk.getUser());
		map.put("pass", tk.getPass());
		map.put("email", tk.getEmail());
		map.put("tel", tk.getTel());
		map.put("address", tk.getAddress());
		map.put("id", id);
		jdbcTemplate.update(SQL, map);
	}

	@Override
	public void saveOrUpdate(taikhoan tk) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		if (tk.getId() > 0) {
			// update
			String SQL = "UPDATE taikhoan SET user:user, pass:pass,email:email,address:address,tel:tel WHERE id=:id";
			map.put("user", tk.getUser());
			map.put("pass", tk.getPass());
			map.put("email", tk.getEmail());
			map.put("address", tk.getAddress());
			map.put("tel", tk.getTel());
			jdbcTemplate.update(SQL, map);
		} else {
			// insert
			String sql = "INSERT INTO taikhoan (user,pass,email,address,tel,role) VALUES (:user,:pass,:email,:address,:tel,'USER')";
			map.put("user", tk.getUser());
			map.put("pass", tk.getPass());
			map.put("email", tk.getEmail());
			map.put("address", tk.getAddress());
			map.put("tel", tk.getTel());
			jdbcTemplate.update(sql, map);
		}
	}

}
