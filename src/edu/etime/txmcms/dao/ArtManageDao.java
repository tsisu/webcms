package edu.etime.txmcms.dao;

import java.util.List;

import edu.etime.txmcms.dto.ArtManageDto;
import edu.etime.txmcms.pojo.ArtManage;

public interface ArtManageDao {
	public int insertArt(ArtManage art);
	public List<ArtManageDto> selectArt(ArtManage art);
	public ArtManage selectArtById(String id);
	public int updateArt(ArtManage art);
	public int auditArt(ArtManage art);
}
