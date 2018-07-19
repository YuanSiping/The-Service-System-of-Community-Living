package com.pojo;

import java.sql.Timestamp;

/**
 * New entity. @author MyEclipse Persistence Tools
 */

public class New implements java.io.Serializable {

	// Fields

	private Integer NId;
	private String NTitle;
	private String NText;
	private Timestamp NTime;

	// Constructors

	/** default constructor */
	public New() {
	}

	/** full constructor */
	public New(String NTitle, String NText, Timestamp NTime) {
		this.NTitle = NTitle;
		this.NText = NText;
		this.NTime = NTime;
	}

	// Property accessors

	public Integer getNId() {
		return this.NId;
	}

	public void setNId(Integer NId) {
		this.NId = NId;
	}

	public String getNTitle() {
		return this.NTitle;
	}

	public void setNTitle(String NTitle) {
		this.NTitle = NTitle;
	}

	public String getNText() {
		return this.NText;
	}

	public void setNText(String NText) {
		this.NText = NText;
	}

	public Timestamp getNTime() {
		return this.NTime;
	}

	public void setNTime(Timestamp NTime) {
		this.NTime = NTime;
	}

}