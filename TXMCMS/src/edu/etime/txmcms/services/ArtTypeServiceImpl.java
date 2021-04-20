package edu.etime.txmcms.services;

import java.util.List;

import edu.etime.txmcms.dao.ArtTypeDao;
import edu.etime.txmcms.dao.ArtTypeDaoImpl;
import edu.etime.txmcms.pojo.ArtType;

public class ArtTypeServiceImpl implements ArtTypeService {
	private ArtTypeDao dao = new ArtTypeDaoImpl();
	@Override
	public int add(ArtType type) {
		return dao.add(type);
	}
	@Override
	public ArtType toedit(ArtType type) {
		// TODO Auto-generated method stub
		return dao.toedit(type);
	}
	@Override
	public int updateArtType(ArtType type) {
		// TODO Auto-generated method stub
		return dao.updateArtType(type);
	}
	@Override
	public ArtType selectArtTypeById(String type) {
		// TODO Auto-generated method stub
		return dao.selectArtTypeById(type);
	}
	@Override
	public List<ArtType> selectArtType(ArtType type) {
		// TODO Auto-generated method stub
		return dao.selectArtType(type);
	}	
}
