package com.g2.entity.game;

import javax.persistence.Entity;

import com.g2.entity.IdEntity;

@Entity
public class MonitorIssuesReply extends IdEntity {
	
	private String server;
	
	private String userId;
	
	private String title;
	
	private String text;
	
	private String attachmentID;
	
	private String attachmentNum;

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

	public String getAttachmentID() {
		return attachmentID;
	}

	public void setAttachmentID(String attachmentID) {
		this.attachmentID = attachmentID;
	}

	public String getAttachmentNum() {
		return attachmentNum;
	}

	public void setAttachmentNum(String attachmentNum) {
		this.attachmentNum = attachmentNum;
	}
	
}