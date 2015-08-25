package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.bean.DANHMUC;

public class ListCategoryDAO {
	MySQLConnector db = new MySQLConnector();
	/**Get data Category*/
	public DANHMUC[] getCategory()
	{
		int number_of_category = 0;
		int i=0;
		/*Count number of category*/
		String sql_count_category = "SELECT COUNT(*) AS NUMBER_OF_CATEGORY FROM danhmuc WHERE CoXoa = 0";
		ResultSet result_count = db.getResultSet(sql_count_category);
		try {
			while(result_count.next()){
				number_of_category = result_count.getInt("NUMBER_OF_CATEGORY");
			}
			if(number_of_category==0){
				return null;
			}
		DANHMUC[] category = new DANHMUC[number_of_category];
		/*Get category*/
		String sql_select_category = "SELECT * FROM danhmuc WHERE CoXoa = 0";
		ResultSet result_select = db.getResultSet(sql_select_category);
		
		while(result_select.next()){
			category[i] = new DANHMUC();
			category[i].setIdDanhMuc(DinhDangSQL.DeFomatSQL(result_select.getString("IdDanhMuc")));
			category[i].setTenDanhMucVi(DinhDangSQL.DeFomatSQL(result_select.getString("TenDanhMucVi")));
			category[i].setTenDanhMucJa(DinhDangSQL.DeFomatSQL(result_select.getString("TenDanhMucJa")));
			category[i].setHienThi(result_select.getInt("HienThi"));
			i++;
		}
		return category;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	public DANHMUC getCategorybyId(String IdCategory){
		DANHMUC categorybyId = new DANHMUC(); 
		String sql_select_CategorybyId = "SELECT * FROM danhmuc WHERE IdDanhMuc='"+IdCategory+"' AND CoXoa = 0";
		ResultSet result_select_CategorybyId = db.getResultSet(sql_select_CategorybyId);
		try {
			while(result_select_CategorybyId.next()){
				categorybyId.setIdDanhMuc(DinhDangSQL.DeFomatSQL(result_select_CategorybyId.getString("IdDanhMuc")));
				categorybyId.setTenDanhMucVi(DinhDangSQL.DeFomatSQL(result_select_CategorybyId.getString("TenDanhMucVi")));
				categorybyId.setTenDanhMucJa(DinhDangSQL.DeFomatSQL(result_select_CategorybyId.getString("TenDanhMucJa")));
				categorybyId.setHienThi(result_select_CategorybyId.getInt("HienThi"));
			}
			return categorybyId;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

}
