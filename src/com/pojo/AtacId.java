package com.pojo;

/**
 * AtacId entity. @author MyEclipse Persistence Tools
 */

public class AtacId implements java.io.Serializable {

	// Fields

	private Integer CId;
	private Integer acid;

	// Constructors

	/** default constructor */
	public AtacId() {
	}

	/** full constructor */
	public AtacId(Integer CId, Integer acid) {
		this.CId = CId;
		this.acid = acid;
	}

	// Property accessors

	public Integer getCId() {
		return this.CId;
	}

	public void setCId(Integer CId) {
		this.CId = CId;
	}

	public Integer getAcid() {
		return this.acid;
	}

	public void setAcid(Integer acid) {
		this.acid = acid;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AtacId))
			return false;
		AtacId castOther = (AtacId) other;

		return ((this.getCId() == castOther.getCId()) || (this.getCId() != null
				&& castOther.getCId() != null && this.getCId().equals(
				castOther.getCId())))
				&& ((this.getAcid() == castOther.getAcid()) || (this.getAcid() != null
						&& castOther.getAcid() != null && this.getAcid()
						.equals(castOther.getAcid())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getCId() == null ? 0 : this.getCId().hashCode());
		result = 37 * result
				+ (getAcid() == null ? 0 : this.getAcid().hashCode());
		return result;
	}

}