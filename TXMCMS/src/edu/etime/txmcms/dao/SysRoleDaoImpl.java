package edu.etime.txmcms.dao;

import java.util.List;
import java.util.UUID;

import edu.etime.txmcms.common.DbHelper;
import edu.etime.txmcms.dto.SysRightDto;
import edu.etime.txmcms.pojo.SysRole;

public class SysRoleDaoImpl implements SysRoleDao {
	/**
	 * 查询角色列表
	 * @return
	 */
	public List<SysRole> selectRoleList(SysRole role){
		String sql = "select roleid,rolename,roledesc,rolestate from sysrole where 0=0 ";
		if(role!=null && role.getRolestate()!=null && role.getRolestate()!=-1){
			sql+=" and rolestate=? ";
			return DbHelper.executeQuery(sql, SysRole.class, role.getRolestate());
		}else{
			return DbHelper.executeQuery(sql, SysRole.class);
		}
	}
	/**
	 * 初始化角色权限分配的数据查询
	 * @param roleid
	 * @return
	 */
	public List<SysRightDto> selectRightList(String roleid){
		String sql = "select a.funid,funname,funpid,b.roleid from sysfunction a "
				+ " left outer join sysright b on a.funid=b.funid "
				+ " and b.roleid=? "
				+ " where a.funstate=1";
		return DbHelper.executeQuery(sql, SysRightDto.class, roleid);
	}
	/**
	 * 根据roleid将其现有权限删除
	 * @param roleid
	 * @return
	 */
	public int deleteRgihtByRoleid(String roleid){
		String sql = "delete from sysright where roleid=?";
		return DbHelper.executeUpdate(sql, roleid);
	}
	/**
	 * 增加角色权限（1条）
	 * @param roleid
	 * @param funid
	 * @return
	 */
	public int insertRight(String roleid,String funid){
		String sql = "insert into sysright(rightid,roleid,funid) values(?,?,?)";
		return DbHelper.executeUpdate(sql, UUID.randomUUID().toString(),roleid,funid);
	}
}


