package model.bo;

import java.util.ArrayList;

import model.bean.TAIKHOAN;
import model.dao.ListAccountDAO;

public class ListAccountBO {
	ListAccountDAO lisAccount  = new ListAccountDAO();
	public TAIKHOAN[] getDataAccountInfor()
	{
		
		return lisAccount.getDataAcountInfor();
	}
	
	public TAIKHOAN getAccountbyUser(String username){
		return lisAccount.getAccountbyUser(username);
	}
	

}
