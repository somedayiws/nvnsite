package model.bo;

import model.bean.TAIKHOAN;
import model.dao.AdminSearchDAO;

public class AdminSearchBO {
	AdminSearchDAO adminSearch = new AdminSearchDAO();
	public TAIKHOAN[] selectAccount(String typeFind, String stringFind){
		return adminSearch.searchAccount(typeFind, stringFind);
	}

}
