package com.pojo;

/**
 * Homem entity. @author MyEclipse Persistence Tools
 */

public class Homem implements java.io.Serializable {

	// Fields

	private HomemId id;

	// Constructors

	/** default constructor */
	public Homem() {
	}

	/** full constructor */
	public Homem(HomemId id) {
		this.id = id;
	}

	// Property accessors

	public HomemId getId() {
		return this.id;
	}

	public void setId(HomemId id) {
		this.id = id;
	}

}