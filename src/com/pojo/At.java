package com.pojo;

import java.sql.Timestamp;

/**
 * At entity. @author MyEclipse Persistence Tools
 */

public class At implements java.io.Serializable {

	// Fields

	private Integer CId;
	private Double CNumber;
	private Timestamp CTime;

	// Constructors

	/** default constructor */
	public At() {
	}

	/** minimal constructor */
	public At(Double CNumber) {
		this.CNumber = CNumber;
	}

	/** full constructor */
	public At(Double CNumber, Timestamp CTime) {
		this.CNumber = CNumber;
		this.CTime = CTime;
	}

	// Property accessors

	public Integer getCId() {
		return this.CId;
	}

	public void setCId(Integer CId) {
		this.CId = CId;
	}

	public Double getCNumber() {
		return this.CNumber;
	}

	public void setCNumber(Double CNumber) {
		this.CNumber = CNumber;
	}

	public Timestamp getCTime() {
		return this.CTime;
	}

	public void setCTime(Timestamp CTime) {
		this.CTime = CTime;
	}

}