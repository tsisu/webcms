package edu.etime.txmcms.dao;

import java.util.List;

import edu.etime.txmcms.pojo.SysFunction;

public interface SysFunctionDao {
	public List<SysFunction> selectSysFunction(SysFunction fun);
	public int insertSysFunction(SysFunction fun);
	public int updateSysFunction(SysFunction fun);
}
