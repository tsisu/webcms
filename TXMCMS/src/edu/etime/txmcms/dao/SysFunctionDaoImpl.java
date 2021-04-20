package edu.etime.txmcms.dao;

import java.util.List;

import edu.etime.txmcms.common.DbHelper;
import edu.etime.txmcms.pojo.SysFunction;

public class SysFunctionDaoImpl implements SysFunctionDao{
	/**
	 * 查询系统功能
	 * @param fun :主要参数：状态
	 * @return
	 */
	public List<SysFunction> selectSysFunction(SysFunction fun){
		String sql = "select funid,funname,funurl,funpid,funstate "
				+ "from sysfunction where 0=0 ";
		if(fun!=null && fun.getFunstate()!=null && fun.getFunstate()!=-1){
			sql += " and funstate=? ";
			return DbHelper.executeQuery(sql, SysFunction.class, fun.getFunstate());
		}else{
			return DbHelper.executeQuery(sql, SysFunction.class);
		}		
	}
	/**
	 * 增加系统功能
	 * @param fun
	 * @return
	 */
	public int insertSysFunction(SysFunction fun){
		String sql = "insert into sysfunction(funid,funname,funurl,funpid,funstate) "
				+ "values (?,?,?,?,?)";
		return DbHelper.executeUpdate(sql, fun.getFunid(),fun.getFunname(),fun.getFunurl(),
				fun.getFunpid(),fun.getFunstate());
	}
	/**
	 * 修改系统功能
	 * @param fun
	 * @return
	 */
	public int updateSysFunction(SysFunction fun){
		String sql = "update sysfunction set funname=?,funurl=?,funstate=? where funid=?";
		return DbHelper.executeUpdate(sql, fun.getFunname(),fun.getFunurl(),
				fun.getFunstate(),fun.getFunid());
	}
}

