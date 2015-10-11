package model.bo;

import model.bean.LICHSU;
import model.dao.ListStatusHistoryDAO;

public class ListStatusHistoryBO {
	ListStatusHistoryDAO liststatus = new ListStatusHistoryDAO();
	public LICHSU getStatus(String idPost){
		return liststatus.getStatusHistory(idPost);
	}
	public void closeConnection() {
		liststatus.closeConnection();
	}
}
