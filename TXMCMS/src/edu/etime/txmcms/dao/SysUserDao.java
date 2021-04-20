package edu.etime.txmcms.dao;

import java.util.List;

import edu.etime.txmcms.dto.SysRightDto;
import edu.etime.txmcms.pojo.SysUser;

public interface SysUserDao {
	public int insertSysUser(SysUser user);
	public List<SysUser> selectSysUser(SysUser user);
	public List<SysRightDto> selectRightList(String userid);
	public int deleteRgihtByUserid(String userid);
}
