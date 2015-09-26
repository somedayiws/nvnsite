package model.bo;

import java.util.ArrayList;

import model.bean.TAIKHOAN;
import model.dao.AdminSearchDAO;

public class AdminSearchBO {
	AdminSearchDAO adminSearch = new AdminSearchDAO();
	public ArrayList<TAIKHOAN> selectAccount(String typeFind, String stringFind,int page){
		return adminSearch.searchAccount(typeFind, stringFind,page);
	}
	public String getMenuPhanTrang(){
		return adminSearch.getMenuPhanTrang();
	}
	
	public void setMenu(int nBangghi, int ntrang){
		adminSearch.setMenu(nBangghi, ntrang);
	}

}
