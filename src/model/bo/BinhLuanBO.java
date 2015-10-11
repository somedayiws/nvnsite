package model.bo;

import java.util.ArrayList;

import model.bean.BINHLUAN;
import model.dao.BinhLuanDAO;

public class BinhLuanBO {
	BinhLuanDAO bl = new BinhLuanDAO();
	public ArrayList<BINHLUAN> getListBinhLuan(String id, String ngonngu,
			String vitri) {
		// TODO Auto-generated method stub
		return bl.getListBinhLuan(id, ngonngu, vitri);
	}
	public void addBinhLuanVi(String id, String idTaiKhoan, String binhluan) {
		// TODO Auto-generated method stub
		bl.addBinhLuanVi(id, idTaiKhoan, binhluan);
	}
	public void addBinhLuanJa(String id, String idTaiKhoan, String binhluan) {
		// TODO Auto-generated method stub
		bl.addBinhLuanJa(id, idTaiKhoan, binhluan);
	}
	public void closeConnection() {
		bl.closeConnection();
	}
}
