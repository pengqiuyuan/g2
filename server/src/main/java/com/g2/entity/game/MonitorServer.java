package com.g2.entity.game;

import javax.persistence.Entity;

import com.g2.entity.IdEntity;

@Entity
public class MonitorServer extends IdEntity {

	/**
	 * load:服务器负载状态 0正常 1繁忙 2离线
	 */

	public static final String LOAD_NORMAL = "0";

	public static final String LOAD_BUSY = "1";

	public static final String LOAD_OFFLINE = "2";

	private String serverId;

	private String serverName;

	private String load;

	private String onlineUser;

	private String totalUser;

	private String ip;

	public String getServerId() {
		return serverId;
	}

	public void setServerId(String serverId) {
		this.serverId = serverId;
	}

	public String getServerName() {
		return serverName;
	}

	public void setServerName(String serverName) {
		this.serverName = serverName;
	}

	public String getLoad() {
		return load;
	}

	public void setLoad(String load) {
		this.load = load;
	}

	public String getOnlineUser() {
		return onlineUser;
	}

	public void setOnlineUser(String onlineUser) {
		this.onlineUser = onlineUser;
	}

	public String getTotalUser() {
		return totalUser;
	}

	public void setTotalUser(String totalUser) {
		this.totalUser = totalUser;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	
}