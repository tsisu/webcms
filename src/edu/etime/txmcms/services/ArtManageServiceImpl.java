package edu.etime.txmcms.services;

import java.util.List;

import edu.etime.txmcms.dao.ArtManageDao;
import edu.etime.txmcms.dao.ArtManageDaoImpl;
import edu.etime.txmcms.dto.ArtManageDto;
import edu.etime.txmcms.pojo.ArtManage;

public class ArtManageServiceImpl implements ArtManageService {
	private ArtManageDao dao = new ArtManageDaoImpl();

	@Override
	public int insertArt(ArtManage art) {
		// TODO Auto-generated method stub
		return dao.insertArt(art);
	}
	public List<ArtManageDto> selectArt(ArtManage art) {
		return dao.selectArt(art);
	}
	public ArtManage selectArtById(String id) {
		return dao.selectArtById(id);
	}
	@Override
	public int updateArt(ArtManage art) {
		// TODO Auto-generated method stub
		return dao.updateArt(art);
	}
	@Override
	public int auditArt(ArtManage art) {
		return dao.auditArt(art);
	}
}
