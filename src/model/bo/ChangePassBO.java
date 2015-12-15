package model.bo;

import model.dao.ChangePassDAO;

public class ChangePassBO {
	public String error;
	ChangePassDAO changepass = new ChangePassDAO();
	/**Check valid data*/
	public String checkValid(String password,String password_new,String re_password_new )
	{
		if(!re_password_new.equals(password_new))
		{
			error = "Mật khẩu lặp lại phải giống mật khẩu mới - 再入力したパスワードは必ず新しいパスワードを一致しなければならない.";
			return error;
		}
		else if(!Validate.check_text("Password", password_new, 50, "pass")|| !Validate.check_text("New Password", password_new, 50, "pass"))
		{
			error = "Dữ liệu không hợp lệ.";
			return error;
		}
		else if(password.equals(password_new))
		{
			error = "Mật khẩu mới phải khác mật khẩu cũ - 新しいパスワードは古いパスワードを必ず異なる.";
			return error;
		}
		else
			return "true";
	}
	
	/**Check pass exist*/
	public boolean checkPassExist(String password)
	{
		return changepass.checkPassExist(password);
	}
	
	/**Update password*/
	public boolean UpdatePass(String password_new,String username)
	{
		return changepass.updatePass(password_new,username);
	}
	public boolean updatePassClient(String password_new,String username)
	{
		return changepass.updatePassClient(password_new,username);
	}
	public void closeConnection() {
		changepass.closeConnection();
	}
}
