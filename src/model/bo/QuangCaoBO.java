package model.bo;

import java.util.ArrayList;

import model.bean.QUANGCAO;
import model.dao.QuangCaoDAO;

public class QuangCaoBO {

	QuangCaoDAO quangcao = new QuangCaoDAO();

	/*
	 * Lấy quảng cáo có id tương ứng return QUANGCAO
	 */
	public QUANGCAO getQuangCao(String id) {
		return quangcao.getQuangCao(id);
	}

	/*
	 * Lấy danh sách quảng cáo sắp xếp theo vị trí return
	 * ArrayList<QUANGCAO>/null
	 */
	public ArrayList<QUANGCAO> getDanhSachQuangCao() {
		return quangcao.getDanhSachQuangCao();
	}

	public ArrayList<QUANGCAO> getDanhSachQuangCao(int page) {
		return quangcao.getDanhSachQuangCao(page);
	}

	public boolean xoaQuangCao(String idQC) {
		// TODO Auto-generated method stub
		return quangcao.xoaQuangCao(idQC);
	}

	public boolean HienThiQuangCao(String idQC, String hienthi) {
		// TODO Auto-generated method stub
		return quangcao.HienThiQuangCao(idQC, hienthi);
	}

	public boolean ThemQuangCao(String company, String dienthoai, String email,
			String link, String page, String position, String numberOfDay,
			String price, String image, String display) {
		// TODO Auto-generated method stub
		return quangcao.ThemQuangCao(company, dienthoai, email, link, page,
				position, numberOfDay, price, image, display);
	}

	public boolean SuaQuangCao(String id, String company, String dienthoai,
			String email, String link, String page, String position,
			String numberOfDay, String price, String image) {
		// TODO Auto-generated method stub
		return quangcao.SuaQuangCao(id, company, dienthoai, email, link, page,
				position, numberOfDay, price, image);
	}

	public boolean KiemTraTonTai(int Vitri, int Page) {
		return quangcao.KiemTraTonTai(Vitri, Page);
	}
	public void closeConnection() {
		quangcao.closeConnection();
	}
}
