package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.QUANGCAO;

public class AdvertisementDAO {
	DataBaseDAO db = new DataBaseDAO();
	
	//Lấy danh sách các quảng cáo
	public ArrayList<QUANGCAO> listAdv(int page, boolean hthi){
		ArrayList<QUANGCAO> listAdvertise = new ArrayList<QUANGCAO>();
		String sql_select_advertise = "";
		if(hthi) sql_select_advertise = "SELECT * FROM quangcao where HienThi='1'";
		else sql_select_advertise = "SELECT * FROM quangcao where HienThi='0'";
		db.createMenu("ListAdvertiseServlet?", page, sql_select_advertise);
		ResultSet result_select = null;
		if (page != -1) {
			result_select = db.getResultSet(sql_select_advertise + " limit "
					+ (page - 1) * db.getNBangGhi() + ","
					+ db.getNBangGhi());
		} else {
			result_select = db.getResultSet(sql_select_advertise);
		}
		
		try {
			while(result_select.next()){
				QUANGCAO advertise = new QUANGCAO();
				advertise.setIdQuangCao(result_select.getInt("IdQuangCao"));
				advertise.setViTri(result_select.getInt("ViTri"));
				advertise.setHienThi(result_select.getInt("HienThi"));				
				advertise.setLienKet(DinhDangSQL.FomatSQL(result_select.getString("LienKet")));
				advertise.setHinhAnh(DinhDangSQL.FomatSQL(result_select.getString("HinhAnh")));
				advertise.setSoNgay(result_select.getInt("SoNgay"));
				advertise.setNgayDang(result_select.getDate("NgayDang").toString());
				listAdvertise.add(advertise);
			}
			return listAdvertise;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	public String getMenuPhanTrang() {
		return db.getMenuPhanTrang();
	}

	public void setMenu(int nBangghi, int ntrang) {
		db.setMenu(nBangghi, ntrang);
	}

}
