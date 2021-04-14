package edu.etime.txmcms.services;

import java.util.List;

import edu.etime.txmcms.pojo.SysFunction;

public interface SysFunctionService {

	/**
	 * 查询系统功能列表
	 * @param fun
	 * @return
	 */
	List<SysFunction> selectSysFunction(SysFunction fun);
	/**
	 * 增加系统功能
	 * @param fun
	 * @return
	 */
	int insertSysFunction(SysFunction fun);
	/**
	 * 修改系统功能
	 * @param fun
	 * @return
	 */
	int updateSysFunction(SysFunction fun);
}
