package com.pojo;

/**
 * Atuser entity. @author MyEclipse Persistence Tools
 */

public class Atuser implements java.io.Serializable {

	// Fields

	private AtuserId id;

	// Constructors

	/** default constructor */
	public Atuser() {
	}

	/** full constructor */
	public Atuser(AtuserId id) {
		this.id = id;
	}

	// Property accessors

	public AtuserId getId() {
		return this.id;
	}

	public void setId(AtuserId id) {
		this.id = id;
	}

}