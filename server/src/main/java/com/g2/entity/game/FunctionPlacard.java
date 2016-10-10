package com.g2.entity.game;


import javax.persistence.Entity;
import javax.persistence.Table;

import com.g2.entity.IdEntity;


@Entity
@Table(name="g2_placard")
public class FunctionPlacard extends IdEntity{
	
	private String title;
	
	private String text;
	
	private String crDate;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getCrDate() {
		return crDate;
	}

	public void setCrDate(String crDate) {
		this.crDate = crDate;
	}

}
