package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.bean.DANHMUC;

public class EditCategoryDAO {

	DataBaseDAO db = new DataBaseDAO();

	/** Check exist */
	public boolean checkCategoryExist(DANHMUC category) {
		
		category.setTenDanhMucVi(DinhDangSQL.FomatSQL(category.getTenDanhMucVi()));
		category.setTenDanhMucJa(DinhDangSQL.FomatSQL(category.getTenDanhMucJa()));
		
		String sql_select_Category = "SELECT * FROM danhmuc WHERE (IdDanhMuc <>'"
				+ category.getIdDanhMuc()
				+ "') AND (TenDanhMucVi='"
				+ category.getTenDanhMucVi()
				+ "' AND TenDanhMucJa='"
				+ category.getTenDanhMucJa() + "') AND HienThi = '"+category.getHienThi()+"' AND Icon = '"+category.getIcon()+"' AND CoXoa='0'";
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
		category.setIdDanhMuc(DinhDangSQL.FomatSQL(category.getIdDanhMuc()));
		category.setTenDanhMucVi(DinhDangSQL.FomatSQL(category.getTenDanhMucVi()));
		category.setTenDanhMucJa(DinhDangSQL.FomatSQL(category.getTenDanhMucJa()));
		category.setIcon(DinhDangSQL.FomatSQL(category.getIcon()));
		
		System.out.println("icon: "+category.getIcon());
		String sql_update = "UPDATE danhmuc SET TenDanhMucVi=N'"
				+ category.getTenDanhMucVi() + "',TenDanhMucJa='"
				+ category.getTenDanhMucJa() + "',HienThi='"
				+ category.getHienThi() + "',Icon = '"+category.getIcon()+"'  WHERE IdDanhMuc ='"+category.getIdDanhMuc()+"'";
		
		System.out.println("sql_update: "+sql_update);
		return db.updateData(sql_update);
	}
	
	//Thay đổi hiển thị
	public boolean changeShowed(String idCategory){
		
		String sql_change = "UPDATE danhmuc SET HienThi = 0 WHERE IdDanhMuc='"+idCategory+"' AND CoXoa = 0";		
		return db.updateData(sql_change);
	}
	//Kiểm tra IdDanhMuc tồn tại trong bảng danh mục
		public boolean checkExistID(String idCategory){
			String sql_check = "SELECT IdDanhMuc FROM danhmuc WHERE IdDanhMuc = '"+idCategory+"' AND CoXoa = 0";
			ResultSet result_check = db.getResultSet(sql_check);
			try {
				while(result_check.next()){
					//Có tồn tại
					return true;
				}
				return false;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
			
		}

	public void closeConnection() {
		db.closeConnection();
	}

}
