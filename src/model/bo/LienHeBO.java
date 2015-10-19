package model.bo;

import java.util.ArrayList;

import model.bean.LIENHE;
import model.bean.TAIKHOAN;
import model.dao.LienHeDAO;

public class LienHeBO {

	LienHeDAO lienHeDAO = new LienHeDAO();
	public void setMenu(int nBangghi, int ntrang){
		lienHeDAO.setMenu(nBangghi, ntrang);
	}

	public String getMenuPhanTrang(){
		return lienHeDAO.getMenuPhanTrang();
	}
	
	public void closeConnection() {
		lienHeDAO.closeConnection();
	}

	public void addLienHe(String taikhoan, String hoten, String dienthoai,
			String email, String tieude, String noidung) {
		lienHeDAO.addLienHe(taikhoan, hoten, dienthoai, email, tieude,
				noidung);
	}
	public ArrayList<LIENHE> getListLienHe(String timtheo, String txtFind,
			int page) {
		// TODO Auto-generated method stub
		return lienHeDAO.getListLienHe(timtheo, txtFind, page);
	}

	public LIENHE getLienHe(String id) {
		// TODO Auto-generated method stub
		return lienHeDAO.getLienHe(id);
	}

	public boolean XoaLienHe(String id) {
		// TODO Auto-generated method stub
		return lienHeDAO.XoaLienHe(id);
	}

	public void capNhat(String id) {
		// TODO Auto-generated method stub
		lienHeDAO.capNhat(id);
	}
}
