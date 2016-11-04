package com.g2.entity.game;


import javax.persistence.Entity;
import javax.persistence.Table;

import com.g2.entity.IdEntity;

@Entity
@Table(name="g2_gift_key")
public class FunctionGiftKey extends IdEntity {
	
	/**
	 * 礼品码 
	 * 0 未使用（有效的礼品码）
	 */
	public static final String GIFT_0 = "0";

	/**
	 * 礼品码 
	 * 1 已使用（无效的礼品码）
	 */
	public static final String GIFT_1 = "1";

	/**
	 * 礼品码 
	 * 2 已过期（礼品码已过期）
	 */
	public static final String GIFT_2 = "2";
	
	private String giftNum;
	
	private String giftUse;
	
	private String giftKey;
	
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

	public String getGiftUse() {
		return giftUse;
	}

	public void setGiftUse(String giftUse) {
		this.giftUse = giftUse;
	}

	public String getGiftKey() {
		return giftKey;
	}

	public void setGiftKey(String giftKey) {
		this.giftKey = giftKey;
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