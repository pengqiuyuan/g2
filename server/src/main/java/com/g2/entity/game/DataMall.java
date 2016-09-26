package com.g2.entity.game;

import javax.persistence.Entity;

import com.g2.entity.IdEntity;

@Entity
public class DataMall extends IdEntity{
	
	public String point;
	
	public String price;
	
	public String payTimes;
	
	public String payPersons;
	
	public String currency;

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPayTimes() {
		return payTimes;
	}

	public void setPayTimes(String payTimes) {
		this.payTimes = payTimes;
	}

	public String getPayPersons() {
		return payPersons;
	}

	public void setPayPersons(String payPersons) {
		this.payPersons = payPersons;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}
	
	
	
}