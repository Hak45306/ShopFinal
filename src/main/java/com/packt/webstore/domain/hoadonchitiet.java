/**
 * 
 */
package com.packt.webstore.domain;

/**
 * 
 */
public class hoadonchitiet {
	private int idhd;
	private int idpro;
	private double dongia;
	private int soluong;

	public hoadonchitiet() {
		super();
	}

	public hoadonchitiet(int idhd, int idpro, double dongia, int soluong) {
		super();
		this.idhd = idhd;
		this.idpro = idpro;
		this.dongia = dongia;
		this.soluong = soluong;
	}

	/**
	 * @return the idhd
	 */
	public int getIdhd() {
		return idhd;
	}

	/**
	 * @param idhd the idhd to set
	 */
	public void setIdhd(int idhd) {
		this.idhd = idhd;
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
	 * @return the dongia
	 */
	public double getDongia() {
		return dongia;
	}

	/**
	 * @param dongia the dongia to set
	 */
	public void setDongia(double dongia) {
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

}
