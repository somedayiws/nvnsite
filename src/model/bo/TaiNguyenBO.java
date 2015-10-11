package model.bo;

import model.dao.TaiNguyenDAO;

public class TaiNguyenBO {

	TaiNguyenDAO tn = new TaiNguyenDAO();
	
	public String getValue(String key) {
		// TODO Auto-generated method stub
		return tn.getValue(key);
	}

	public boolean CapNhatTaiNguyen(String soTu, String giaVN, String giaJA,
			String image, String image1) {
		return tn.CapNhatTaiNguyen(soTu, giaVN, giaJA, image, image1);
	}
	public void closeConnection() {
		tn.closeConnection();
	}
}
