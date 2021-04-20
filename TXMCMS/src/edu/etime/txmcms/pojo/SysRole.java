package edu.etime.txmcms.pojo;

/**
 * 角色实体类
 *
 */
public class SysRole {
	private String roleid;
	private String rolename;
	private String roledesc;
	private Integer rolestate;
	public String getRoleid() {
		return roleid;
	}
	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getRoledesc() {
		return roledesc;
	}
	public void setRoledesc(String roledesc) {
		this.roledesc = roledesc;
	}
	public Integer getRolestate() {
		return rolestate;
	}
	public void setRolestate(Integer rolestate) {
		this.rolestate = rolestate;
	}
	
}
