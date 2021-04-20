package edu.etime.txmcms.services;
/**
 * 角色管理service层接口
 *
 */

import java.util.List;

import edu.etime.txmcms.dto.SysRightDto;
import edu.etime.txmcms.pojo.SysRole;

public interface SysRoleService {

	/**
	 * 查询角色列表
	 * @param role
	 * @return
	 */
	List<SysRole> selectSysRole(SysRole role);
	/**
	 * 初始化角色权限分配数据查询
	 * @param roleid
	 * @return
	 */
	List<SysRightDto> selectRightList(String roleid);
	/**
	 * 角色权限分配
	 * @param roleid
	 * @param funids
	 * @return
	 */
	int saveRoleRight(String roleid,String[] funids);
}
