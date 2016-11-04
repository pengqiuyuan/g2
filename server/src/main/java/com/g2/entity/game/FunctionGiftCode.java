package com.g2.entity.game;


import javax.persistence.Entity;
import javax.persistence.Table;

import com.g2.entity.IdEntity;

@Entity
@Table(name="g2_gift_num")
public class FunctionGiftCode extends IdEntity {
	
	private String giftNum;
	
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

	public String getGiftNum() {
		return giftNum;
	}

	public void setGiftNum(String giftNum) {
		this.giftNum = giftNum;
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