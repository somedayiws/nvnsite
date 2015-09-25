package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.BAIVIET;

public class ListPostsDAO {
	DataBaseDAO db = new DataBaseDAO();
	ListCategoryDAO category = new ListCategoryDAO();
	ListAccountDAO account = new ListAccountDAO();
	ListCommentDAO comment = new ListCommentDAO();

	/** Get Data Post */

	public ArrayList<BAIVIET> getDataPosts(int page) {

		/** Count number records */
//		int numberOfPosts = 0;
//		String sql_count_posts = "SELECT COUNT(*) AS COUNTPOSTS FROM baiviet WHERE CoXoa = 0";
//		ResultSet result_count = db.getResultSet(sql_count_posts);
//		try {
//			while (result_count.next()) {
//				numberOfPosts = result_count.getInt("COUNTPOSTS");
//			}
//			System.out.println("number: "+numberOfPosts);
//			if (numberOfPosts == 0)
//				return null;
//			
//			if (numberOfPosts > db.getNBangGhi() && page != -1)
//				numberOfPosts = db.getNBangGhi();
//
//			BAIVIET[] posts = new BAIVIET[numberOfPosts];
		
		ArrayList<BAIVIET> posts = new ArrayList<BAIVIET>();
			
			String sql_select_posts = "SELECT * FROM baiviet WHERE CoXoa = 0 ORDER BY NgayDang DESC";
			
			db.createMenu("ListPostsServlet?", page, sql_select_posts);
			
			ResultSet result_select = null;
			if (page != -1) {
				result_select = db.getResultSet(sql_select_posts + " limit "
						+ (page - 1) * db.getNBangGhi() + ","
						+ db.getNBangGhi());
			System.out.println("sql: "+sql_select_posts + " limit "
						+ (page - 1) * db.getNBangGhi() + ","
						+ db.getNBangGhi());
			} else {
				result_select = db.getResultSet(sql_select_posts);
			}
			//ResultSet result_select = db.getResultSet(sql_select_posts);

			String IdPosts,IdCategory,IdAccount;
			int i = 0;
			
			try {
				while (result_select.next()) {
					BAIVIET post = new BAIVIET();	
					IdPosts = result_select.getString("IdBaiViet");
					post.setIdBaiViet(IdPosts);
					post.setTenBaiVietVi(DinhDangSQL.DeFomatSQL(result_select
							.getString("TenBaiVietVi")));
					post.setTenBaiVietJa(DinhDangSQL.DeFomatSQL(result_select
							.getString("TenBaiVietJa")));
					
					IdCategory = result_select.getString("IdDanhMuc");				
					post.setDanhMuc(category.getCategorybyId(IdCategory));
					
					IdAccount = result_select.getString("IdTaiKhoan");				
					post.setTaiKhoan(account.getAccountbyId(IdAccount));
					
					post.setNoiDungVi(DinhDangSQL.DeFomatSQL(result_select.getString("NoiDungVi")));
					post.setNoiDungJa(DinhDangSQL.DeFomatSQL(result_select.getString("NoiDungJa")));
					post.setTrangThai(DinhDangSQL.DeFomatSQL(result_select.getString("TrangThai")));
					post.setGhiChu(DinhDangSQL.DeFomatSQL(result_select.getString("GhiChu")));
					post.setMoTaVi(DinhDangSQL.DeFomatSQL(result_select.getString("MotaVi")));
					post.setMoTaJa(DinhDangSQL.DeFomatSQL(result_select.getString("MotaJa")));
					
					post.setLuotXem(result_select.getInt("LuotXem"));
					post.setLienKet(DinhDangSQL.DeFomatSQL(result_select.getString("Lienket")));
					post.setNgayDang(DinhDangSQL.DeFomatSQL(result_select.getString("NgayDang")));
					post.setBinhLuanVi(comment.getCommentViById(IdPosts));
					post.setBinhLuanJa(comment.getCommentJaById(IdPosts));	
					post.setGimTrangChu(result_select.getInt("GimTrangChu"));
					posts.add(post);
				}
				
				System.out.println("size_post: "+posts.size());
				return posts;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}			
		
		

	}
	
	public String getMenuPhanTrang(){
		return db.getMenuPhanTrang();
	}
	
	public void setMenu(int nBangghi, int ntrang){
		db.setMenu(nBangghi, ntrang);
	}
	
	public BAIVIET getPostById(String idPost){
		String sql_getPostById = "SELECT TenBaiVietVi,TenBaiVietJa,IdDanhMuc,IdTaiKhoan,NoiDungVi,NoiDungJa,TrangThai,GhiChu,MotaVi,MotaJa,LuotXem,Lienket,NgayDang,GimTrangChu FROM baiviet WHERE IdBaiViet = '"+idPost+"' AND CoXoa = 0 ";
		ResultSet result_getPostById = db.getResultSet(sql_getPostById);
		String IdCategory,IdAccount;
		BAIVIET post = new BAIVIET();
		try {
			while(result_getPostById.next()){
				post.setIdBaiViet(idPost);
				post.setTenBaiVietVi(DinhDangSQL.DeFomatSQL(result_getPostById
						.getString("TenBaiVietVi")));
				post.setTenBaiVietJa(DinhDangSQL.DeFomatSQL(result_getPostById
						.getString("TenBaiVietJa")));
				
				IdCategory = result_getPostById.getString("IdDanhMuc");				
				post.setDanhMuc(category.getCategorybyId(IdCategory));
				
				IdAccount = result_getPostById.getString("IdTaiKhoan");				
				post.setTaiKhoan(account.getAccountbyId(IdAccount));
				
				post.setNoiDungVi(DinhDangSQL.DeFomatSQL(result_getPostById.getString("NoiDungVi")));
				post.setNoiDungJa(DinhDangSQL.DeFomatSQL(result_getPostById.getString("NoiDungJa")));
				post.setTrangThai(DinhDangSQL.DeFomatSQL(result_getPostById.getString("TrangThai")));
				post.setGhiChu(DinhDangSQL.DeFomatSQL(result_getPostById.getString("GhiChu")));
				post.setMoTaVi(DinhDangSQL.DeFomatSQL(result_getPostById.getString("MotaVi")));
				post.setMoTaJa(DinhDangSQL.DeFomatSQL(result_getPostById.getString("MotaJa")));
				
				post.setLuotXem(result_getPostById.getInt("LuotXem"));
				post.setLienKet(DinhDangSQL.DeFomatSQL(result_getPostById.getString("Lienket")));
				post.setNgayDang(DinhDangSQL.DeFomatSQL(result_getPostById.getString("NgayDang")));
				post.setBinhLuanVi(comment.getCommentViById(idPost));
				post.setBinhLuanJa(comment.getCommentJaById(idPost));	
				post.setGimTrangChu(result_getPostById.getInt("GimTrangChu"));
			}
			return post;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
