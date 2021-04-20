package edu.etime.txmcms.services;

import java.util.List;

import edu.etime.txmcms.dto.SysRightDto;
import edu.etime.txmcms.pojo.SysUser;

public interface SysUserService {
	public int insertSysUser(SysUser user);
	List<SysUser> selectSysUser(SysUser user);
	List<SysRightDto> selectRightList(String userid);
	public void saveUserRight(String userid, String[] roleids);
}
