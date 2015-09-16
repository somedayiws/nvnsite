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
		taikhoanDAO.addTaiKhoan(taikhoan, matkhau, hoten, diachi, dienthoai, email, ngonngu);
	}
}
