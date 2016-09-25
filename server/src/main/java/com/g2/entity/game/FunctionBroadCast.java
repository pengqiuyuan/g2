package com.g2.entity.game;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.g2.entity.IdEntity;

@Entity
public class FunctionBroadCast extends IdEntity {
	
	/**
	 *  text:广播内容文本
	 *	interval:播放间隔（分钟）
	 *	times:播放次数-1表示无限循环
	 */
	
	private String serverName;
	
	private String text;
	
	private String interval;
	
	private String times;

	public String getServerName() {
		return serverName;
	}

	public void setServerName(String serverName) {
		this.serverName = serverName;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getInterval() {
		return interval;
	}

	public void setInterval(String interval) {
		this.interval = interval;
	}

	public String getTimes() {
		return times;
	}

	public void setTimes(String times) {
		this.times = times;
	}
	
	
}