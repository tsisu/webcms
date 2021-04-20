package edu.etime.txmcms.common;

/**
 * ajax反馈简单消息的统一结构
 *
 */
public class Message {

	private Integer code;
	private String msg;
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
}
