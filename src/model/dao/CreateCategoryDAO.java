package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.bean.DANHMUC;

public class CreateCategoryDAO {
	DataBaseDAO db = new DataBaseDAO();

	/** Check exist */
	public boolean checkCategoryExit(DANHMUC category) {
		
		category.setTenDanhMucVi(DinhDangSQL.FomatSQL(category.getTenDanhMucVi()));
		category.setTenDanhMucJa(DinhDangSQL.FomatSQL(category.getTenDanhMucJa()));
	
		String sql_select_Category = "SELECT * FROM danhmuc WHERE TenDanhMucVi = '"
				+ category.getTenDanhMucVi()
				+ "' OR TenDanhMucJa='"
				+ category.getTenDanhMucJa() + "' AND CoXoa = 0";
		ResultSet result_select = db.getResultSet(sql_select_Category);
		try {
			if (result_select.next()) {
				// Exist
				return true;
			} else
				return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	/** Get id of category last */
	public String getId_Ca_last() {
		String id_Category_last = null;
		String sql_select_id_category = "SELECT * FROM danhmuc";
		ResultSet resultset_id_category = db.getResultSet(sql_select_id_category);
		try {
			resultset_id_category.last();
			id_Category_last = resultset_id_category.getString("IdDanhMuc");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id_Category_last;
	}
	
	/** Insert into database */
	public boolean insertCategory(DANHMUC category) {
		category.setTenDanhMucVi(DinhDangSQL.FomatSQL(category.getTenDanhMucVi()));
		category.setTenDanhMucJa(DinhDangSQL.FomatSQL(category.getTenDanhMucJa()));
		category.setIcon(DinhDangSQL.FomatSQL(category.getIcon()));
		String sql_insert_category = "INSERT INTO danhmuc VALUES('"
				+ category.getIdDanhMuc() + "',N'" + category.getTenDanhMucVi()
				+ "',N'" + category.getTenDanhMucJa() + "','"
				+ category.getHienThi() + "','0','"+category.getIcon()+"')";
		
		return db.updateData(sql_insert_category);
	}

	public void closeConnection() {
		db.closeConnection();
	}
}
