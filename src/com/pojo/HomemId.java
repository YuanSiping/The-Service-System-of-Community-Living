package com.pojo;

/**
 * HomemId entity. @author MyEclipse Persistence Tools
 */

public class HomemId implements java.io.Serializable {

	// Fields

	private Integer HId;//兴趣组
	private Integer UId;//活动

	// Constructors

	/** default constructor */
	public HomemId() {
	}

	/** full constructor */
	public HomemId(Integer HId, Integer UId) {
		this.HId = HId;
		this.UId = UId;
	}

	// Property accessors

	public Integer getHId() {
		return this.HId;
	}

	public void setHId(Integer HId) {
		this.HId = HId;
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
		if (!(other instanceof HomemId))
			return false;
		HomemId castOther = (HomemId) other;

		return ((this.getHId() == castOther.getHId()) || (this.getHId() != null
				&& castOther.getHId() != null && this.getHId().equals(
				castOther.getHId())))
				&& ((this.getUId() == castOther.getUId()) || (this.getUId() != null
						&& castOther.getUId() != null && this.getUId().equals(
						castOther.getUId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getHId() == null ? 0 : this.getHId().hashCode());
		result = 37 * result
				+ (getUId() == null ? 0 : this.getUId().hashCode());
		return result;
	}

}