package model.bo;

import java.util.ArrayList;

import model.bean.TAIKHOAN;
import model.dao.GetAccountDAO;

public class GetAccountBO {
	GetAccountDAO getAcc = new GetAccountDAO();
	public ArrayList<TAIKHOAN> listAccountByStatus(String status,String language){
		return getAcc.getAccountByStatus(status,language);
	}
	public TAIKHOAN getAccErrorTranslate(String idPost){
		return getAcc.getAccErrorTranslate(idPost);
	}
	public void closeConnection() {
		getAcc.closeConnection();
	}
}
