package model.bo;

import java.util.ArrayList;

import model.bean.BAIVIET;
import model.dao.SearchPostDAO;

public class SearchPostBO {
	SearchPostDAO searchPostDao = new SearchPostDAO();
	
	public ArrayList<BAIVIET> searchPost(String typeFind,String stringFind,int page){
		return searchPostDao.searchPost(typeFind, stringFind,page);
	}
	public String getMenuPhanTrang(){
		return searchPostDao.getMenuPhanTrang();
	}
	
	public void setMenu(int nBangghi, int ntrang){
		searchPostDao.setMenu(nBangghi, ntrang);
	}
	public void closeConnection() {
		searchPostDao.closeConnection();
	}
}
