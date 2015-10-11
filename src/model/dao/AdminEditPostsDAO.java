package model.dao;

import model.bean.BAIVIET;

public class AdminEditPostsDAO {

	DataBaseDAO db = new DataBaseDAO();

	/** Update posts in database */
	public boolean updatePost(BAIVIET post, String idCategory, String idAccount) {
		post.setTenBaiVietVi(DinhDangSQL.FomatSQL(post.getTenBaiVietVi()));
		post.setTenBaiVietJa(DinhDangSQL.FomatSQL(post.getTenBaiVietJa()));
		post.setNoiDungVi(DinhDangSQL.FomatSQL(post.getNoiDungVi()));
		post.setNoiDungJa(DinhDangSQL.FomatSQL(post.getNoiDungJa()));
		post.setMoTaJa(DinhDangSQL.FomatSQL(post.getMoTaJa()));
		post.setMoTaVi(DinhDangSQL.FomatSQL(post.getMoTaVi()));
		
		String sql_update_posts = "update baiviet set TenBaiVietVi = N'" + post.getTenBaiVietVi() + "',TenBaiVietJa=N'"
				+ post.getTenBaiVietJa() + "',IdDanhMuc ='" + idCategory + "',IdTaiKhoan = '"
				+ idAccount + "',NoidungVi=N'" + post.getNoiDungVi() + "',NoidungJa=N'"
				+ post.getNoiDungJa() + "',MoTaVi=N'" + post.getMoTaVi() + "',MoTaJa=N'"
				+ post.getMoTaJa() + "' where IdBaiViet = '"
				+ post.getIdBaiViet() + "' and CoXoa = '0'";
		System.out.println(sql_update_posts);
		return db.updateData(sql_update_posts);
	}
	/*
	 * 
	 * Update post in database when admin translated post
	 * 
	 * */
	public boolean updatePost_Translated(BAIVIET post){
		post.setTenBaiVietVi(DinhDangSQL.FomatSQL(post.getTenBaiVietVi()));
		post.setTenBaiVietJa(DinhDangSQL.FomatSQL(post.getTenBaiVietJa()));
		post.setNoiDungVi(DinhDangSQL.FomatSQL(post.getNoiDungVi()));
		post.setNoiDungJa(DinhDangSQL.FomatSQL(post.getNoiDungJa()));
		post.setMoTaJa(DinhDangSQL.FomatSQL(post.getMoTaJa()));
		post.setMoTaVi(DinhDangSQL.FomatSQL(post.getMoTaVi()));
		
		String sql_update_post_translate = "update baiviet set TenBaiVietVi = N'" + post.getTenBaiVietVi() + "',TenBaiVietJa=N'"
				+ post.getTenBaiVietJa() + "',NoidungVi=N'" + post.getNoiDungVi() + "',NoidungJa=N'"
				+ post.getNoiDungJa() + "',MoTaVi=N'" + post.getMoTaVi() + "',MoTaJa=N'"
				+ post.getMoTaJa() + "' where IdBaiViet = '"
				+ post.getIdBaiViet() + "' and CoXoa = '0'";
		System.out.println("sql_update_post_translate: "+sql_update_post_translate);
		return db.updateData(sql_update_post_translate);
	}
	public void closeConnection() {
		db.closeConnection();
	}

}
