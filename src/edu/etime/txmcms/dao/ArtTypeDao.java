package edu.etime.txmcms.dao;

import java.util.List;

import edu.etime.txmcms.pojo.ArtType;

public interface ArtTypeDao {
	public int add(ArtType type);
//public List<ArtType> list(ArtType type);
	public ArtType toedit(ArtType type);
	public ArtType selectArtTypeById(String type);
	public int updateArtType(ArtType type);
	public List<ArtType> selectArtType(ArtType type);
}
