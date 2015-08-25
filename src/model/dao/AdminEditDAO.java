package model.dao;

import model.bean.TAIKHOAN;

public class AdminEditDAO {

	MySQLConnector db = new MySQLConnector();

	/** (Admin)Update account */
	public boolean updateAccount(TAIKHOAN account) {
		account.setHoTen(DinhDangSQL.FomatSQL(account.getHoTen()));
		account.setDiaChi(DinhDangSQL.FomatSQL(account.getDiaChi()));
		account.setDienThoai(DinhDangSQL.FomatSQL(account.getDienThoai()));
		account.setEmail(DinhDangSQL.FomatSQL(account.getEmail()));
		account.setTenTaiKhoan(DinhDangSQL.FomatSQL(account.getTenTaiKhoan()));
		account.setMatKhau(DinhDangSQL.FomatSQL(account.getMatKhau()));
		
		String sql_update_account = "UPDATE taikhoan SET HoTen = N'" + account.getHoTen()
				+ "',DiaChi=N'" + account.getDiaChi() + "',DienThoai='"
				+ account.getDienThoai() + "',Email='" + account.getEmail()
				+ "',QuyenQuanTri='" + account.getQuyenQuanTri()
				+ "',NgonNgu='"+account.getNgonNgu()+"',TinhTrang = '"+account.getTinhTrang()+"' WHERE TenTaiKhoan='" + account.getTenTaiKhoan() + "'";
		return db.updateData(sql_update_account);
	}

}
