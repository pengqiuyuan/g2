package com.g2.entity.game;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.g2.entity.IdEntity;

@Entity
@Table(name="g2_issues")
public class MonitorIssues extends IdEntity {
	
	@Column(name = "issues_time")
	private String time;
	
	private String server;
	
	private String userId;
	
	private String name;
	
	@Column(name = "issues_group")
	private String group;
	
	private String contact;
	
	private String device;
	
	private String text ;

	@Column(name = "issues_time")
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getServer() {
		return server;
	}

	public void setServer(String server) {
		this.server = server;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "issues_group")
	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getDevice() {
		return device;
	}

	public void setDevice(String device) {
		this.device = device;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	
	
}