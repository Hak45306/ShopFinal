/**
 * 
 */
package com.packt.webstore.domain;

import java.sql.Date;

/**
 * 
 */
public class hoadon {
	private int id;
	private int iduser;
	private int trangthai;
	private Date ngaytao;
	private Date ngaysua;
	private Date ngaythanhtoan;
	private Date ngayship;
	private Date ngaynhan;

	public hoadon() {
		super();
	}

	public hoadon(int id, int iduser, int trangthai, Date ngaytao, Date ngaysua, Date ngaythanhtoan, Date ngayship,
			Date ngaynhan) {
		super();
		this.id = id;
		this.iduser = iduser;
		this.trangthai = trangthai;
		this.ngaytao = ngaytao;
		this.ngaysua = ngaysua;
		this.ngaythanhtoan = ngaythanhtoan;
		this.ngayship = ngayship;
		this.ngaynhan = ngaynhan;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the iduser
	 */
	public int getIduser() {
		return iduser;
	}

	/**
	 * @param iduser the iduser to set
	 */
	public void setIduser(int iduser) {
		this.iduser = iduser;
	}

	/**
	 * @return the trangthai
	 */
	public int getTrangthai() {
		return trangthai;
	}

	/**
	 * @param trangthai the trangthai to set
	 */
	public void setTrangthai(int trangthai) {
		this.trangthai = trangthai;
	}

	/**
	 * @return the ngaytao
	 */
	public Date getNgaytao() {
		return ngaytao;
	}

	/**
	 * @param ngaytao the ngaytao to set
	 */
	public void setNgaytao(Date ngaytao) {
		this.ngaytao = ngaytao;
	}

	/**
	 * @return the ngaysua
	 */
	public Date getNgaysua() {
		return ngaysua;
	}

	/**
	 * @param ngaysua the ngaysua to set
	 */
	public void setNgaysua(Date ngaysua) {
		this.ngaysua = ngaysua;
	}

	/**
	 * @return the ngaythanhtoan
	 */
	public Date getNgaythanhtoan() {
		return ngaythanhtoan;
	}

	/**
	 * @param ngaythanhtoan the ngaythanhtoan to set
	 */
	public void setNgaythanhtoan(Date ngaythanhtoan) {
		this.ngaythanhtoan = ngaythanhtoan;
	}

	/**
	 * @return the ngayship
	 */
	public Date getNgayship() {
		return ngayship;
	}

	/**
	 * @param ngayship the ngayship to set
	 */
	public void setNgayship(Date ngayship) {
		this.ngayship = ngayship;
	}

	/**
	 * @return the ngaynhan
	 */
	public Date getNgaynhan() {
		return ngaynhan;
	}

	/**
	 * @param ngaynhan the ngaynhan to set
	 */
	public void setNgaynhan(Date ngaynhan) {
		this.ngaynhan = ngaynhan;
	}

}
