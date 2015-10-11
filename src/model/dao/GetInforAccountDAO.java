package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.bean.TAIKHOAN;

public class GetInforAccountDAO {
	DataBaseDAO db = new DataBaseDAO();
	
	/**Get Account from database by username */
	public TAIKHOAN getInforAcc(String username)
	{
		username = DinhDangSQL.FomatSQL(username);
		TAIKHOAN account = null;
		String sql_select_account = "SELECT * FROM taikhoan WHERE TenTaiKhoan ='"+username+"'";
		ResultSet result_select = db.getResultSet(sql_select_account);
		try {
			while(result_select.next())
			{
				account = new TAIKHOAN();
				
				account.setTenTaiKhoan(username);
				account.setMatKhau(DinhDangSQL.DeFomatSQL(result_select.getString("MatKhau")));
				account.setHoTen(DinhDangSQL.DeFomatSQL(result_select.getString("HoTen")));
				account.setDiaChi(DinhDangSQL.DeFomatSQL(result_select.getString("DiaChi")));
				account.setDienThoai(DinhDangSQL.DeFomatSQL(result_select.getString("DienThoai")));
				account.setEmail(DinhDangSQL.DeFomatSQL(result_select.getString("Email")));
				
			}
			return account;
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
