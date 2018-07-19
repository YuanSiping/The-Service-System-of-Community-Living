package com.pojo;

/**
 * Atac entity. @author MyEclipse Persistence Tools
 */

public class Atac implements java.io.Serializable {

	// Fields

	private AtacId id;

	// Constructors

	/** default constructor */
	public Atac() {
	}

	/** full constructor */
	public Atac(AtacId id) {
		this.id = id;
	}

	// Property accessors

	public AtacId getId() {
		return this.id;
	}

	public void setId(AtacId id) {
		this.id = id;
	}

}