package com.g2.entity.game;

import javax.persistence.Entity;

import com.g2.entity.IdEntity;

@Entity
public class PayPoint extends IdEntity{
	
	public String buyItem;
	
	public String price;
	
	public String buyCount;
	
	public String amount;

	public String getBuyItem() {
		return buyItem;
	}

	public void setBuyItem(String buyItem) {
		this.buyItem = buyItem;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getBuyCount() {
		return buyCount;
	}

	public void setBuyCount(String buyCount) {
		this.buyCount = buyCount;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}
	
}