package model.dao;

public class AdminDeleteDAO {
	DataBaseDAO db = new DataBaseDAO();
	
	/**Delete Account*/
	public boolean deleteAccount(String username)
	{
		username = DinhDangSQL.FomatSQL(username);
		String sql_update_account = "UPDATE taikhoan SET CoXoa = 1 WHERE TenTaiKhoan = '"+username+"'";
		return db.updateData(sql_update_account);
	}

	public void closeConnection() {
		db.closeConnection();
	}

}
