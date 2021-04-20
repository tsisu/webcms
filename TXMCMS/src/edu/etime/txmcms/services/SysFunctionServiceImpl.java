package edu.etime.txmcms.services;

import java.util.List;
import edu.etime.txmcms.dao.SysFunctionDaoImpl;
import edu.etime.txmcms.pojo.SysFunction;

public class SysFunctionServiceImpl implements SysFunctionService {
	private SysFunctionDaoImpl dao = new SysFunctionDaoImpl();

	@Override
	public List<SysFunction> selectSysFunction(SysFunction fun) {
		// TODO Auto-generated method stub
		return dao.selectSysFunction(fun);
	}

	@Override
	public int insertSysFunction(SysFunction fun) {
		// TODO Auto-generated method stub
		return dao.insertSysFunction(fun);
	}

	@Override
	public int updateSysFunction(SysFunction fun) {
		// TODO Auto-generated method stub
		return dao.updateSysFunction(fun);
	}
	
}
