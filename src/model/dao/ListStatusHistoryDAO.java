package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ListStatusHistoryDAO {
	MySQLConnector db = new MySQLConnector();
	public String getStatusHistory(String idPost){
		String sql_select_status = "SELECT TrangThai FROM lichsu WHERE IdBaiViet ='"+idPost+"'";
		ResultSet result_select_status = db.getResultSet(sql_select_status);
		try {
			result_select_status.last();
			String status = result_select_status.getString("TrangThai");
			return status;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
