package edu.etime.txmcms.dao;

import java.util.List;

import edu.etime.txmcms.dto.SysRightDto;
import edu.etime.txmcms.pojo.SysRole;


public interface SysRoleDao {
	public List<SysRole> selectRoleList(SysRole role);
	public List<SysRightDto> selectRightList(String roleid);
	public int deleteRgihtByRoleid(String roleid);
	public int insertRight(String roleid,String funid);
}
