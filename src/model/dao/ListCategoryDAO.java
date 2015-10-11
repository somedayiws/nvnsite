package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.DANHMUC;

public class ListCategoryDAO {
	DataBaseDAO db = new DataBaseDAO();

	/** Get data Category */
	public ArrayList<DANHMUC> getCategory(int page) {
			ArrayList<DANHMUC> listCategory = new ArrayList<DANHMUC>();
			/* Get category */
			String sql_select_category = "SELECT * FROM danhmuc WHERE CoXoa = 0 ORDER BY IdDanhMuc DESC";

			db.createMenu("ListCategoryServlet?", page, sql_select_category);

			ResultSet result_select = null;
			if (page != -1) {
				result_select = db.getResultSet(sql_select_category + " limit "
						+ (page - 1) * db.getNBangGhi() + ","
						+ db.getNBangGhi());
			} else {
				result_select = db.getResultSet(sql_select_category);
			}
			try {
			while (result_select.next()) {
				DANHMUC	category =  new DANHMUC();				
				category.setIdDanhMuc(DinhDangSQL.DeFomatSQL(result_select
						.getString("IdDanhMuc")));
				category.setTenDanhMucVi(DinhDangSQL
						.DeFomatSQL(result_select.getString("TenDanhMucVi")));
				category.setTenDanhMucJa(DinhDangSQL
						.DeFomatSQL(result_select.getString("TenDanhMucJa")));
				category.setHienThi(result_select.getInt("HienThi"));
				category.setIcon(DinhDangSQL.DeFomatSQL(result_select.getString("Icon")));
				listCategory.add(category);
			}
			return listCategory;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	public String getMenuPhanTrang() {
		return db.getMenuPhanTrang();
	}

	public void setMenu(int nBangghi, int ntrang) {
		db.setMenu(nBangghi, ntrang);
	}

	public DANHMUC getCategorybyId(String IdCategory) {
		DANHMUC categorybyId = new DANHMUC();
		String sql_select_CategorybyId = "SELECT * FROM danhmuc WHERE IdDanhMuc='"
				+ IdCategory + "' AND CoXoa = 0";
		ResultSet result_select_CategorybyId = db
				.getResultSet(sql_select_CategorybyId);
		try {
			while (result_select_CategorybyId.next()) {
				categorybyId.setIdDanhMuc(DinhDangSQL
						.DeFomatSQL(result_select_CategorybyId
								.getString("IdDanhMuc")));
				categorybyId.setTenDanhMucVi(DinhDangSQL
						.DeFomatSQL(result_select_CategorybyId
								.getString("TenDanhMucVi")));
				categorybyId.setTenDanhMucJa(DinhDangSQL
						.DeFomatSQL(result_select_CategorybyId
								.getString("TenDanhMucJa")));
				categorybyId.setHienThi(result_select_CategorybyId
						.getInt("HienThi"));
			}
			return categorybyId;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	//Đếm số danh mục được hiển thị trên menu trang chủ
	public int countCategotyShow(){
		String sql_count = "SELECT COUNT(*) AS COUNT FROM danhmuc WHERE HienThi = 1 AND CoXoa = 0";
		int numberOfCategoryShow = 0;
		ResultSet result_count = db.getResultSet(sql_count);
		try {
			while(result_count.next()){
				numberOfCategoryShow = result_count.getInt("COUNT");
			}
			return numberOfCategoryShow;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	
	//Lấy các danh mục được hiện thị lên trang chủ
	public ArrayList<DANHMUC> getCategoryShowed(){
		String sql_select = "SELECT IdDanhMuc,TenDanhMucVi,TenDanhMucJa FROM danhmuc WHERE HienThi = 1 AND CoXoa = 0";
		ResultSet result_select = db.getResultSet(sql_select);
		ArrayList<DANHMUC> listCategoryShowed  = new ArrayList<DANHMUC>();
		try {
			while(result_select.next()){
				DANHMUC category = new DANHMUC();
				category.setIdDanhMuc(result_select.getString("IdDanhMuc"));
				category.setTenDanhMucVi(result_select.getString("TenDanhMucVi"));
				category.setTenDanhMucJa(result_select.getString("TenDanhMucJa"));
				listCategoryShowed.add(category);
			}
			return listCategoryShowed;
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
