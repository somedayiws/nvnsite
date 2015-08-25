package model.bo;

import model.dao.LoginDAO;

public class LoginBO {
	
	LoginDAO check = new LoginDAO();
	
	/**Check login*/
	public boolean checkLogin(String username, String password){
		return check.checkLogin(username, password);
	}
}
