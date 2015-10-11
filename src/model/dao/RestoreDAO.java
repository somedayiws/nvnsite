package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RestoreDAO {
	DataBaseDAO db = new DataBaseDAO();
	
	/**Check email exist*/
	public boolean checkEmail_exist(String email)
	{
		email = DinhDangSQL.FomatSQL(email);
		String sql_select_email = "SELECT Email FROM taikhoan WHERE Email ='"+email+"'";
		ResultSet result_select_email = db.getResultSet(sql_select_email);
		try {
			if(result_select_email.next())
			{
				//Exist
				
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return false;
	}
	
	/**Restore username and password */
	public String[] getAccount(String email)
	{
		email = DinhDangSQL.FomatSQL(email);
		String username = null;
		String password = null;
		String[] account = new String[2];
		String sql_select_username = "SELECT TenTaiKhoan,MatKhau FROM taikhoan WHERE Email ='"+email+"'";
		ResultSet result_select_username = db.getResultSet(sql_select_username);
		try {
			while(result_select_username.next())
			{
				username =DinhDangSQL.DeFomatSQL(result_select_username.getString("TenTaiKhoan"));
				password =DinhDangSQL.DeFomatSQL(result_select_username.getString("MatKhau"));
				account[0] = username;
				account[1] = password;
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
