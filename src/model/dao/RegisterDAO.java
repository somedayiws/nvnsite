package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.bean.TAIKHOAN;

public class RegisterDAO {

	/** Attribute and Object */
	DataBaseDAO db = new DataBaseDAO();
	public String errorExist;

	/** Check account exist */
	/* Check username and email of user */
	public boolean isAccexist(String username,String email) {
		username = DinhDangSQL.FomatSQL(username);
		email = DinhDangSQL.FomatSQL(email);
		/* Select from database */
		String sql_select_username = "SELECT TenTaiKhoan FROM taikhoan WHERE TenTaiKhoan='"
				+ username + "' OR Email ='"+email+"' AND CoXoa = 0";
		ResultSet resultsetOfselect = db.getResultSet(sql_select_username);
		try {
			if (resultsetOfselect.next()) {
				/* User exist in the system */
				errorExist = "User already exists int the system";
				return true;
			} else {
				/* User not exist in the system */
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			errorExist = "Error: Access database";
			return true;
		}
	}

	/** Get id of account last */
	public String getId_Acc_last() {
		String id_Account_last = null;
		String sql_select_id_account = "SELECT * FROM taikhoan";
		ResultSet resultset_id_account = db.getResultSet(sql_select_id_account);
		try {
			resultset_id_account.last();
			id_Account_last = resultset_id_account.getString("IdTaiKhoan");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id_Account_last;
	}

	/** Insert data into table in database */
	public boolean insertAccount(TAIKHOAN account) {	
		
//		System.out.println("IdTaiKhoan: "+account.getIdTaiKhoan());
//		System.out.println("TenTaiKhoan: "+account.getTenTaiKhoan());
//		System.out.println("MatKhau: "+account.getMatKhau());
//		System.out.println("Name user:"+account.getHoTen());
//		System.out.println("DiaChi: "+account.getDiaChi());
//		System.out.println("DienThoai: "+account.getDienThoai());
//		System.out.println("Email: "+account.getEmail());
		
		account.setIdTaiKhoan(DinhDangSQL.FomatSQL(account.getIdTaiKhoan()));
		account.setTenTaiKhoan(DinhDangSQL.FomatSQL(account.getTenTaiKhoan()));
		account.setMatKhau(DinhDangSQL.FomatSQL(account.getMatKhau()));
		account.setHoTen(DinhDangSQL.FomatSQL(account.getHoTen()));
		account.setDiaChi(DinhDangSQL.FomatSQL(account.getDiaChi()));
		account.setDienThoai(DinhDangSQL.FomatSQL(account.getDienThoai()));
		account.setEmail(DinhDangSQL.FomatSQL(account.getEmail()));
		
		
		
		String sql_insert_account = "INSERT INTO taikhoan VALUES('"
				+ account.getIdTaiKhoan() + "','" + account.getTenTaiKhoan()
				+ "','" + account.getMatKhau() + "',N'" + account.getHoTen()
				+ "',N'" + account.getDiaChi() + "','" + account.getDienThoai()
				+ "','" + account.getEmail() + "','user','0')";
		return db.updateData(sql_insert_account);
	}

	public void closeConnection() {
		db.closeConnection();
	}	
}
