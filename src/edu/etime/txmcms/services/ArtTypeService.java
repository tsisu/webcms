package edu.etime.txmcms.services;

import java.util.List;

import edu.etime.txmcms.pojo.ArtType;

public interface ArtTypeService {
	public int add(ArtType type);
//	public List<ArtType> list(ArtType type);
	public ArtType toedit(ArtType type);
	public int updateArtType(ArtType type);
	public ArtType selectArtTypeById(String type);
	List<ArtType> selectArtType(ArtType type);
}
