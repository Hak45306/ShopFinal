/**
 * 
 */
package com.packt.webstore.domain;

/**
 * 
 */
public class giohang {
	private int id;
	private int iduser;
	private int idpro;
	private int soluong;

	public giohang(int id, int iduser, int idpro, int soluong) {
		super();
		this.id = id;
		this.iduser = iduser;
		this.idpro = idpro;
		this.soluong = soluong;
	}

	public giohang() {
		super();
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
