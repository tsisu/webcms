package edu.etime.txmcms.dao;

import java.util.List;

import edu.etime.txmcms.common.DbHelper;
import edu.etime.txmcms.dto.SysRightDto;
import edu.etime.txmcms.pojo.SysFunction;
import edu.etime.txmcms.pojo.SysUser;

public class LoginDao {
	public SysUser login(SysUser user) {
		String sql = "select userid,roleid,username,userpwd,usertruename,usersex,userstate "
				+ " from sysuser where username=? and userpwd=? and userstate=1 ";
		List<SysUser> list = DbHelper.executeQuery(sql, SysUser.class, 
				user.getUsername(),user.getUserpwd());
		if(list!=null && list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}
	/**
	 * 查询角色所能使用的功能列表
	 * @param roleid 角色id
	 * @return
	 */
	public List<SysFunction> selectFunByRoleid(String roleid){
		String sql = "select a.funid,funname,funurl,funpid,funstate "
				+ " from sysfunction a inner join sysright b on a.funid=b.funid "
				+ " where funstate=1 and b.roleid=?";
		return DbHelper.executeQuery(sql, SysFunction.class, roleid);
	}
	public List<SysRightDto> selectRightList(){
		String sql = "select a.funid,funname,funurl,funpid,funstate,b.roleid "
				+ " from sysfunction a inner join sysright b on a.funid=b.funid "
				+ " where funstate=1";
		return DbHelper.executeQuery(sql, SysRightDto.class);
	}
}