package model.bo;

import model.bean.TAIKHOAN;
import model.dao.AdminEditDAO;

public class AdminEditBO {
	public String error;
	AdminEditDAO adminEdit = new AdminEditDAO();
	/**Check validate*/
	public boolean checkAccount(TAIKHOAN account)
	{
		if (Validate.check_text("Name", account.getHoTen(), 30, "text")
				&& Validate.check_text("Adress", account.getDiaChi(), 50,"text")
				&& Validate.check_text("Phone", account.getDienThoai(), 11, "phone")
				&& Validate.check_text("Email", account.getEmail(), 30, "email")
				&& Validate.check_text("Username", account.getTenTaiKhoan(), 20, "user"))				
		{
			//Data valid
			return true;
		}
		else{
			error = Validate.errorValidate;
			return false;
		}
	}
	
	/**Update data*/
	public boolean updateAccount(TAIKHOAN account)
	{
		return adminEdit.updateAccount(account);
	}
	
	

}
