package com.g2.entity.game;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.g2.entity.IdEntity;

@Entity
@Table(name="g2_seal")
public class FunctionSeal extends IdEntity {
	
	private String serverName;
	
	private String userId;
	
	private String userName;
	
	private String sealDayCount;

	private String sealStart;
	
	private String sealEnd;
	
	private String causes;
	

	public String getServerName() {
		return serverName;
	}

	public void setServerName(String serverName) {
		this.serverName = serverName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getSealStart() {
		return sealStart;
	}

	public void setSealStart(String sealStart) {
		this.sealStart = sealStart;
	}

	public String getSealEnd() {
		return sealEnd;
	}

	public void setSealEnd(String sealEnd) {
		this.sealEnd = sealEnd;
	}

	public String getCauses() {
		return causes;
	}

	public void setCauses(String causes) {
		this.causes = causes;
	}

	public String getSealDayCount() {
		return sealDayCount;
	}

	public void setSealDayCount(String sealDayCount) {
		this.sealDayCount = sealDayCount;
	}
	
	
}