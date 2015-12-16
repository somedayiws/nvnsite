package model.bo;

import model.bean.TAIKHOAN;
import model.dao.TaiKhoanDAO;

public class TaiKhoanBO {

	TaiKhoanDAO taikhoanDAO = new TaiKhoanDAO();

	public boolean chekOk(String username, String password) {
		// TODO Auto-generated method stub
		return taikhoanDAO.chekOk(username, password);
	}
	public String checkValidChangePass(String username, String oldPassword, String newPassword, String passwordAgain) {
		// TODO Auto-generated method stub
		return taikhoanDAO.checkValidChangePass(username, oldPassword, newPassword, passwordAgain);
	}
	
	

	public boolean chekOk(String username, String password, int x) {
		// TODO Auto-generated method stub
		return taikhoanDAO.chekOk(username, password, x);
	}

	public TAIKHOAN getTaiKhoan(String username, String password) {
		// TODO Auto-generated method stub
		return taikhoanDAO.getTaiKhoan(username, password);
	}

	public boolean UpdateThongTin(TAIKHOAN user) {
		// TODO Auto-generated method stub
		return taikhoanDAO.UpdateThongTin(user);
	}
	
	public boolean updateUsername(String oldUsername, String newUsername) {
		return taikhoanDAO.updateUsername(oldUsername, newUsername);
	}
	public boolean updatePassword(String idTaiKhoan, String password) {
		return taikhoanDAO.updatePassword(idTaiKhoan, password);
	}
	public boolean updateEmail(String oldEmail, String newEmail) {
		// TODO Auto-generated method stub
		return taikhoanDAO.updateEmail(oldEmail, newEmail);
	}

	public void addTaiKhoan(String taikhoan, String matkhau, String hoten,
			String diachi, String dienthoai, String email, String ngonngu) {
		// TODO Auto-generated method stub
		taikhoanDAO.addTaiKhoan(taikhoan, matkhau, hoten, diachi, dienthoai,
				email, ngonngu);
	}

	public void closeConnection() {
		taikhoanDAO.closeConnection();
	}

	public boolean kiemTraTonTai(String tk) {
		// TODO Auto-generated method stub
		return taikhoanDAO.kiemTraTonTai(tk);
	}

	public void registerAccountWithFacebook(String tenTaiKhoan, String facebookId,
			String facebookLink, String hoten, String email, String password) {
		taikhoanDAO.registerAccountWithFacebook(tenTaiKhoan, facebookId, facebookLink,
				hoten, email, password);
	}

	public boolean checkLoginWithFacebook(String facebookId) {
		return taikhoanDAO.checkLoginWithFacebook(facebookId);
	}

	public void registerAccountWithGoogle(String tenTaiKhoan, String googleId, String hoten,
			String email, String password) {
		taikhoanDAO.registerAccountWithGoogle(tenTaiKhoan, googleId, hoten, email, password);
	}

	public boolean checkLoginWithGoogle(String googleId) {
		return taikhoanDAO.checkLoginWithGoogle(googleId);
	}

	public boolean chekEmail(String email) {
		return taikhoanDAO.chekEmail(email);
	}

	public boolean updateAccountByEmail(TAIKHOAN user) {
		return taikhoanDAO.updateAccountByEmail(user);
	}
	public boolean updateAccountByEmailGoogle(TAIKHOAN user) {
		return taikhoanDAO.updateAccountByEmailGoogle(user);
	}

	public TAIKHOAN getAccountByEmail(String email) {
		return taikhoanDAO.getAccountByEmail(email);
	}
	public TAIKHOAN getAccountByIdSocial(String type, String email) {
		return taikhoanDAO.getAccountByIdSocial(type, email);
	}

	public TAIKHOAN getTaiKhoanByKey(String guiden) {
		// TODO Auto-generated method stub
		return taikhoanDAO.getAccountEmailorUserName(guiden);
	}

}
