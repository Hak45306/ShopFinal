/**
 * 
 */
package com.packt.webstore.domain;

/**
 * 
 */
public class danhmuc {
	private int id;
	private String name;

	public danhmuc(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public danhmuc() {
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

}
