package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.BAIVIET;

public class SearchPostDAO {
	
	DataBaseDAO db = new DataBaseDAO();
	ListCategoryDAO category = new ListCategoryDAO();
	ListAccountDAO account = new ListAccountDAO();
	ListCommentDAO comment = new ListCommentDAO();
	
	@SuppressWarnings("null")
	public ArrayList<BAIVIET> searchPost(String typeFind,String stringFind,int page){
		 
		 String sql_Search = "SELECT IdBaiViet,TenBaiVietVi,TenBaiVietJa,IdDanhMuc,IdTaiKhoan,NgayDang,MotaVi,MotaJa,TrangThai FROM baiviet WHERE "+typeFind+" LIKE '%"+stringFind+"%' AND CoXoa = 0 ORDER BY NgayDang DESC";
	
	//	System.out.println("sql_Search: "+sql_Search);
		db.createMenu("SearchPostServlet?typeFind="+typeFind+"&stringFind="+stringFind+"&", page, sql_Search);
	//	System.out.println("pageDAO: "+page);
		
		System.out.println("sqlSearch: "+sql_Search + " limit "
				+ (page - 1) * db.getNBangGhi() + ","
				+ db.getNBangGhi());
		ResultSet resultSearch = db.getResultSet(sql_Search + " limit "
				+ (page - 1) * db.getNBangGhi() + ","
				+ db.getNBangGhi());
		
		
		ArrayList<BAIVIET> posts = new ArrayList<BAIVIET>();
		String IdCategory,IdAccount;
		try {
			while(resultSearch.next()){
				BAIVIET post = new BAIVIET();
				post.setIdBaiViet(resultSearch.getString("IdBaiViet"));
				post.setTenBaiVietVi(resultSearch.getString("TenBaiVietVi"));
				post.setTenBaiVietJa(resultSearch.getString("TenBaiVietJa"));
				IdCategory = resultSearch.getString("IdDanhMuc");
				post.setDanhMuc(category.getCategorybyId(IdCategory));
				IdAccount = resultSearch.getString("IdTaiKhoan");
				post.setTaiKhoan(account.getAccountbyId(IdAccount));
				post.setNgayDang(resultSearch.getString("NgayDang"));
				post.setMoTaVi(resultSearch.getString("MotaVi"));
				post.setMoTaJa(resultSearch.getString("MotaJa"));
				post.setTrangThai(resultSearch.getString("TrangThai"));
				posts.add(post);
			}
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

}
