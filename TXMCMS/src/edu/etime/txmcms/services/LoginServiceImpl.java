package edu.etime.txmcms.services;

import java.util.List;

import edu.etime.txmcms.dao.LoginDao;
import edu.etime.txmcms.dto.SysRightDto;
import edu.etime.txmcms.pojo.SysFunction;
import edu.etime.txmcms.pojo.SysUser;

public class LoginServiceImpl implements LoginService {

	private LoginDao dao = new LoginDao();
	
	@Override
	public SysUser Login(SysUser user) {
		// TODO Auto-generated method stub
		return dao.login(user);
	}

	@Override
	public List<SysFunction> selectFunByRoleId(String roleid) {
		return dao.selectFunByRoleid(roleid);
	}
	@Override
	public List<SysRightDto> selectRightList() {
		return dao.selectRightList();
	}
}
