package com.g2.entity.game;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.g2.entity.IdEntity;

@Entity
@Table(name="g2_gift")
public class FunctionGiftCode extends IdEntity {
	
	private long giftId;
	
	private String giftBuildNum;
	
	private String giftUseNum;
	
	private String startDate;
	
	private String endDate;
	
	private String itemId;
	
	private String itemNum;
	
	private String notes;
	

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public long getGiftId() {
		return giftId;
	}

	public void setGiftId(long giftId) {
		this.giftId = giftId;
	}

	public String getGiftBuildNum() {
		return giftBuildNum;
	}

	public void setGiftBuildNum(String giftBuildNum) {
		this.giftBuildNum = giftBuildNum;
	}

	public String getGiftUseNum() {
		return giftUseNum;
	}

	public void setGiftUseNum(String giftUseNum) {
		this.giftUseNum = giftUseNum;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getItemNum() {
		return itemNum;
	}

	public void setItemNum(String itemNum) {
		this.itemNum = itemNum;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}
	
}