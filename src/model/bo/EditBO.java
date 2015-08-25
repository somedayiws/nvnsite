package model.bo;

import model.bean.TAIKHOAN;
import model.dao.EditDAO;

public class EditBO {
	public String error;
	EditDAO edit = new EditDAO();
	
	/**Check validate data input*/
	public boolean checkAccount(TAIKHOAN account)
	{
		if (Validate.check_text("Name", account.getHoTen(), 30, "text")
				&& Validate.check_text("Adress", account.getDiaChi(), 50,"text")
				&& Validate.check_text("Phone", account.getDienThoai(), 11, "phone")
				&& Validate.check_text("Email", account.getEmail(), 30, "email"))		
		{
			//Data valid
			return true;
		}
		else{
			error = Validate.errorValidate;
			return false;
		}
	}
	
	/**Update account information*/
	public boolean updateAccountInfor(TAIKHOAN accountInfor)
	{
		return edit.updateInfor(accountInfor);
	}

}
