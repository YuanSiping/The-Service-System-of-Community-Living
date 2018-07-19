package com.pojo;

/**
 * Hoa entity. @author MyEclipse Persistence Tools
 */

public class Hoa implements java.io.Serializable {

	// Fields

	private HoaId id;

	// Constructors

	/** default constructor */
	public Hoa() {
	}

	/** full constructor */
	public Hoa(HoaId id) {
		this.id = id;
	}

	// Property accessors

	public HoaId getId() {
		return this.id;
	}

	public void setId(HoaId id) {
		this.id = id;
	}

}