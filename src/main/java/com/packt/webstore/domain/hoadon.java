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
	private int idpro;
	private int iduser;
	private Double dongia;
	private int soluong;
	private int tinhtrang;
	private Date ngaytao;
	private Date ngaythanhtoan;

	public hoadon() {
		super();
	}

	public hoadon(int id, int idpro, int iduser, Double dongia, int soluong, int tinhtrang, Date ngaytao,
			Date ngaythanhtoan) {
		super();
		this.id = id;
		this.idpro = idpro;
		this.iduser = iduser;
		this.dongia = dongia;
		this.soluong = soluong;
		this.tinhtrang = tinhtrang;
		this.ngaytao = ngaytao;
		this.ngaythanhtoan = ngaythanhtoan;
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
	 * @return the idpro
	 */
	public int getIdpro() {
		return idpro;
	}

	/**
	 * @param idpro the idpro to set
	 */
	public void setIdpro(int idpro) {
		this.idpro = idpro;
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
	 * @return the dongia
	 */
	public Double getDongia() {
		return dongia;
	}

	/**
	 * @param dongia the dongia to set
	 */
	public void setDongia(Double dongia) {
		this.dongia = dongia;
	}

	/**
	 * @return the soluong
	 */
	public int getSoluong() {
		return soluong;
	}

	/**
	 * @param soluong the soluong to set
	 */
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

	/**
	 * @return the tinhtrang
	 */
	public int getTinhtrang() {
		return tinhtrang;
	}

	/**
	 * @param tinhtrang the tinhtrang to set
	 */
	public void setTinhtrang(int tinhtrang) {
		this.tinhtrang = tinhtrang;
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

}
