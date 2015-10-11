package model.bo;

import java.util.ArrayList;

import model.bean.QUANGCAO;
import model.dao.AdvertisementDAO;

public class AdvertisementBO {
	AdvertisementDAO advertisement = new AdvertisementDAO(); 
	public String getMenuPhanTrang(){
		return advertisement.getMenuPhanTrang();
	}
	
	public void setMenu(int nBangghi, int ntrang){
		advertisement.setMenu(nBangghi, ntrang);
	}

	public ArrayList<QUANGCAO> getAdvertisement(int page, boolean hthi) {
		// TODO Auto-generated method stub
		return advertisement.listAdv(page, hthi);
	}
	public void closeConnection() {
		advertisement.closeConnection();
	}
}
