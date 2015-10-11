package model.bo;

import java.util.ArrayList;

import model.bean.TAIKHOAN;
import model.dao.AdminSearchDAO;

public class AdminSearchBO {
	AdminSearchDAO adminSearch = new AdminSearchDAO();
	public ArrayList<TAIKHOAN> selectAccount(String typeFind, String stringFind,int page,String type){
		return adminSearch.searchAccount(typeFind, stringFind,page,type);
	}
	public String getMenuPhanTrang(){
		return adminSearch.getMenuPhanTrang();
	}
	
	public void setMenu(int nBangghi, int ntrang){
		adminSearch.setMenu(nBangghi, ntrang);
	}
	public void closeConnection() {
		adminSearch.closeConnection();
	}
}
