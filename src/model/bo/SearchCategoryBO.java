package model.bo;

import java.util.ArrayList;

import model.bean.DANHMUC;
import model.dao.SearchCategoryDAO;

public class SearchCategoryBO {
	SearchCategoryDAO searchCategory = new SearchCategoryDAO();

	public ArrayList<DANHMUC> selectCategory(String typeFind, String stringFind,int page) {
		// TODO Auto-generated method stub
		return searchCategory.searchCategory(typeFind, stringFind,page);
	}
	public String getMenuPhanTrang(){
		return searchCategory.getMenuPhanTrang();
	}
	
	public void setMenu(int nBangghi, int ntrang){
		searchCategory.setMenu(nBangghi, ntrang);
	}

	public void closeConnection() {
		searchCategory.closeConnection();
	}
}
