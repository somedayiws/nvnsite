package model.bo;

import model.bean.TAIKHOAN;
import model.dao.GetInforAccountDAO;

public class GetInforAccountBO {
	GetInforAccountDAO get_Account = new GetInforAccountDAO();
	
	public TAIKHOAN getAcc(String username) {
		return get_Account.getInforAcc(username);
	}
	public void closeConnection() {
		get_Account.closeConnection();
	}
}
