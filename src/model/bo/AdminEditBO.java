package model.bo;

import model.bean.TAIKHOAN;
import model.dao.AdminEditDAO;

public class AdminEditBO {
	public String error;
	AdminEditDAO adminEdit = new AdminEditDAO();
	/**Check validate*/
	public boolean checkAccount(TAIKHOAN account)
	{
		if (Validate.check_text("Họ tên - 氏名", account.getHoTen(), 30, "text")
				&& Validate.check_text("Địa chỉ - 住所", account.getDiaChi(), 50,"text")
				&& Validate.check_text("Số điện thoại - 電話番号", account.getDienThoai(), 50, "phone")
				&& Validate.check_text("Email - メール", account.getEmail(), 50, "email")
				&& Validate.check_text("Tên tài khoản - ユーザー名", account.getTenTaiKhoan(), 20, "user"))				
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
	public void closeConnection() {
		adminEdit.closeConnection();
	}
	

}
