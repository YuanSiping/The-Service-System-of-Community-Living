package com.pojo;

/**
 * Account entity. @author MyEclipse Persistence Tools
 */

public class Account implements java.io.Serializable {

	// Fields

	private Integer acid;
	private String acname;
	private String accompany;

	// Constructors

	/** default constructor */
	public Account() {
	}

	/** minimal constructor */
	public Account(String acname) {
		this.acname = acname;
	}

	/** full constructor */
	public Account(String acname, String accompany) {
		this.acname = acname;
		this.accompany = accompany;
	}

	// Property accessors

	public Integer getAcid() {
		return this.acid;
	}

	public void setAcid(Integer acid) {
		this.acid = acid;
	}

	public String getAcname() {
		return this.acname;
	}

	public void setAcname(String acname) {
		this.acname = acname;
	}

	public String getAccompany() {
		return this.accompany;
	}

	public void setAccompany(String accompany) {
		this.accompany = accompany;
	}

}