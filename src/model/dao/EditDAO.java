package model.dao;

import model.bean.TAIKHOAN;

public class EditDAO {
	DataBaseDAO db = new DataBaseDAO();

	/** Update information account */
	public boolean updateInfor(TAIKHOAN accountInfor) {
		accountInfor.setHoTen(DinhDangSQL.FomatSQL(accountInfor.getHoTen()));
		accountInfor.setDiaChi(DinhDangSQL.FomatSQL(accountInfor.getDiaChi()));
		accountInfor.setDienThoai(DinhDangSQL.FomatSQL(accountInfor.getDienThoai()));
		accountInfor.setEmail(DinhDangSQL.FomatSQL(accountInfor.getEmail()));
		accountInfor.setTenTaiKhoan(DinhDangSQL.FomatSQL(accountInfor.getTenTaiKhoan()));
		accountInfor.setMatKhau(DinhDangSQL.FomatSQL(accountInfor.getMatKhau()));
		String sql_update_infor = "UPDATE taikhoan SET HoTen ='" + accountInfor.getHoTen()
				+ "',DiaChi='" + accountInfor.getDiaChi() + "', DienThoai ='"
				+ accountInfor.getDienThoai() + "' WHERE Email = '"
				+ accountInfor.getEmail() + "' ";
		return db.updateData(sql_update_infor);
	}

	public void closeConnection() {
		db.closeConnection();
	}

}
