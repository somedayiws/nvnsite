package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.TAIKHOAN;

public class GetAccountDAO {
	DataBaseDAO db= new DataBaseDAO();
	ListAccountDAO listAcc = new ListAccountDAO();
	public ArrayList<TAIKHOAN> getAccountByStatus(String status){
		String sql_select_AccountByStatus = null;
	
			sql_select_AccountByStatus = "SELECT IdTaiKhoan FROM lichsu WHERE TrangThai<>'"+status+"'";
			ResultSet result_select_AccountByStatus = db.getResultSet(sql_select_AccountByStatus);
			ArrayList<TAIKHOAN> listAccountByStatus = new ArrayList<TAIKHOAN>();
			try {
				while(result_select_AccountByStatus.next()){
					TAIKHOAN account = new TAIKHOAN();
					account =listAcc.getAccountbyId(result_select_AccountByStatus.getString("IdTaiKhoan"));
					listAccountByStatus.add(account);
				}
				return listAccountByStatus;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
		
	
	
	
		
	}
	public TAIKHOAN getAccErrorTranslate(String status){
		String sql_select_AccountByStatus = "SELECT IdTaiKhoan FROM lichsu WHERE TrangThai='"+status+"'";
		ResultSet result_select_AccountByStatus = db.getResultSet(sql_select_AccountByStatus);
		TAIKHOAN acc = new TAIKHOAN();
		
			try {
				result_select_AccountByStatus.last();
				acc = listAcc.getAccountbyId(result_select_AccountByStatus.getString("IdTaiKhoan"));
				return acc;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
				
	
	}
}
