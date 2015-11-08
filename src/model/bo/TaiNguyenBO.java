package model.bo;

import model.dao.TaiNguyenDAO;

public class TaiNguyenBO {

	TaiNguyenDAO tn = new TaiNguyenDAO();
	
	public String getValue(String key) {
		// TODO Auto-generated method stub
		return tn.getValue(key);
	}

	public boolean CapNhatTaiNguyen(String soTu, String giaVN, String giaJA, String image, String image1, String thongDiep, 
			String lienHe, String dienThoai, String email, String gioiThieu, String noiQuy) {
		return tn.CapNhatTaiNguyen(soTu, giaVN, giaJA, image, image1, thongDiep, lienHe, dienThoai, email, gioiThieu, noiQuy);
	}
	public void closeConnection() {
		tn.closeConnection();
	}
}
