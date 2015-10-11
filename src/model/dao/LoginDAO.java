package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
	DataBaseDAO db= new DataBaseDAO();
	/**Check login*/
	public boolean checkLogin(String username,String password) {
		username = DinhDangSQL.FomatSQL(username);
		password = DinhDangSQL.FomatSQL(password);
		String sql_checkLogin = "select IdTaiKhoan from taikhoan where TenTaiKhoan='"+username+"' and MatKhau='"+password+"' and CoXoa=0 and QuyenQuanTri='admin'";
		ResultSet result_checkLogin = db.getResultSet(sql_checkLogin);
		try {
			if(result_checkLogin.next()){
				return true;
			}
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	public void closeConnection() {
		db.closeConnection();
	}

}
