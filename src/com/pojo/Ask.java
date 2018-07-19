package com.pojo;

import java.sql.Timestamp;

/**
 * Ask entity. @author MyEclipse Persistence Tools
 */

public class Ask implements java.io.Serializable {

	// Fields

	private Integer asId;
	private User user;
	private String asText;
	private Timestamp asTime;
	private String RText;

	// Constructors

	/** default constructor */
	public Ask() {
	}

	/** minimal constructor */
	public Ask(User user) {
		this.user = user;
	}

	/** full constructor */
	public Ask(User user, String asText, Timestamp asTime, String RText) {
		this.user = user;
		this.asText = asText;
		this.asTime = asTime;
		this.RText = RText;
	}

	// Property accessors

	public Integer getAsId() {
		return this.asId;
	}

	public void setAsId(Integer asId) {
		this.asId = asId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getAsText() {
		return this.asText;
	}

	public void setAsText(String asText) {
		this.asText = asText;
	}

	public Timestamp getAsTime() {
		return this.asTime;
	}

	public void setAsTime(Timestamp asTime) {
		this.asTime = asTime;
	}

	public String getRText() {
		return this.RText;
	}

	public void setRText(String RText) {
		this.RText = RText;
	}

}