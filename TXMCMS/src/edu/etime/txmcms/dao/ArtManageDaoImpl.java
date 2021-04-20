package edu.etime.txmcms.dao;
//文章管理数据逻辑层

import java.util.ArrayList;
import java.util.List;

import edu.etime.txmcms.common.DbHelper;
import edu.etime.txmcms.dto.ArtManageDto;
import edu.etime.txmcms.pojo.ArtManage;

public class ArtManageDaoImpl implements ArtManageDao {
	@Override
	public int insertArt(ArtManage art) {
		String sql = "insert into artmanage(artid,typeid,arttitle,artsummary,artimg,"
				+ "artcontent,artuploadtime,artauthor,artsource,artauditstate,"
				+ "artpublishstate,artuserid,artusername)" + "value(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		return DbHelper.executeUpdate(sql, art.getArtid(), art.getTypeid(), art.getArttitle(), art.getArtsummary(),
				art.getArtimg(), art.getArtcontent(), art.getArtuploadtime(), art.getArtauthor(), art.getArtsource(),
				art.getArtauditstate(), art.getArtpublishstate(), art.getArtuserid(), art.getArtusername());
	}

	public List<ArtManageDto> selectArt(ArtManage art){
		String sql = "select artid,a.typeid, arttitle,artimg,"
				+ "artauditstate,artpublishstate,b.typename,artuploadtime from artmanage a "
				+ " inner join arttype b on a.typeid=b.typeid where 0=0 ";
		List<Object> param = new ArrayList<Object>();
		if(art!=null){
			if(art.getTypeid()!=null && !art.getTypeid().equals("-1")){
				sql += " and a.typeid=? ";
				param.add(art.getTypeid());
			}
			if(art.getArtauditstate()!=null && art.getArtauditstate()!=-1){
				sql += " and artauditstate=? ";
				param.add(art.getArtauditstate());
			}
			if(art.getArtpublishstate()!=null && art.getArtpublishstate()!=-1){
				sql += " and artpublishstate=? ";
				param.add(art.getArtpublishstate());
			}
			if(art.getArttitle()!=null && !art.getArttitle().equals("")){
				sql += " and arttitle like ? ";
				param.add("%"+art.getArttitle()+"%");
			}
		}
		sql += " order by artuploadtime desc ";
		if(param.size()>0){
			return DbHelper.executeQuery(sql, ArtManageDto.class, param.toArray());
		}else{
			return DbHelper.executeQuery(sql, ArtManageDto.class);
		}
	}
	public ArtManage selectArtById(String id) {
		String sql = "select artid,typeid,arttitle,artsummary,artimg,"
				+ "artcontent,artuploadtime,artauthor,artsource,artauditstate,"
				+ "artpublishstate,artuserid,artusername from artmanage where artid=?";
		List<ArtManage> list = DbHelper.executeQuery(sql, ArtManage.class, id);
		if (list != null && list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}
	public int updateArt(ArtManage art) {
		String sql = "update artmanage set arttitle=?,artsummary=?,"
				+ "artimg=?,artcontent=?,artuploadtime=?,artauthor=?,artsource=?,"
				+ "artauditstate=?,artpublishstate=?,artuserid=?,artusername=? "
				+ " where artid=?";
		return DbHelper.executeUpdate(sql,art.getArttitle(), art.getArtsummary(),
				art.getArtimg(), art.getArtcontent(), art.getArtuploadtime(), art.getArtauthor(), art.getArtsource(),
				art.getArtauditstate(), art.getArtpublishstate(), art.getArtuserid(), art.getArtusername(),art.getArtid());
	}
	public int auditArt(ArtManage art){
		String sql = "update artmanage set "
				+ " artauditstate=?,artauditdesc=?,artaudittime=?"
				+ " where artid=?";
		return DbHelper.executeUpdate(sql, art.getArtauditstate(),
				art.getArtauditdesc(),art.getArtaudittime(),art.getArtid());
	}
}
