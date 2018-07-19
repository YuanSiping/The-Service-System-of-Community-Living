package com.pojo;

/**
 * AtuserId entity. @author MyEclipse Persistence Tools
 */

public class AtuserId implements java.io.Serializable {

	// Fields

	private Integer CId;
	private Integer UId;

	// Constructors

	/** default constructor */
	public AtuserId() {
	}

	/** full constructor */
	public AtuserId(Integer CId, Integer UId) {
		this.CId = CId;
		this.UId = UId;
	}

	// Property accessors

	public Integer getCId() {
		return this.CId;
	}

	public void setCId(Integer CId) {
		this.CId = CId;
	}

	public Integer getUId() {
		return this.UId;
	}

	public void setUId(Integer UId) {
		this.UId = UId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AtuserId))
			return false;
		AtuserId castOther = (AtuserId) other;

		return ((this.getCId() == castOther.getCId()) || (this.getCId() != null
				&& castOther.getCId() != null && this.getCId().equals(
				castOther.getCId())))
				&& ((this.getUId() == castOther.getUId()) || (this.getUId() != null
						&& castOther.getUId() != null && this.getUId().equals(
						castOther.getUId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getCId() == null ? 0 : this.getCId().hashCode());
		result = 37 * result
				+ (getUId() == null ? 0 : this.getUId().hashCode());
		return result;
	}

}