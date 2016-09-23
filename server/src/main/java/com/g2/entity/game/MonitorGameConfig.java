package com.g2.entity.game;

import javax.persistence.Entity;

import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.g2.entity.IdEntity;
@Entity
@Table(name="g2_tag")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)   // 二级缓存
public class MonitorGameConfig extends IdEntity {

	private String configKey;

	private String configValue;

	private String nodes;

	public String getConfigKey() {
		return configKey;
	}

	public void setConfigKey(String configKey) {
		this.configKey = configKey;
	}

	public String getConfigValue() {
		return configValue;
	}

	public void setConfigValue(String configValue) {
		this.configValue = configValue;
	}

	public String getNodes() {
		return nodes;
	}

	public void setNodes(String nodes) {
		this.nodes = nodes;
	}

	
}