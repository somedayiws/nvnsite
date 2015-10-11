package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.DANHMUC;


public class SearchCategoryDAO {
	DataBaseDAO db = new DataBaseDAO();

	public ArrayList<DANHMUC> searchCategory(String typeFind, String stringFind, int page) {
		typeFind = DinhDangSQL.FomatSQL(typeFind);
		stringFind = DinhDangSQL.FomatSQL(stringFind);
//		int numberOfCat = 0;
//		int i = 0;
//		String sql_count_category = "SELECT COUNT(*) AS NUMBER_OF_CAT FROM danhmuc WHERE "
//				+ typeFind + "='" + stringFind + "' AND CoXoa = 0";		
//		ResultSet result_count = db.getResultSet(sql_count_category);
//		
//			while (result_count.next()) {
//				numberOfCat = result_count.getInt("NUMBER_OF_CAT");
//			}
//		if(numberOfCat == 0) return null;
//			DANHMUC[] category = new DANHMUC[numberOfCat];
		ArrayList<DANHMUC> categorys = new ArrayList<DANHMUC>();
		
		String sql_select_category = "SELECT IdDanhMuc,TenDanhMucVi,TenDanhMucJa,HienThi,ICon FROM danhmuc WHERE "+typeFind+ " LIKE '%"+stringFind+"%' AND CoXoa = 0 ORDER BY IdDanhMuc DESC";
		
		db.createMenu("SearchCategoryServlet?typeFind="+typeFind+"&stringFind="+stringFind+"&btnFind=Find&", page, sql_select_category);
		System.out.println("sql_select_category: "+sql_select_category + " limit "
				+ (page - 1) * db.getNBangGhi() + ","
				+ db.getNBangGhi());
		ResultSet result_select = db.getResultSet(sql_select_category + " limit "
				+ (page - 1) * db.getNBangGhi() + ","
				+ db.getNBangGhi());
		
		try {
		while (result_select.next())
		{
			DANHMUC category = new DANHMUC();
			category.setIdDanhMuc(DinhDangSQL.DeFomatSQL(result_select.getString("IdDanhMuc")));
			category.setTenDanhMucVi(DinhDangSQL.DeFomatSQL(result_select.getString("TenDanhMucVi")));
			category.setTenDanhMucJa(DinhDangSQL.DeFomatSQL(result_select.getString("TenDanhMucJa")));			
			category.setHienThi(result_select.getInt("HienThi"));
			category.setIcon(DinhDangSQL.DeFomatSQL(result_select.getString("Icon")));
			categorys.add(category);
		}
		
			return categorys;
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
	public void closeConnection() {
		db.closeConnection();
	}

}
