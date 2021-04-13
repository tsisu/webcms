package edu.etime.txmcms.dao;

import java.util.ArrayList;
import java.util.List;

import edu.etime.txmcms.common.DbHelper;
import edu.etime.txmcms.pojo.ArtType;

public class ArtTypeDaoImpl implements ArtTypeDao {
	@Override
	public int add(ArtType type) {
		String sql = "insert into arttype(typeid,typename,typedesc,typesort,typestate)" + "value(?,?,?,?,?)";
		Integer rtn = DbHelper.executeUpdate(sql, type.getTypeid(), type.getTypename(), type.getTypedesc(),
				type.getTypesort(), type.getTypestate());
		return rtn;
	}

	public List<ArtType> selectArtType(ArtType type) {
		String sql = "select typeid,typename,typedesc,typesort,typestate from arttype where 0=0";
		List<Object> params = new ArrayList<>();
		if (type.getTypestate() != null && type.getTypestate() != -1) {
			sql += " and typestate=?";
			params.add(type.getTypestate());
		}
		if (type != null && type.getTypename() != null && !type.getTypename().equals("")) {
			sql += " and typename like ?";
			params.add("%" + type.getTypename() + "%");
		}
		sql += " order by typesort asc";
		if (params.size() > 0) {
			return DbHelper.executeQuery(sql, ArtType.class, params.toArray());
		} else {
			return DbHelper.executeQuery(sql, ArtType.class);
		}
	}

	@Override
	public ArtType toedit(ArtType type) {
		String sql = "select typeid,typename,typedesc,typestate,typesort from arttype where typeid=?";
		List<ArtType> list = DbHelper.executeQuery(sql, ArtType.class, type.getTypeid());
		if (list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	public ArtType selectArtTypeById(String id) {
		String sql = "select typeid,typename,typedesc,typesort,typestate from arttype where typeid=?";
		List<ArtType> list = DbHelper.executeQuery(sql, ArtType.class, id);
		if (list != null && list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	public int updateArtType(ArtType type) {
		String sql = "update arttype set typename=?,typedesc=?,typesort=?,typestate=? where typeid=?";
		return DbHelper.executeUpdate(sql, type.getTypename(), type.getTypedesc(), type.getTypesort(),
				type.getTypestate(), type.getTypeid());
	}
}
