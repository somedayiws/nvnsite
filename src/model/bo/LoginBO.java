package model.bo;

import model.dao.LoginDAO;

public class LoginBO {
	
	LoginDAO check = new LoginDAO();
	
	/**check validate data(username,password)*/
	public boolean checkValidate(String username, String password){
		return (Validate.check_text("Tên tài khoản - ユーザー名", username, 50, "user")|| Validate.check_text("Mật khẩu - パスワード", password, 50, "pass"));
	}
	
	/**Check login*/
	public boolean checkLogin(String username, String password){
		return check.checkLogin(username, password);
	}
	public void closeConnection() {
		check.closeConnection();
	}
}
