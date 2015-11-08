package model.bo;

import model.dao.AdminForgotPasswordDAO;

public class AdminForgotPasswordBO {	
	AdminForgotPasswordDAO forgotPass = new AdminForgotPasswordDAO();
	
	/**Check validate email*/
	public boolean checkValidate(String email){
		return Validate.check_text("Email - メール", email, 100, email);
	}
	 public boolean checkEmail(String email){
		 System.out.println("forgotPass.checkEmail(email): "+forgotPass.checkEmail(email));
		 return forgotPass.checkEmail(email);
	 }
	 public boolean updateEmail(String password,String email){
		 return forgotPass.updatePassword(password, email);		 
	 }
	 public void closeConnection() {
			forgotPass.closeConnection();
		}
}
