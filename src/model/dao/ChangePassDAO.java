package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ChangePassDAO {
	MySQLConnector db = new MySQLConnector();
	
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
	public boolean updatePass(String password_new,String password)
	{
		String sql_update_pass = "UPDATE taikhoan SET MatKhau ='"+password_new+"' WHERE MatKhau ='"+password+"' ";
		return db.updateData(sql_update_pass);
	}

}
