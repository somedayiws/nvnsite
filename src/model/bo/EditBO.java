package model.bo;

import model.bean.TAIKHOAN;
import model.dao.EditDAO;

public class EditBO {
	public String error;
	EditDAO edit = new EditDAO();
	
	/**Check validate data input*/
	public boolean checkAccount(TAIKHOAN account)
	{
		if (Validate.check_text("Họ tên - 氏名", account.getHoTen(), 30, "text")
				&& Validate.check_text("Địa chỉ - 住所", account.getDiaChi(), 50,"text")
				&& Validate.check_text("Số điện thoại - 電話番号", account.getDienThoai(), 50, "phone")
				&& Validate.check_text("Email - メール", account.getEmail(), 30, "email"))		
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
	public void closeConnection() {
		edit.closeConnection();
	}

}
