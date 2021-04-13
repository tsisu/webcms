package edu.etime.txmcms.common;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DbHelper {
	private static DataSource dataSource;
	static {
		try {
			dataSource = new ComboPooledDataSource("mysql");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	private static Connection getConn() {
		Connection conn =null;
		try {
			conn = dataSource.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	public static Integer executeUpdate(String sql,Object...objects) {
		Connection conn = getConn();
		QueryRunner qr = new QueryRunner(true);
		Integer rtn = 0;
		try {
			if(objects == null) {
				rtn = qr.update(conn, sql);
			}else {
				rtn = qr.update(conn, sql, objects);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rtn;
	}
	public static Integer executeUpdate(String sql) {
		return executeUpdate(sql, null);
		
	}
	public static <T> List<T> executeQuery(String sql,Class<T> cls,
			Object ...objects){
		Connection conn = getConn();
		List<T> list = null;
		try {
			QueryRunner rq = new QueryRunner();
			if(objects == null) {
				list = rq.query(conn, sql,new BeanListHandler<T>(cls));
			}else {
				list = rq.query(conn, sql, new BeanListHandler<T>(cls), objects);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public static <T> List<T> executeQuery(String sql,Class<T> cls){
		return executeQuery(sql, cls, null);
		
	}
}
