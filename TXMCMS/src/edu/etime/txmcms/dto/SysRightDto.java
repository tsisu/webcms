package edu.etime.txmcms.dto;

import edu.etime.txmcms.pojo.SysFunction;

/**
 * 角色权限初始化dto层
 *
 */
public class SysRightDto extends SysFunction {

	private String roleid;

	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}
}
