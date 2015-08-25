package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.TAIKHOAN;

public class ListAccountDAO {
	MySQLConnector db = new MySQLConnector();	
	public TAIKHOAN[] getDataAcountInfor()	
	{
		int number_of_account = 0;
		/**Count total number of account*/
		String sql_count_account = "SELECT COUNT(*) NUMBER_OF_RECORDS FROM taikhoan WHERE CoXoa = 0";
		ResultSet result_count = db.getResultSet(sql_count_account);
		try {
			while(result_count.next())
			{
				number_of_account = result_count.getInt("NUMBER_OF_RECORDS");
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("number_of_account: "+number_of_account);
		if(number_of_account == 0)
		{
			return null;
		}
		/**Create array of account*/
		TAIKHOAN[] listAccount = new TAIKHOAN[number_of_account];
		
		int i = 0;
		String sql_select_account = "SELECT * FROM taikhoan WHERE CoXoa = 0";
		ResultSet result_select = db.getResultSet(sql_select_account);
		try {
			while(result_select.next())
			{
				listAccount[i] = new TAIKHOAN();
				listAccount[i].setIdTaiKhoan(DinhDangSQL.DeFomatSQL(result_select.getString("IdTaiKhoan")));
				listAccount[i].setTenTaiKhoan(DinhDangSQL.DeFomatSQL(result_select.getString("TenTaiKhoan")));
				listAccount[i].setMatKhau(DinhDangSQL.DeFomatSQL(result_select.getString("MatKhau")));
				listAccount[i].setHoTen(DinhDangSQL.DeFomatSQL(result_select.getString("HoTen")));				
				listAccount[i].setDiaChi(DinhDangSQL.DeFomatSQL(result_select.getString("DiaChi")));
				listAccount[i].setDienThoai(DinhDangSQL.DeFomatSQL(result_select.getString("DienThoai")));
				listAccount[i].setEmail(DinhDangSQL.DeFomatSQL(result_select.getString("Email")));
				listAccount[i].setQuyenQuanTri(DinhDangSQL.DeFomatSQL(result_select.getString("QuyenQuanTri")));
				listAccount[i].setNgonNgu(DinhDangSQL.DeFomatSQL(result_select.getString("NgonNgu")));
				listAccount[i].setTinhTrang(DinhDangSQL.DeFomatSQL(result_select.getString("TinhTrang")));
				i++;
			}
			return listAccount;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public TAIKHOAN getAccountbyId(String IdAccount){
		TAIKHOAN accountById = new TAIKHOAN();
		ResultSet result_select_AccountById  = null;
		String sql_select_AccountById = "SELECT * FROM taikhoan WHERE IdTaiKhoan ='"+IdAccount+"' AND CoXoa = 0 ";
		result_select_AccountById = db.getResultSet(sql_select_AccountById);
		try {
			while(result_select_AccountById.next()){
				accountById.setIdTaiKhoan(IdAccount);
				accountById.setTenTaiKhoan(DinhDangSQL.DeFomatSQL(result_select_AccountById.getString("TenTaiKhoan")));
				accountById.setMatKhau(DinhDangSQL.DeFomatSQL(result_select_AccountById.getString("MatKhau")));
				accountById.setHoTen(DinhDangSQL.DeFomatSQL(result_select_AccountById.getString("HoTen")));				
				accountById.setDiaChi(DinhDangSQL.DeFomatSQL(result_select_AccountById.getString("DiaChi")));
				accountById.setDienThoai(DinhDangSQL.DeFomatSQL(result_select_AccountById.getString("DienThoai")));
				accountById.setEmail(DinhDangSQL.DeFomatSQL(result_select_AccountById.getString("Email")));
				accountById.setQuyenQuanTri(DinhDangSQL.DeFomatSQL(result_select_AccountById.getString("QuyenQuanTri")));
				accountById.setNgonNgu(DinhDangSQL.DeFomatSQL(result_select_AccountById.getString("NgonNgu")));
				accountById.setTinhTrang(DinhDangSQL.DeFomatSQL(result_select_AccountById.getString("TinhTrang")));
			}
			return accountById;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public TAIKHOAN getAccountbyUser(String username){
		TAIKHOAN accountByUser = new TAIKHOAN();
		ResultSet result_select_AccountByUser  = null;
		String sql_select_AccountByUser = "SELECT * FROM taikhoan WHERE TenTaiKhoan ='"+username+"' AND CoXoa = 0 ";
		result_select_AccountByUser = db.getResultSet(sql_select_AccountByUser);
		try {
			while(result_select_AccountByUser.next()){
				accountByUser.setIdTaiKhoan(result_select_AccountByUser.getString("IdTaiKhoan"));
				
				accountByUser.setMatKhau(DinhDangSQL.DeFomatSQL(result_select_AccountByUser.getString("MatKhau")));
				accountByUser.setHoTen(DinhDangSQL.DeFomatSQL(result_select_AccountByUser.getString("HoTen")));				
				accountByUser.setDiaChi(DinhDangSQL.DeFomatSQL(result_select_AccountByUser.getString("DiaChi")));
				accountByUser.setDienThoai(DinhDangSQL.DeFomatSQL(result_select_AccountByUser.getString("DienThoai")));
				accountByUser.setEmail(DinhDangSQL.DeFomatSQL(result_select_AccountByUser.getString("Email")));
				accountByUser.setQuyenQuanTri(DinhDangSQL.DeFomatSQL(result_select_AccountByUser.getString("QuyenQuanTri")));
				accountByUser.setNgonNgu(DinhDangSQL.DeFomatSQL(result_select_AccountByUser.getString("NgonNgu")));
				accountByUser.setTinhTrang(DinhDangSQL.DeFomatSQL(result_select_AccountByUser.getString("TinhTrang")));
			}
			return accountByUser;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

}
