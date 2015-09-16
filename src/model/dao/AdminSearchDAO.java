package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.bean.TAIKHOAN;

public class AdminSearchDAO {

	DataBaseDAO db = new DataBaseDAO();

	public TAIKHOAN[] searchAccount(String typeFind, String stringFind) {
		
		typeFind = DinhDangSQL.FomatSQL(typeFind);
		stringFind = DinhDangSQL.FomatSQL(stringFind);
		int numberOfAcc = 0;
		int i = 0;
		String sql_count_account = "SELECT COUNT(*) AS NUMBER_OF_ACC FROM taikhoan WHERE "
				+ typeFind + "='" + stringFind + "' AND CoXoa = 0";
		System.out.println("sql_count_account: "+sql_count_account);
		ResultSet result_count = db.getResultSet(sql_count_account);
		try {
			while (result_count.next()) {
				numberOfAcc = result_count.getInt("NUMBER_OF_ACC");
			}
			if(numberOfAcc==0) return null;
			TAIKHOAN[] account = new TAIKHOAN[numberOfAcc];
		System.out.println("numberOfAcc: "+numberOfAcc);
			String sql_select_account = "SELECT * FROM TAIKHOAN WHERE "
					+ typeFind + "='" + stringFind + "' AND CoXoa = 0";
			System.out.println("sql_select_account: "+sql_select_account);
		ResultSet result_select = db.getResultSet(sql_select_account);		
		while (result_select.next())
		{
			account[i] = new TAIKHOAN();
			account[i].setIdTaiKhoan(DinhDangSQL.DeFomatSQL(result_select.getString("IdTaiKhoan")));
			account[i].setTenTaiKhoan(DinhDangSQL.DeFomatSQL(result_select.getString("TenTaiKhoan")));
			account[i].setHoTen(DinhDangSQL.DeFomatSQL(result_select.getString("HoTen")));
			account[i].setDiaChi(DinhDangSQL.DeFomatSQL(result_select.getString("DiaChi")));
			account[i].setDienThoai(DinhDangSQL.DeFomatSQL(result_select.getString("DienThoai")));
			account[i].setEmail(DinhDangSQL.DeFomatSQL(result_select.getString("Email")));
			account[i].setQuyenQuanTri(DinhDangSQL.DeFomatSQL(result_select.getString("QuyenQuanTri")));
			i++;
			
		}
		
		return account;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
}
