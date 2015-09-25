package model.bo;

import java.util.ArrayList;

import model.bean.THONGBAO;
import model.dao.ThongBaoDAO;

public class ThongBaoBO {

	ThongBaoDAO tb = new ThongBaoDAO();
	
	public ArrayList<THONGBAO> getListHienThi(String den) {
		// TODO Auto-generated method stub
		return tb.getListHienThi(den);
	}

	public ArrayList<THONGBAO> getListKhongHienThi(String den, String page, String top) {
		// TODO Auto-generated method stub
		return tb.getListKhongHienThi(den, page, top);
	}

	public THONGBAO getThongBao(String id) {
		// TODO Auto-generated method stub
		return tb.getThongBao(id);
	}

	public boolean ThemThongBao(String tieude, String noidung, String guiden) {
		// TODO Auto-generated method stub
		return tb.ThemThongBao(tieude, noidung, guiden);
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

}
