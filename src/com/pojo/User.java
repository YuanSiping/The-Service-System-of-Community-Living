package com.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer UId;
	private String UName;
	private String UPassword;
	private String USex;
	private String UBankcard;
	private Integer UBuild;
	private Integer UUnit;
	private Integer UFloor;
	private String UNickname;
	private Set asks = new HashSet(0);

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String UName, String UPassword, String UNickname) {
		this.UName = UName;
		this.UPassword = UPassword;
		this.UNickname = UNickname;
	}

	/** full constructor */
	public User(String UName, String UPassword, String USex, String UBankcard,
			Integer UBuild, Integer UUnit, Integer UFloor, String UNickname,
			Set asks) {
		this.UName = UName;
		this.UPassword = UPassword;
		this.USex = USex;
		this.UBankcard = UBankcard;
		this.UBuild = UBuild;
		this.UUnit = UUnit;
		this.UFloor = UFloor;
		this.UNickname = UNickname;
		this.asks = asks;
	}

	// Property accessors

	public Integer getUId() {
		return this.UId;
	}

	public void setUId(Integer UId) {
		this.UId = UId;
	}

	public String getUName() {
		return this.UName;
	}

	public void setUName(String UName) {
		this.UName = UName;
	}

	public String getUPassword() {
		return this.UPassword;
	}

	public void setUPassword(String UPassword) {
		this.UPassword = UPassword;
	}

	public String getUSex() {
		return this.USex;
	}

	public void setUSex(String USex) {
		this.USex = USex;
	}

	public String getUBankcard() {
		return this.UBankcard;
	}

	public void setUBankcard(String UBankcard) {
		this.UBankcard = UBankcard;
	}

	public Integer getUBuild() {
		return this.UBuild;
	}

	public void setUBuild(Integer UBuild) {
		this.UBuild = UBuild;
	}

	public Integer getUUnit() {
		return this.UUnit;
	}

	public void setUUnit(Integer UUnit) {
		this.UUnit = UUnit;
	}

	public Integer getUFloor() {
		return this.UFloor;
	}

	public void setUFloor(Integer UFloor) {
		this.UFloor = UFloor;
	}

	public String getUNickname() {
		return this.UNickname;
	}

	public void setUNickname(String UNickname) {
		this.UNickname = UNickname;
	}

	public Set getAsks() {
		return this.asks;
	}

	public void setAsks(Set asks) {
		this.asks = asks;
	}

}