package com.pojo;

/**
 * HoaId entity. @author MyEclipse Persistence Tools
 */

public class HoaId implements java.io.Serializable {

	// Fields

	private Integer HId;
	private Integer AId;

	// Constructors

	/** default constructor */
	public HoaId() {
	}

	/** full constructor */
	public HoaId(Integer HId, Integer AId) {
		this.HId = HId;
		this.AId = AId;
	}

	// Property accessors

	public Integer getHId() {
		return this.HId;
	}

	public void setHId(Integer HId) {
		this.HId = HId;
	}

	public Integer getAId() {
		return this.AId;
	}

	public void setAId(Integer AId) {
		this.AId = AId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof HoaId))
			return false;
		HoaId castOther = (HoaId) other;

		return ((this.getHId() == castOther.getHId()) || (this.getHId() != null
				&& castOther.getHId() != null && this.getHId().equals(
				castOther.getHId())))
				&& ((this.getAId() == castOther.getAId()) || (this.getAId() != null
						&& castOther.getAId() != null && this.getAId().equals(
						castOther.getAId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getHId() == null ? 0 : this.getHId().hashCode());
		result = 37 * result
				+ (getAId() == null ? 0 : this.getAId().hashCode());
		return result;
	}

}