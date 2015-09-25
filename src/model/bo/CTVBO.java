package model.bo;

import java.util.ArrayList;

import model.bean.BAIVIET;
import model.bean.CTV;
import model.dao.CTVDAO;

public class CTVBO {
	
	CTVDAO ctvDao = new CTVDAO();
	
	//Thông tin cộng tác viên
		public ArrayList<CTV> getListCTV(){
			return ctvDao.getListCTV();
		}
	//Lấy các thông tin khác liên quan đên cộng tác viên
		public ArrayList<BAIVIET> getPostTranslatedByCTV(int typeGet,String idCTV){
			return ctvDao.getPostTranslatedByCTV(typeGet, idCTV);
		}

}
