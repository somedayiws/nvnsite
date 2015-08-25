package model.bo;

import model.dao.ListStatusHistoryDAO;

public class ListStatusHistoryBO {
	ListStatusHistoryDAO liststatus = new ListStatusHistoryDAO();
	public String getStatus(String idPost){
		return liststatus.getStatusHistory(idPost);
	}

}
