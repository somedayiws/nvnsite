package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.bean.DANHMUC;


public class SearchCategoryDAO {
	DataBaseDAO db = new DataBaseDAO();

	public DANHMUC[] searchCategory(String typeFind, String stringFind) {
		typeFind = DinhDangSQL.FomatSQL(typeFind);
		stringFind = DinhDangSQL.FomatSQL(stringFind);
		int numberOfCat = 0;
		int i = 0;
		String sql_count_category = "SELECT COUNT(*) AS NUMBER_OF_CAT FROM danhmuc WHERE "
				+ typeFind + "='" + stringFind + "' AND CoXoa = 0";		
		ResultSet result_count = db.getResultSet(sql_count_category);
		try {
			while (result_count.next()) {
				numberOfCat = result_count.getInt("NUMBER_OF_CAT");
			}
		if(numberOfCat == 0) return null;
			DANHMUC[] category = new DANHMUC[numberOfCat];	
			String sql_select_category = "SELECT * FROM DANHMUC WHERE "
					+ typeFind + "='" + stringFind + "' AND CoXoa = 0";			
		ResultSet result_select = db.getResultSet(sql_select_category);		
		while (result_select.next())
		{
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
}
