/**
 * 
 */
package com.packt.webstore.domain;

/**
 * 
 */
public class sanpham {

	private int id;
	private String name;
	private Double price;
	private int soluong;
	private String img;
	private String mota;
	private int iddm;

	public sanpham() {
		super();
	}

	public sanpham(int id, String name, Double price, int soluong, String img, String mota, int iddm) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.soluong = soluong;
		this.img = img;
		this.mota = mota;
		this.iddm = iddm;
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
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the price
	 */
	public Double getPrice() {
		return price;
	}

	/**
	 * @param price the price to set
	 */
	public void setPrice(Double price) {
		this.price = price;
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
	 * @return the img
	 */
	public String getImg() {
		return img;
	}

	/**
	 * @param img the img to set
	 */
	public void setImg(String img) {
		this.img = img;
	}

	/**
	 * @return the mota
	 */
	public String getMota() {
		return mota;
	}

	/**
	 * @param mota the mota to set
	 */
	public void setMota(String mota) {
		this.mota = mota;
	}

	/**
	 * @return the iddm
	 */
	public int getIddm() {
		return iddm;
	}

	/**
	 * @param iddm the iddm to set
	 */
	public void setIddm(int iddm) {
		this.iddm = iddm;
	}

}
