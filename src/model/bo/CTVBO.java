package model.bo;

import java.util.ArrayList;

import model.bean.BAIVIET;
import model.bean.CTV;
import model.dao.CTVDAO;

public class CTVBO {
	
	CTVDAO ctvDao = new CTVDAO();
	
	//Thông tin cộng tác viên
		public ArrayList<CTV> getListCTV(int page,String typeFind,String stringFind){
			return ctvDao.getListCTV(page,typeFind,stringFind);
		}
	//Lấy các thông tin khác liên quan đên cộng tác viên
		public ArrayList<BAIVIET> getPostTranslatedByCTV(int typeGet,String idCTV){
			return ctvDao.getPostTranslatedByCTV(typeGet, idCTV);
		}
		public String getMenuPhanTrang(){
			return ctvDao.getMenuPhanTrang();
		}
		
		public void setMenu(int nBangghi, int ntrang){
			ctvDao.setMenu(nBangghi, ntrang);
		}
		public void closeConnection() {
			ctvDao.closeConnection();
		}
}
