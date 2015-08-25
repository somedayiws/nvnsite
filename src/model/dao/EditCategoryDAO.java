package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.bean.DANHMUC;

public class EditCategoryDAO {

	MySQLConnector db = new MySQLConnector();

	/** Check exist */
	public boolean checkCategoryExist(DANHMUC category) {
		
		category.setTenDanhMucVi(DinhDangSQL.FomatSQL(category.getTenDanhMucVi()));
		category.setTenDanhMucJa(DinhDangSQL.FomatSQL(category.getTenDanhMucJa()));
		
		String sql_select_Category = "SELECT * FROM danhmuc WHERE (IdDanhMuc <>'"
				+ category.getIdDanhMuc()
				+ "') AND (TenDanhMucVi='"
				+ category.getTenDanhMucVi()
				+ "' AND TenDanhMucJa='"
				+ category.getTenDanhMucJa() + "') AND CoXoa='0'";
		ResultSet result_select = db.getResultSet(sql_select_Category);
		try {
			if (result_select.next()) {
				// Exist
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return true;
		}
	}

	public boolean updateCategory(DANHMUC category) {
		
		category.setTenDanhMucVi(DinhDangSQL.FomatSQL(category.getTenDanhMucVi()));
		category.setTenDanhMucJa(DinhDangSQL.FomatSQL(category.getTenDanhMucJa()));
		String sql_update = "UPDATE danhmuc SET TenDanhMucVi=N'"
				+ category.getTenDanhMucVi() + "',TenDanhMucJa='"
				+ category.getTenDanhMucJa() + "',HienThi='"
				+ category.getHienThi() + "' WHERE IdDanhMuc ='"+category.getIdDanhMuc()+"'";
		return db.updateData(sql_update);
	}
}
