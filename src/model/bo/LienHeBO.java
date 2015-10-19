package model.bo;

import model.bean.TAIKHOAN;
import model.dao.LienHeDAO;

public class LienHeBO {

	LienHeDAO lienHeDAO = new LienHeDAO();
	
	public void closeConnection() {
		lienHeDAO.closeConnection();
	}

	public void addLienHe(String taikhoan, String hoten, String dienthoai,
			String email, String tieude, String noidung) {
		lienHeDAO.addLienHe(taikhoan, hoten, dienthoai, email, tieude,
				noidung);
	}
}
