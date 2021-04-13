package edu.etime.txmcms.services;


import java.util.List;

import edu.etime.txmcms.dto.ArtManageDto;
import edu.etime.txmcms.pojo.ArtManage;

public interface ArtManageService {
	int insertArt(ArtManage art);
	
	List<ArtManageDto> selectArt(ArtManage art);
	
	ArtManage selectArtById(String id);
	int updateArt(ArtManage art);
	public int auditArt(ArtManage art);
}
