package model.bo;

import model.bean.TAIKHOAN;
import model.dao.TaiKhoanDAO;

public class TaiKhoanBO {

	TaiKhoanDAO taikhoanDAO = new TaiKhoanDAO();

	public boolean chekOk(String username, String password) {
		// TODO Auto-generated method stub
		return taikhoanDAO.chekOk(username, password);
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

	public void registerAccountWithFacebook(String facebookId,
			String facebookLink, String hoten, String email) {
		taikhoanDAO.registerAccountWithFacebook(facebookId, facebookLink,
				hoten, email);
	}

	public boolean checkLoginWithFacebook(String facebookId) {
		return taikhoanDAO.checkLoginWithFacebook(facebookId);
	}

	public void registerAccountWithGoogle(String googleId, String hoten,
			String email) {
		taikhoanDAO.registerAccountWithGoogle(googleId, hoten, email);
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

}
