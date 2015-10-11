package model.bo;

import java.util.ArrayList;

import model.bean.DANHMUC;
import model.dao.ListCategoryDAO;

public class ListCategoryBO {
	ListCategoryDAO listCategory = new ListCategoryDAO();
	public DANHMUC getCategoryById(String IdCategory){
		return listCategory.getCategorybyId(IdCategory);
	}
	public String getMenuPhanTrang(){
		return listCategory.getMenuPhanTrang();
	}
	
	public void setMenu(int nBangghi, int ntrang){
		listCategory.setMenu(nBangghi, ntrang);
	}

	public ArrayList<DANHMUC> getCategory(int page) {
		// TODO Auto-generated method stub
		return listCategory.getCategory(page);
	}
	
	//Đếm số danh mục được hiển thị
	public int countCategoryShowed(){
		return listCategory.countCategotyShow();
	}
	
	//Lấy các danh mục được hiện thị lên trang chủ
	public ArrayList<DANHMUC> getCategoryShowed(){
		return listCategory.getCategoryShowed();
	}
	
	public void closeConnection() {
		listCategory.closeConnection();
	}
}
