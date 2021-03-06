package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.bean.TAIKHOAN;

public class AdminCreateDAO {
	
	/** Attribute and Object */
	DataBaseDAO db = new DataBaseDAO();
	public String errorExist;

	/** Check account exist */
	/* Check username and email of user */
	public boolean isAccexist(String username,String email) {
		/* Select from database */
		
		username = DinhDangSQL.FomatSQL(username);
		email = DinhDangSQL.FomatSQL(email);
		
		String sql_select_username = "SELECT TenTaiKhoan FROM taikhoan WHERE (TenTaiKhoan='"
				+ username + "' OR Email ='"+email+"') AND CoXoa = 0";
		ResultSet resultsetOfselect = db.getResultSet(sql_select_username);
		try {
			if (resultsetOfselect.next()) {
				/* User exist in the system */
				errorExist = "Tài khoản đã tồn tại - アカウントが既に存在された。";
				return true;
			} else {
				/* User not exist in the system */
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			errorExist = "Lỗi: truy cập cơ sở dữ liệu - サーバにデータベースのエラーが発生した";
			return true;
		}
	}
	
	
	/**
	 * add method: checkStatusAcc
	 * date: 05 - 12 - 2015
	 * check account inserted into database: 
	 * 		if account deleted and status of account is ban ->return true
	 * 			then can't created account 
	 *		else created account success ->return false
	 * */
	public boolean checkStatusAcc(String email){
		email = DinhDangSQL.FomatSQL(email);
		String sql_check = "SELECT IdTaiKhoan "
							+ "FROM taikhoan "
							+ "WHERE Email = '"+email+"' AND TinhTrang = 'KhoaTK'";
		ResultSet result_check = db.getResultSet(sql_check);
		try {
			while (result_check.next()){
				 return true;
			}
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	/** Get id of account last */
	public String getId_Acc_last() {
		String id_Account_last = null;
		String sql_select_id_account = "SELECT * FROM taikhoan order by IdTaiKhoan desc";
		ResultSet resultset_id_account = db.getResultSet(sql_select_id_account);
		try {
			resultset_id_account.next();
			id_Account_last = resultset_id_account.getString("IdTaiKhoan");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id_Account_last;
	}

	/** Insert data into table in database */
	public boolean insertAccount(TAIKHOAN account) {	
		account.setHoTen(DinhDangSQL.FomatSQL(account.getHoTen()));
		account.setDiaChi(DinhDangSQL.FomatSQL(account.getDiaChi()));
		account.setDienThoai(DinhDangSQL.FomatSQL(account.getDienThoai()));
		account.setEmail(DinhDangSQL.FomatSQL(account.getEmail()));
		account.setTenTaiKhoan(DinhDangSQL.FomatSQL(account.getTenTaiKhoan()));
		account.setMatKhau(Utils.Utils.encryptMD5(DinhDangSQL.FomatSQL(account.getMatKhau())));
		String sql_insert_account = "INSERT INTO taikhoan(IdTaiKhoan,TenTaiKhoan,MatKhau,HoTen,DiaChi,DienThoai,Email,QuyenQuanTri,CoXoa,NgonNgu,TinhTrang) VALUES('"
				+ account.getIdTaiKhoan() + "','" + account.getTenTaiKhoan()
				+ "','" + account.getMatKhau() + "',N'" + account.getHoTen()
				+ "',N'" + account.getDiaChi() + "','" + account.getDienThoai()
				+ "','" + account.getEmail() + "','"+account.getQuyenQuanTri()+"','0',N'"+account.getNgonNgu()+"',N'"+account.getTinhTrang()+"')";
		return db.updateData(sql_insert_account);
	}

	public void closeConnection() {
		db.closeConnection();
	}	

}
