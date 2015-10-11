package model.bo;

import model.dao.RestoreDAO;

public class RestoreBO {
	
		public String error;
		RestoreDAO restoreDAO = new RestoreDAO();
	/**Check validate mail*/
		public boolean checkEmailValid(String email) {
			  
			if(Validate.check_text("Email", email, 30, "email"))
			{
				return true;
			}
			else
			{
				error = Validate.errorValidate;
				return false;
			}
		}
	
	/**Check email exist and get username*/
		
	public String[] getData_Account(String email)
	{
		if(restoreDAO.checkEmail_exist(email))
		{
			return restoreDAO.getAccount(email);
		}
		else
		{
			error = "Email not exists in system";
			return null;
		}
	}
	
	public void closeConnection() {
		restoreDAO.closeConnection();
	}
}
