package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.bean.BAIVIET;

public class AdminCreatePostsDAO {
	DataBaseDAO db = new DataBaseDAO();

	
	/**Get  id posts last*/
	public String getIdpostslast(){
		String id_posts_last = null;
		String sql_select_id_posts = "SELECT * FROM baiviet WHERE CoXoa = 0";
		ResultSet resultset_id_posts = db.getResultSet(sql_select_id_posts);
		try {
			resultset_id_posts.last();
			id_posts_last = resultset_id_posts.getString("IdBaiViet");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id_posts_last;
	}
	/** Insert data into database */
	public boolean insertPosts(BAIVIET posts, String idCategory,
			String idAccount) {
		posts.setTenBaiVietVi(DinhDangSQL.FomatSQL(posts.getTenBaiVietVi()));
		posts.setTenBaiVietJa(DinhDangSQL.FomatSQL(posts.getTenBaiVietJa()));
		posts.setNoiDungVi(DinhDangSQL.FomatSQL(posts.getNoiDungVi()));
		posts.setNoiDungJa(DinhDangSQL.FomatSQL(posts.getNoiDungJa()));
		posts.setGhiChu(DinhDangSQL.FomatSQL(posts.getGhiChu()));
		posts.setMoTaJa(DinhDangSQL.FomatSQL(posts.getMoTaJa()));
		posts.setMoTaVi(DinhDangSQL.FomatSQL(posts.getMoTaVi()));
		posts.setLienKet(DinhDangSQL.FomatSQL(posts.getLienKet()));
		posts.setNgayDang(DinhDangSQL.FomatSQL(posts.getNgayDang()));
		
		String sql_insert_Posts = "insert into baiviet values('"
				+ posts.getIdBaiViet() + "',N'" + posts.getTenBaiVietVi()
				+ "',N'" + posts.getTenBaiVietJa() + "','" + idCategory + "','"
				+ idAccount + "',N'" + posts.getNoiDungVi() + "',N'"
				+ posts.getNoiDungJa() + "',N'" + posts.getTrangThai() + "',N'"
				+ posts.getGhiChu() + "',N'" + posts.getMoTaVi() + "',N'"
				+ posts.getMoTaJa() + "','0')";
		return db.updateData(sql_insert_Posts);
	}
	public void closeConnection() {
		db.closeConnection();
	}
}
