package model.bo;

import java.util.ArrayList;

import model.bean.TAIKHOAN;
import model.dao.GetAccountDAO;

public class GetAccountBO {
	GetAccountDAO getAcc = new GetAccountDAO();
	public ArrayList<TAIKHOAN> listAccountByStatus(String status){
		return getAcc.getAccountByStatus(status);
	}
	public TAIKHOAN getAccErrorTranslate(String status){
		return getAcc.getAccErrorTranslate(status);
	}

}
