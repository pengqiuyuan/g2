package com.g2.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
/**
 * 操作日志
 * @author pengqiuyuan
 *
 */
@Entity
@Table(name = "g2_log")
public class Log extends BaseEntry{
	
	/**
	 * 有效
	 */
	public static final String STATUS_VALIDE = "1";
	/**
	 * 无效
	 */
	public static final String STATUS_INVALIDE = "0";
	
	/**
	 * 首页查看日志
	 */
	public static final String TYPE_SUMMARY = "1";
	/**
	 * 账号管理日志
	 */
	public static final String TYPE_USER = "2";
	
	
	/**
	 * 礼品码日志
	 */
	public static final String TYPE_FUNCTION_GIFTCODE = "3";
	/**
	 * 公告日志
	 */
	public static final String TYPE_FUNCTION_PLACARD = "4";
	/**
	 * 邮件日志
	 */
	public static final String TYPE_FUNCTION_EMAIL = "5";
	
	/**
	 * 系统广播日志
	 */
	public static final String TYPE_FUNCTION_BROADCAST = "6";
	/**
	 * 黑名单日志
	 */
	public static final String TYPE_FUNCTION_SEAL= "7";
	
	
	/**
	 * 服务器状态日志
	 */
	public static final String TYPE_MONITOR_SERVER = "8";
	/**
	 * 游戏配置日志
	 */
	public static final String TYPE_MONITOR_GAMECONFIG = "9";
	/**
	 * 意见反馈日志
	 */
	public static final String TYPE_MONITOR_ISSUES= "10";
	
	
	/**
	 * 基本指标日志
	 */
	public static final String TYPE_DATA_BASIC = "11";
	/**
	 * 留存日志
	 */
	public static final String TYPE_DATA_RETENTION = "12";
	/**
	 * 等级分布日志
	 */
	public static final String TYPE_DATA_RANK = "13";
	
	/**
	 * 关卡分布日志
	 */
	public static final String TYPE_DATA_LEVEL = "14";
	/**
	 * 付费点日志
	 */
	public static final String TYPE_DATA_PAYPOINT = "15";
	/**
	 * 商城消费日志
	 */
	public static final String TYPE_DATA_MALL = "16";
	
	/**
	 * 内容
	 */
	private String content;
	/**
	 * 创建人
	 */
	private String crUser;
	
	
	private String type;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCrUser() {
		return crUser;
	}
	public void setCrUser(String crUser) {
		this.crUser = crUser;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
	
}
