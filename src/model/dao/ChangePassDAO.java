package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ChangePassDAO {
	DataBaseDAO db = new DataBaseDAO();
	
	/**Check password exist*/
	public boolean checkPassExist(String password)
	{
		password = DinhDangSQL.FomatSQL(password);
		String sql_select_pass = "SELECT MatKhau FROM taikhoan WHERE MatKhau='"+password+"'";
		
		ResultSet result_select = db.getResultSet(sql_select_pass);
		try {
			if(result_select.next())//Password exist
			{
				return true;
			}
			else//Password not exist
			{
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	
	/**Update password*/
	public boolean updatePass(String password_new,String username)
	{
		String sql_update_pass = "UPDATE taikhoan SET MatKhau ='"+password_new+"' WHERE TenTaiKhoan = '"+username+"' ";
		return db.updateData(sql_update_pass);
	}


	public void closeConnection() {
		db.closeConnection();
	}

}
