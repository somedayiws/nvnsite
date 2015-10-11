package model.bo;

import java.util.ArrayList;

import model.bean.DANHMUC;
import model.dao.DanhMucDAO;

public class DanhMucBO {

	DanhMucDAO danhmuc = new DanhMucDAO();
	
	public ArrayList<DANHMUC> getDanhSachDanhMuc(String txtFind) {
		// TODO Auto-generated method stub
		return danhmuc.getDanhSachDanhMuc(txtFind);
	}

	public ArrayList<DANHMUC> getListDanhMuc(String vitri, String top) {
		// TODO Auto-generated method stub
		return danhmuc.getListDanhMuc(vitri, top);
	}

	public void addDanhMuc(String id, String tv, String tn,
			String ghim) {
		// TODO Auto-generated method stub
		danhmuc.addDanhMuc(id, tv, tn, ghim);
	}

	public DANHMUC getDanhMuc(String id) {
		// TODO Auto-generated method stub
		return danhmuc.getDanhMuc(id);
	}
	public void closeConnection() {
		danhmuc.closeConnection();
	}
}
