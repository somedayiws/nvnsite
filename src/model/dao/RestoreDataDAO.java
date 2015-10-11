package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.BAIVIET;
import model.bean.DANHMUC;
import model.bean.TAIKHOAN;

public class RestoreDataDAO {
	DataBaseDAO db = new DataBaseDAO();
	
	/**List account deleted*/
	public ArrayList<TAIKHOAN> listAccountDeleted(String screen) {
		
		ArrayList<TAIKHOAN> listAccountDelete = new ArrayList<TAIKHOAN>();
		String sql_select_restore_account;
		if(screen.contains("CTV")) sql_select_restore_account = "select IdTaiKhoan,TenTaiKhoan from taikhoan where CoXoa=1 AND QuyenQuanTri = 'ctv' AND TinhTrang<>'KhoaTK'";
		else sql_select_restore_account = "select IdTaiKhoan,TenTaiKhoan from taikhoan where CoXoa=1 AND TinhTrang<>'KhoaTK'";
		ResultSet result_select_restore_account = db.getResultSet(sql_select_restore_account);
		
		try {
			while(result_select_restore_account.next()){
				TAIKHOAN account = new TAIKHOAN();
				account.setIdTaiKhoan(DinhDangSQL.DeFomatSQL(result_select_restore_account.getString("IdTaiKhoan")));
				account.setTenTaiKhoan(DinhDangSQL.DeFomatSQL(result_select_restore_account.getString("TenTaiKhoan")));
				listAccountDelete.add(account);
			}
			return listAccountDelete;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	
	/**List Categores deleted*/
	public ArrayList<DANHMUC> get_CategoryDeleted(){
		
		ArrayList<DANHMUC> listCategory = new ArrayList<DANHMUC>();
		String sql_select_category_deleted = "select IdDanhMuc,TenDanhMucVi,TenDanhMucJa from danhmuc where CoXoa = 1";
		ResultSet result_select_category_delete = db.getResultSet(sql_select_category_deleted);
		try {
			while(result_select_category_delete.next()){
				DANHMUC category = new DANHMUC();
				category.setIdDanhMuc(result_select_category_delete.getString("IdDanhMuc"));
				category.setTenDanhMucVi(DinhDangSQL.DeFomatSQL(result_select_category_delete.getString("TenDanhMucVi")));
				category.setTenDanhMucJa(DinhDangSQL.DeFomatSQL(result_select_category_delete.getString("TenDanhMucJa")));
				listCategory.add(category);
			}
			return listCategory;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	
	/**List Posts deleted*/
	public ArrayList<BAIVIET> get_PostsDeleted() {
		ArrayList<BAIVIET> listPosts = new ArrayList<BAIVIET>();
		String sql_select_posts_deleted = "select IdBaiViet,TenBaiVietVi,TenBaiVietJa from baiviet where CoXoa = 1";
		ResultSet result_select_posts_delete = db.getResultSet(sql_select_posts_deleted);
		try {
			while(result_select_posts_delete.next()){
				BAIVIET posts = new BAIVIET();
				posts.setIdBaiViet(result_select_posts_delete.getString("IdBaiViet"));
				posts.setTenBaiVietVi(DinhDangSQL.DeFomatSQL(result_select_posts_delete.getString("TenBaiVietVi")));
				posts.setTenBaiVietJa(DinhDangSQL.DeFomatSQL(result_select_posts_delete.getString("TenBaiVietJa")));
				listPosts.add(posts);
			}
			return listPosts;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	/**Restore data*/
	public boolean restore(String nameColumn,String valueId,String nameTable){
		
		nameColumn = DinhDangSQL.FomatSQL(nameColumn);
		valueId = DinhDangSQL.FomatSQL(valueId);
		nameTable = DinhDangSQL.FomatSQL(nameTable);
		String sql_restore = "update "+nameTable+" set CoXoa = 0 where "+nameColumn+" = '"+valueId+"'";
		
		System.out.println("sql: "+sql_restore);
		return db.updateData(sql_restore);
	}

	public void closeConnection() {
		db.closeConnection();
	}
}
