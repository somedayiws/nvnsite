package model.bo;

import java.util.ArrayList;

import model.bean.THONGBAO;
import model.dao.ThongBaoDAO;

public class ThongBaoBO {

	ThongBaoDAO tb = new ThongBaoDAO();
	
	public ArrayList<THONGBAO> getListThongBao(String den,int page) {
		// TODO Auto-generated method stub
		return tb.getListThongBao(den, page);
	}
	
	public ArrayList<THONGBAO> getListHienThi(String den, String timtheo, String find) {
		// TODO Auto-generated method stub
		return tb.getListHienThi(den, timtheo, find);
	}

	public ArrayList<THONGBAO> getListKhongHienThi(String den, String timtheo, String find, int page) {
		// TODO Auto-generated method stub
		return tb.getListKhongHienThi(den, timtheo, find, page);
	}

	public THONGBAO getThongBao(String id) {
		// TODO Auto-generated method stub
		return tb.getThongBao(id);
	}

	public boolean ThemThongBao(String tieude, String noidung, String guiden) {
		// TODO Auto-generated method stub
		return tb.ThemThongBao(tieude, noidung, guiden);
	}
	
	public boolean ThemThongBaoClient(String tieude, String noidung, String guiden) {
		// TODO Auto-generated method stub
		return tb.ThemThongBaoClient(tieude, noidung, guiden);
	}

	public boolean SuaThongBao(String id, String tieude, String noidung,
			String guiden) {
		// TODO Auto-generated method stub
		return tb.SuaThongBao(id, tieude, noidung, guiden);
	}

	public boolean XoaThongBao(String id) {
		// TODO Auto-generated method stub
		return tb.XoaThongBao(id);
	}

	public boolean SuaThongBao(String id, String hienthi) {
		// TODO Auto-generated method stub
		return tb.SuaThongBao(id, hienthi);
	}

	public int CheckMail(String idtaikhoan, String tentaikhoan){
		return tb.CheckMail(idtaikhoan, tentaikhoan);
	} 
	
	public String getMenuPhanTrang(){
		return tb.getMenuPhanTrang();
	}

	public void setMenu(int nBangghi, int ntrang){
		tb.setMenu(nBangghi, ntrang);
	}

	public void setViewed(String id) {
		tb.setViewed(id);
	}
	public void closeConnection() {
		tb.closeConnection();
	}
}
