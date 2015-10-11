package model.bo;

import model.dao.ChangePassDAO;

public class ChangePassBO {
	public String error;
	ChangePassDAO changepass = new ChangePassDAO();
	/**Check valid data*/
	public boolean checkValid(String password,String password_new,String re_password_new )
	{
		if(!re_password_new.equals(password_new))
		{
			error = "Re-password must same password new";
			return false;
		}
		else if(!Validate.check_text("Password", password_new, 50, "pass")|| !Validate.check_text("New Password", password_new, 50, "pass"))
		{
			error = "Data enter not valid";
			return false;
		}
		else if(password.equals(password_new))
		{
			error = "New password must different password old";
			return false;
		}
		else
		{
			return true;
		}
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
	public void closeConnection() {
		changepass.closeConnection();
	}
}
