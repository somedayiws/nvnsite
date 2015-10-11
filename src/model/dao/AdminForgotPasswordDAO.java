package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminForgotPasswordDAO {
	DataBaseDAO db = new DataBaseDAO();
	/**Check email exist*/
	public boolean checkEmail(String email){
		System.out.println("Email: "+email);
		String sql_select_email = "SELECT Email FROM taikhoan WHERE Email ='"+email+"' AND QuyenQuanTri = 'admin'";
		ResultSet result_select_email = db.getResultSet(sql_select_email);
		
		try {
			while(result_select_email.next()){
				System.out.println("Email: "+result_select_email.getString("Email"));
				//Email exist in system
				return true;
			}
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	/**Update password*/
	public boolean updatePassword(String password,String email){
		String sql_update_password = "UPDATE taikhoan SET MatKhau = '"+password+"' WHERE Email ='"+email+"'";
		return db.updateData(sql_update_password);
	}

	public void closeConnection() {
		db.closeConnection();
	}

}
