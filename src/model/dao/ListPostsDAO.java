package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.BAIVIET;
import model.bean.BINHLUAN;
import model.bean.DANHMUC;
import model.bean.TAIKHOAN;

public class ListPostsDAO {
	MySQLConnector db = new MySQLConnector();
	ListCategoryDAO category = new ListCategoryDAO();
	ListAccountDAO account = new ListAccountDAO();
	ListCommentDAO comment = new ListCommentDAO();

	/** Get Data Post */

	public BAIVIET[] getDataPosts() {

		/** Count number records */
		int numberOfPosts = 0;
		String sql_count_posts = "SELECT COUNT(*) AS COUNTPOSTS FROM baiviet WHERE CoXoa = 0";
		ResultSet result_count = db.getResultSet(sql_count_posts);
		try {
			while (result_count.next()) {
				numberOfPosts = result_count.getInt("COUNTPOSTS");
			}
			if (numberOfPosts == 0)
				return null;
			BAIVIET[] posts = new BAIVIET[numberOfPosts];

			String sql_select_posts = "SELECT * FROM baiviet WHERE CoXoa = 0";
			ResultSet result_select = db.getResultSet(sql_select_posts);

			String IdPosts,IdCategory,IdAccount;
			int i = 0;
			
			while (result_select.next()) {
				posts[i] = new BAIVIET();	
				IdPosts = result_select.getString("IdBaiViet");
				posts[i].setIdBaiViet(IdPosts);
				posts[i].setTenBaiVietVi(DinhDangSQL.DeFomatSQL(result_select
						.getString("TenBaiVietVi")));
				posts[i].setTenBaiVietJa(DinhDangSQL.DeFomatSQL(result_select
						.getString("TenBaiVietJa")));
				
				IdCategory = result_select.getString("IdDanhMuc");				
				posts[i].setDanhMuc(category.getCategorybyId(IdCategory));
				
				IdAccount = result_select.getString("IdTaiKhoan");				
				posts[i].setTaiKhoan(account.getAccountbyId(IdAccount));
				
				posts[i].setNoiDungVi(DinhDangSQL.DeFomatSQL(result_select.getString("NoiDungVi")));
				posts[i].setNoiDungJa(DinhDangSQL.DeFomatSQL(result_select.getString("NoiDungJa")));
				posts[i].setTrangThai(DinhDangSQL.DeFomatSQL(result_select.getString("TrangThai")));
				posts[i].setGhiChu(DinhDangSQL.DeFomatSQL(result_select.getString("GhiChu")));
				posts[i].setMoTaVi(DinhDangSQL.DeFomatSQL(result_select.getString("MotaVi")));
				posts[i].setMoTaJa(DinhDangSQL.DeFomatSQL(result_select.getString("MotaJa")));
				
				posts[i].setLuotXem(result_select.getInt("LuotXem"));
				posts[i].setLienKet(DinhDangSQL.DeFomatSQL(result_select.getString("Lienket")));
				posts[i].setNgayDang(DinhDangSQL.DeFomatSQL(result_select.getString("NgayDang")));
				posts[i].setBinhLuanVi(comment.getCommentViById(IdPosts));
				posts[i].setBinhLuanJa(comment.getCommentJaById(IdPosts));
				i++;
				
			}
			// for(int j = 0;j<IdCategory.length;j++){
			//
			// String sql_select_Category =
			// "SELECT * FROM DANHMUC WHERE IdDanhMuc ='"
			// + IdCategory[j] + "' AND CoXoa = 0";
			// ResultSet result_select_Category = db
			// .getResultSet(sql_select_Category);
			//
			// DANHMUC category = new DANHMUC();
			//
			// while(result_select_Category.next()){
			// category.setIdDanhMuc(IdCategory[j]);
			// category.setTenDanhMucVi(result_select_Category
			// .getString("TenDanhMucVi"));
			// category.setTenDanhMucJa(result_select_Category
			// .getString("TenDanhMucJa"));
			// category.setHienThi(result_select_Category
			// .getInt("HienThi"));
			// }
			//
			// posts[j].setDanhMuc(category);
			// }

			// String idCategory = null, idUser = null, idPost = null;
			// for (int i = 0; i < numberOfPosts; i++) {
			//
			// posts[i] = new BAIVIET();
			// result_select.next();
			//
			// idPost = result_select.getString("IdBaiViet");
			//
			// posts[i].setIdBaiViet(idPost);
			// posts[i].setTenBaiVietVi(result_select
			// .getString("TenBaiVietVi"));
			// posts[i].setTenBaiVietJa(result_select
			// .getString("TenBaiVietJa"));
			//
			// idCategory = result_select.getString("IdDanhMuc");
			// //System.out.println("idCategory:" + idCategory);
			//
			// idUser = result_select.getString("IdTaiKhoan");
			// // System.out.println("idUser:" + idUser);
			//
			// posts[i].setNoiDungVi(result_select.getString("NoiDungVi"));
			// posts[i].setNoiDungJa(result_select.getString("NoiDungJa"));
			// posts[i].setTrangThai(result_select.getString("TrangThai"));
			// posts[i].setGhiChu(result_select.getString("GhiChu"));
			// posts[i].setMotaVi(result_select.getString("MotaVi"));
			// posts[i].setMotaJa(result_select.getString("MotaJa"));
			// posts[i].setCoXoa(result_select.getInt("CoXoa"));
			//
			// /** Get category of posts */
			//
			// String sql_select_Category =
			// "SELECT * FROM DANHMUC WHERE IdDanhMuc ='"
			// + idCategory + "' AND CoXoa = 0";
			// ResultSet result_select_Category = db
			// .getResultSet(sql_select_Category);
			//
			// DANHMUC category = new DANHMUC();
			//
			// result_select_Category.next();
			// category.setIdDanhMuc(idCategory);
			// category.setTenDanhMucVi(result_select_Category
			// .getString("TenDanhMucVi"));
			// category.setTenDanhMucJa(result_select_Category
			// .getString("TenDanhMucJa"));
			// category.setHienThi(result_select_Category
			// .getInt("HienThi"));
			//
			//
			// posts[i].setDanhMuc(category);
			//
			// /** Get user post */
			//
			// String sql_select_User =
			// "SELECT * FROM TAIKHOAN WHERE IdTaiKhoan ='"
			// + idUser + "' AND CoXoa = 0";
			// ResultSet result_select_User = db.getResultSet(sql_select_User);
			//
			// TAIKHOAN account = new TAIKHOAN();
			//
			// result_select_User.next();
			// account.setIdTaiKhoan(idUser);
			// account.setTenTaiKhoan(result_select_User
			// .getString("TenTaiKhoan"));
			// account.setMatKhau(result_select_User.getString("MatKhau"));
			// account.setHoTen(result_select_User.getString("HoTen"));
			// account.setDiaChi(result_select_User.getString("DiaChi"));
			// account.setDienThoai(result_select_User
			// .getString("DienThoai"));
			// account.setEmail(result_select_User.getString("Email"));
			// account.setQuyenQuanTri(result_select_User
			// .getString("QuyenQuanTri"));
			//
			//
			// posts[i].setTaiKhoan(account);

			/** Get comment of Posts */
			// ArrayList<BINHLUAN> comment;
			// ArrayList<BINHLUAN> listcomment = new ArrayList<BINHLUAN>();
			//
			// /* Count number comment of posts */
			// int numberOfComment = 0;
			// String sql_count_comment =
			// "SELECT COUNT(*) COUNTCOMMENT FROM BINHLUAN WHERE IdBaiViet = '"
			// + idPost + "' AND CoXoa = 0";
			// ResultSet result_count_comment = db
			// .getResultSet(sql_count_comment);
			//
			// while (result_count_comment.next()) {
			// numberOfComment = result_count_comment
			// .getInt("COUNTCOMMENT");
			// }
			// if (numberOfComment == 0)
			// listcomment = null;
			// else {
			// // comment = new BINHLUAN[numberOfComment];
			// String[] idUserComment =null;
			// System.out.println("numberOfComment: " + numberOfComment);
			// /* Get comment of posts */
			// String sql_select_comments =
			// "SELECT * FROM BINHLUAN WHERE IdBaiViet = '"
			// + idPost + "' AND CoXoa = 0";
			// ResultSet result_select_comments = db
			// .getResultSet(sql_select_comments);
			//
			//
			//
			// for (int j = 0; j < numberOfComment; j++) {
			// BINHLUAN comment = new BINHLUAN();
			// result_select_comments.next();
			// System.out.println("IdComent: "+result_select_comments.getString("IdComent"));
			//
			// // comment.setIdComent(result_select_comments
			// // .getInt("IdComent"));
			// //
			// // System.out.println("IdComent: "
			// // + comment.getIdComent());
			//
			// System.out.println("IdBaiViet: "
			// + result_select_comments
			// .getString("IdBaiViet"));
			//
			// idUserComment[j] = result_select_comments
			// .getString("IdTaiKhoan");
			// System.out.println("IdTaiKhoan: " + idUserComment);
			//
			// comment.setPhanHoiVi(result_select_comments
			// .getString("PhanHoiVi"));
			// System.out.println("PhanHoiVi: "
			// + comment.getPhanHoiVi());
			//
			// comment.setPhanHoiJa(result_select_comments
			// .getString("PhanHoiJa"));
			// System.out.println("PhanHoiJa: "
			// + comment.getPhanHoiJa());
			//
			// /* Get account comment */
			// TAIKHOAN[] accountComment = new
			// TAIKHOAN[idUserComment.length];
			// for(int k=0;k<idUserComment.length;k++){
			// accountComment[k] = new TAIKHOAN();
			// String sql_select_AccountComment =
			// "SELECT * FROM TAIKHOAN WHERE IdTaiKhoan ='"+idUserComment[k]+"' AND CoXoa = 0";
			// ResultSet result_select_AccountComment =
			// db.getResultSet(sql_select_AccountComment);
			// result_select_AccountComment.next();
			//
			// accountComment[k].setIdTaiKhoan(idUserComment[k]);
			// System.out.println("IdTaiKhoan: "+accountComment[k].getIdTaiKhoan());
			// accountComment[k].setTenTaiKhoan(result_select_AccountComment.getString("TenTaiKhoan"));
			// System.out.println("TenTaiKhoan: "+accountComment[k].getTenTaiKhoan());
			// accountComment[k].setMatKhau(result_select_AccountComment.getString("MatKhau"));
			// accountComment[k].setHoTen(result_select_AccountComment.getString("HoTen"));
			// accountComment[k].setDiaChi(result_select_AccountComment.getString("DiaChi"));
			// accountComment[k].setDienThoai(result_select_AccountComment.getString("DienThoai"));
			// accountComment[k].setEmail(result_select_AccountComment.getString("Email"));
			// accountComment[k].setQuyenQuanTri(result_select_AccountComment.getString("QuyenQuanTri"));
			// }
			// System.out.println("HoTen: "+accountComment[2].getHoTen());
			// //comment.setTaiKhoan(accountComment[k]);
			// //listcomment.add(comment);
			// }
			//
			//
			//
			// }
			//
			// posts[i].setBinhLuans(listcomment);

			// }
			//
			return posts;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}
}
