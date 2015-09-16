package model.bo;



import model.bean.TAIKHOAN;
import model.dao.ListAccountDAO;

public class ListAccountBO {
	ListAccountDAO lisAccount  = new ListAccountDAO();
	public TAIKHOAN[] getDataAccountInfor(int start,int limit,String status)
	{
		
		return lisAccount.getDataAcountInfor(start,limit,status);
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

	public TAIKHOAN[] getDataAccountInfor(int page) {
		// TODO Auto-generated method stub
		return lisAccount.getDataAcountInfor(page);
	}
	

}
