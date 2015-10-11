package model.bo;



import java.util.ArrayList;

import model.bean.TAIKHOAN;
import model.dao.ListAccountDAO;

public class ListAccountBO {
	ListAccountDAO lisAccount  = new ListAccountDAO();
	public ArrayList<TAIKHOAN> getDataAccountInfor(int start,int limit,String status,String language)
	{
		
		return lisAccount.getDataAcountInfor(start,limit,status,language);
	}
	
	public TAIKHOAN getAccountbyUser(String username){
		return lisAccount.getAccountbyUser(username);
	}
	
	public int totalRecord(){
		return lisAccount.totalRecord("all");
	}

	public String getMenuPhanTrang(){
		return lisAccount.getMenuPhanTrang();
	}
	
	public void setMenu(int nBangghi, int ntrang){
		lisAccount.setMenu(nBangghi, ntrang);
	}

	public ArrayList<TAIKHOAN> getDataAccountInfor(int page) {
		// TODO Auto-generated method stub
		return lisAccount.getDataAcountInfor(page);
	}
	
	//Lấy trạng thái của tài khoản
	public String getStatusAccount(String idAccount){
		return lisAccount.getStatusAccount(idAccount);
	}
	
	public void closeConnection() {
		lisAccount.closeConnection();
	}
}
