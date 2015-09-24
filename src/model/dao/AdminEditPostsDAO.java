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
		post.setGhiChu(DinhDangSQL.FomatSQL(post.getGhiChu()));
		post.setMoTaJa(DinhDangSQL.FomatSQL(post.getMoTaJa()));
		post.setMoTaVi(DinhDangSQL.FomatSQL(post.getMoTaVi()));
		post.setLienKet(DinhDangSQL.FomatSQL(post.getLienKet()));
		post.setNgayDang(DinhDangSQL.FomatSQL(post.getNgayDang()));
		
		String sql_update_posts = "update baiviet set TenBaiVietVi = N'" + post.getTenBaiVietVi() + "',TenBaiVietJa=N'"
				+ post.getTenBaiVietJa() + "',IdDanhMuc ='" + idCategory + "',IdTaiKhoan = '"
				+ idAccount + "',NoidungVi=N'" + post.getNoiDungVi() + "',NoidungJa=N'"
				+ post.getNoiDungJa() + "',TrangThai=N'" + post.getTrangThai() + "',GhiChu=N'"
				+ post.getGhiChu() + "',MoTaVi=N'" + post.getMoTaVi() + "',MoTaJa=N'"
				+ post.getMoTaJa() + "',LuotXem=N'" + post.getLuotXem() + "',LienKet='"
				+ post.getLienKet() + "',NgayDang='" + post.getNgayDang() + "',GimTrangChu='"+post.getGimTrangChu()+"' where IdBaiViet = '"
				+ post.getIdBaiViet() + "' and CoXoa = '0'";
		return db.updateData(sql_update_posts);
	}

}
