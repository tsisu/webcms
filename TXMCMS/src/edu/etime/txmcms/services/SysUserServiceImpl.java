package edu.etime.txmcms.services;

import java.util.List;

import edu.etime.txmcms.dao.SysUserDaoImpl;
import edu.etime.txmcms.dto.SysRightDto;
import edu.etime.txmcms.pojo.SysUser;

public class SysUserServiceImpl implements SysUserService {
	private SysUserDaoImpl dao = new SysUserDaoImpl();

	@Override
	public int insertSysUser(SysUser user) {
		// TODO Auto-generated method stub
		return dao.insertSysUser(user);
	}

	@Override
	public List<SysUser> selectSysUser(SysUser user) {
		// TODO Auto-generated method stub
		return dao.selectSysUser(user);
	}

	@Override
	public List<SysRightDto> selectRightList(String userid) {
		// TODO Auto-generated method stub
		return dao.selectRightList(userid);
	}

	@Override
	public void saveUserRight(String userid, String[] roleids) {
		// TODO Auto-generated method stub
		dao.deleteRgihtByRoleid(userid);
		for(String roleid:roleids){
			dao.insertRight(roleid, roleid);
		}
		return;
	}
}
