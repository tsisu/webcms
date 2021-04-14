package edu.etime.txmcms.services;

import java.util.List;

import edu.etime.txmcms.dao.SysRoleDaoImpl;
import edu.etime.txmcms.dto.SysRightDto;
import edu.etime.txmcms.pojo.SysRole;

/**
 * 角色管理servie层实现类
 */
public class SysRoleServiceImpl implements SysRoleService {

	private SysRoleDaoImpl dao = new SysRoleDaoImpl();
	@Override
	public List<SysRole> selectSysRole(SysRole role) {
		return dao.selectRoleList(role);
	}
	@Override
	public List<SysRightDto> selectRightList(String roleid) {
		return dao.selectRightList(roleid);
	}
	@Override
	public int saveRoleRight(String roleid, String[] funids) {
		dao.deleteRgihtByRoleid(roleid);
		for(String funid:funids){
			dao.insertRight(roleid, funid);
		}
		return 1;
	}

}
