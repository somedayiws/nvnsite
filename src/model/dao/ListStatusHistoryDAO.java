package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.bean.LICHSU;

public class ListStatusHistoryDAO {
	DataBaseDAO db = new DataBaseDAO();
	ListAccountDAO listAccountDao = new ListAccountDAO();
	public LICHSU getStatusHistory(String idPost){
		String sql_select_status = "SELECT IdTaiKhoan,TrangThai FROM lichsu WHERE IdBaiViet ='"+idPost+"' order by ThoiGian asc";
		System.out.println("sql_select_status: "+sql_select_status);
		ResultSet result_select_status = db.getResultSet(sql_select_status);
		LICHSU history = new LICHSU();
		try {
			if(result_select_status!=null&&result_select_status.next()){
				result_select_status.last();
				history.setTrangThai(result_select_status.getString("TrangThai"));
				history.setTaikhoan(listAccountDao.getAccountbyId(result_select_status.getString("IdTaiKhoan")));
			}
			return history;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	public void closeConnection() {
		db.closeConnection();
	}
}
