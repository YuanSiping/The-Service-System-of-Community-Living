package com.pojo;

/**
 * Hobby entity. @author MyEclipse Persistence Tools
 */

public class Hobby implements java.io.Serializable {

	// Fields

	private Integer HId;
	private String HName;

	// Constructors

	/** default constructor */
	public Hobby() {
	}

	/** full constructor */
	public Hobby(String HName) {
		this.HName = HName;
	}

	// Property accessors

	public Integer getHId() {
		return this.HId;
	}

	public void setHId(Integer HId) {
		this.HId = HId;
	}

	public String getHName() {
		return this.HName;
	}

	public void setHName(String HName) {
		this.HName = HName;
	}

}