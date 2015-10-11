package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.bean.BAIVIET;

public class ShowAdminEditPostsDAO {
	DataBaseDAO db = new DataBaseDAO();
	
	/**Check post exist*/
	public boolean checkExist_Post(String idPost){
		String sql_select_idPost = "SELECT IdBaiViet FROM baiviet WHERE IdBaiViet = '"+idPost+"' AND CoXoa = 0 ";
		ResultSet result_select_idPost = db.getResultSet(sql_select_idPost);
		try {
			while(result_select_idPost.next()){
				return true;
			}
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}

	/** Get Posts by IdPost */
	public BAIVIET getPostsById(String idPost) {
		String sql_select_postsByid = "SELECT TenBaiVietVi,TenBaiVietJa,IdDanhMuc,IdTaiKhoan,NoiDungVi,NoiDungJa,TrangThai,GhiChu,MotaVi,MotaJa,LuotXem,Lienket,NgayDang,GimTrangChu from baiviet WHERE IdBaiViet='"
				+ idPost + "' AND CoXoa=0";
		System.out.println("sql_select_postsByid: "+sql_select_postsByid);
		ResultSet result_select_postsByid = db
				.getResultSet(sql_select_postsByid);
	
		ListCategoryDAO listcategory = new ListCategoryDAO();
		ListAccountDAO listAccount = new ListAccountDAO();
		ListCommentDAO comment = new ListCommentDAO();
		BAIVIET post = new BAIVIET();
		try {
			
			while (result_select_postsByid.next()) {
				post.setIdBaiViet(idPost);
				post.setTenBaiVietVi(DinhDangSQL.DeFomatSQL(result_select_postsByid
						.getString("TenBaiVietVi")));
				post.setTenBaiVietJa(DinhDangSQL.DeFomatSQL(result_select_postsByid
						.getString("TenBaiVietJa")));
				post.setDanhMuc(listcategory
						.getCategorybyId(result_select_postsByid
								.getString("IdDanhMuc")));
				post.setTaiKhoan(listAccount
						.getAccountbyId(result_select_postsByid
								.getString("IdTaiKhoan")));
				post.setNoiDungVi(DinhDangSQL.DeFomatSQL(result_select_postsByid
						.getString("NoiDungVi")));
				post.setNoiDungJa(DinhDangSQL.DeFomatSQL(result_select_postsByid
						.getString("NoiDungJa")));
				post.setTrangThai(DinhDangSQL.DeFomatSQL(result_select_postsByid
						.getString("TrangThai")));
				post.setGhiChu(DinhDangSQL.DeFomatSQL(result_select_postsByid.getString("GhiChu")));
				post.setMoTaVi(DinhDangSQL.DeFomatSQL(result_select_postsByid.getString("MoTaVi")));
				post.setMoTaJa(DinhDangSQL.DeFomatSQL(result_select_postsByid.getString("MoTaJa")));
				post.setLuotXem(result_select_postsByid.getInt("LuotXem"));
				post.setLienKet(DinhDangSQL.DeFomatSQL(result_select_postsByid.getString("LienKet")));
				post.setNgayDang(DinhDangSQL.DeFomatSQL(result_select_postsByid.getString("NgayDang")));
				post.setGimTrangChu(result_select_postsByid.getInt("GimTrangChu"));
				post.setBinhLuanVi(comment.getCommentViById(idPost));
				post.setBinhLuanJa(comment.getCommentJaById(idPost));
				
			}
			System.out.println("ID: "+post.getIdBaiViet());
//			System.out.println("id: "+post.getIdBaiViet());
//			System.out.println("id danh muc: "+post.getDanhMuc().getIdDanhMuc());
			return post;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	public void closeConnection() {
		db.closeConnection();
	}
}
