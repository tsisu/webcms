package edu.etime.txmcms.services;

import java.util.List;

import edu.etime.txmcms.dto.SysRightDto;
import edu.etime.txmcms.pojo.SysFunction;
import edu.etime.txmcms.pojo.SysUser;

public interface LoginService {
	SysUser Login(SysUser user);
	List<SysFunction> selectFunByRoleId(String roleid);
	List<SysRightDto> selectRightList();
}
