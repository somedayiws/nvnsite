package model.bo;
	
import java.util.ArrayList;

import model.bean.BAIVIET;
import model.bean.QUANGCAO;
import model.dao.QuangCaoDAO;

public class QuangCaoBO {

	QuangCaoDAO quangcao = new QuangCaoDAO();
	/*
	 * Lấy quảng cáo có id tương ứng
	 * return QUANGCAO
	 */
	public QUANGCAO getQuangCao(String id) {
		return quangcao.getQuangCao(id);
	}
	/*
	 * Lấy danh sách quảng cáo sắp xếp theo vị trí
	 * return ArrayList<QUANGCAO>/null
	 */
	public ArrayList<QUANGCAO> getDanhSachQuangCao() {
		return quangcao.getDanhSachQuangCao();
	}
}
