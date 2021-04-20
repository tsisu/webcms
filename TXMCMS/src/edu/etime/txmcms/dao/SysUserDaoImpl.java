package edu.etime.txmcms.dao;

import java.util.List;
import java.util.UUID;

import edu.etime.txmcms.common.DbHelper;
import edu.etime.txmcms.dto.SysRightDto;
import edu.etime.txmcms.pojo.SysUser;

public class SysUserDaoImpl implements SysUserDao{
	public int insertSysUser(SysUser user){
	String sql = "insert into user(userid, roleid,username,userpwd,"
			+ "usertruename,usersex,userstate) values(?,?,?,?,?,?,?);";
	return DbHelper.executeUpdate(sql, user.getUserid(),user.getRoleid(),user.getUsername(),
			user.getUserpwd(),user.getUsertruename(),user.getUsersex(),user.getUserstate());
	}
	public List<SysUser> selectSysUser(SysUser user){
		String sql = "select userid, roleid,username,userpwd,"
				+ "usertruename,usersex,userstate from sysuser where 0=0 ";
		if(user!=null && user.getUserstate()!=null && user.getUserstate()!=-1){
			sql+=" and userstate=? ";
			return DbHelper.executeQuery(sql, SysUser.class, user.getUserstate());
		}else{
			return DbHelper.executeQuery(sql, SysUser.class);
		}
	}
	@Override
	public List<SysRightDto> selectRightList(String userid) {
		// TODO Auto-generated method stub
		String sql = "select a.funid,funname,funpid,b.userid from sysfunction a "
				+ " left outer join sysright b on a.funid=b.funid "
				+ " and b.roleid=? "
				+ " where a.funstate=1";
		return DbHelper.executeQuery(sql, SysRightDto.class, userid);
	}
	public int deleteRgihtByUserid(String userid){
		String sql = "delete from sysright where userid=?";
		return DbHelper.executeUpdate(sql, userid);
	}
	public int insertRight(String userid,String funid){
		String sql = "insert into sysright(rightid,userid,funid) values(?,?,?)";
		return DbHelper.executeUpdate(sql, UUID.randomUUID().toString(),userid,funid);
	}
	public int deleteRgihtByRoleid(String userid) {
		// TODO Auto-generated method stub
		String sql = "delete from sysright where userid=?";
		return DbHelper.executeUpdate(sql,userid);
	}
}
