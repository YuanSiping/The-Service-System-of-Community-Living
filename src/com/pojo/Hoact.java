package com.pojo;

import java.sql.Timestamp;
import java.util.Date;

/**
 * Hoact entity. @author MyEclipse Persistence Tools
 */

public class Hoact implements java.io.Serializable {

	// Fields

	private Integer AId;
	private String AName;
	private String AAdress;
	private Timestamp ATime;
	private String AComent;
	private String ASpec;

	// Constructors

	/** default constructor */
	public Hoact() {
	}

	/** minimal constructor */
	public Hoact(String AName) {
		this.AName = AName;
	}

	/** full constructor */
	public Hoact(String AName, String AAdress, Timestamp ATime, String AComent,
			String ASpec) {
		this.AName = AName;
		this.AAdress = AAdress;
		this.ATime = ATime;
		this.AComent = AComent;
		this.ASpec = ASpec;
	}

	// Property accessors

	public Integer getAId() {
		return this.AId;
	}

	public void setAId(Integer AId) {
		this.AId = AId;
	}

	public String getAName() {
		return this.AName;
	}

	public void setAName(String AName) {
		this.AName = AName;
	}

	public String getAAdress() {
		return this.AAdress;
	}

	public void setAAdress(String AAdress) {
		this.AAdress = AAdress;
	}

	public Timestamp getATime() {
		return this.ATime;
	}

	public void setATime(Timestamp ATime) {
		this.ATime = ATime;
	}

	public String getAComent() {
		return this.AComent;
	}

	public void setAComent(String AComent) {
		this.AComent = AComent;
	}

	public String getASpec() {
		return this.ASpec;
	}

	public void setASpec(String ASpec) {
		this.ASpec = ASpec;
	}

}