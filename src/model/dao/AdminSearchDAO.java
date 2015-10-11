package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.TAIKHOAN;

public class AdminSearchDAO {

	DataBaseDAO db = new DataBaseDAO();

	public ArrayList<TAIKHOAN> searchAccount(String typeFind, String stringFind,int page,String type) {
		
		typeFind = DinhDangSQL.FomatSQL(typeFind);
		stringFind = DinhDangSQL.FomatSQL(stringFind);
		
			ArrayList<TAIKHOAN> accounts = new ArrayList<TAIKHOAN>();
			String sql_select_account;
			if(type.equals("CTV")){
				sql_select_account = "SELECT IdTaiKhoan,TenTaiKhoan,HoTen,DiaChi,DienThoai,Email,QuyenQuanTri,NgonNgu,TinhTrang from taikhoan WHERE "+typeFind+" LIKE '%"+stringFind+"%' AND  CoXoa = 0 AND QuyenQuanTri == 'CTV' ORDER BY IdTaiKhoan DESC";
			}
			else{
				sql_select_account = "SELECT IdTaiKhoan,TenTaiKhoan,HoTen,DiaChi,DienThoai,Email,QuyenQuanTri,NgonNgu,TinhTrang from taikhoan WHERE "+typeFind+" LIKE '%"+stringFind+"%' AND  CoXoa = 0 AND QuyenQuanTri != 'CTV' ORDER BY IdTaiKhoan DESC";
			}
			db.createMenu("AdminSearchSevlet?typeFind="+typeFind+"&stringFind="+stringFind+"&btnFind=Find&", page, sql_select_account);
			System.out.println("result_select: "+sql_select_account + " limit "
					+ (page - 1) * db.getNBangGhi() + ","
					+ db.getNBangGhi());
			ResultSet result_select =  db.getResultSet(sql_select_account + " limit "
				+ (page - 1) * db.getNBangGhi() + ","
				+ db.getNBangGhi());	
			
		try {
			while(result_select.next())
			{
				TAIKHOAN account = new TAIKHOAN();
				account = new TAIKHOAN();
				account.setIdTaiKhoan(DinhDangSQL.DeFomatSQL(result_select.getString("IdTaiKhoan")));
				account.setTenTaiKhoan(DinhDangSQL.DeFomatSQL(result_select.getString("TenTaiKhoan")));				
				account.setHoTen(DinhDangSQL.DeFomatSQL(result_select.getString("HoTen")));				
				account.setDiaChi(DinhDangSQL.DeFomatSQL(result_select.getString("DiaChi")));
				account.setDienThoai(DinhDangSQL.DeFomatSQL(result_select.getString("DienThoai")));
				account.setEmail(DinhDangSQL.DeFomatSQL(result_select.getString("Email")));
				account.setQuyenQuanTri(DinhDangSQL.DeFomatSQL(result_select.getString("QuyenQuanTri")));
				account.setNgonNgu(DinhDangSQL.DeFomatSQL(result_select.getString("NgonNgu")));
				account.setTinhTrang(DinhDangSQL.DeFomatSQL(result_select.getString("TinhTrang")));
				accounts.add(account);
			}
			return accounts;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	public String getMenuPhanTrang(){
		return db.getMenuPhanTrang();
	}
	
	public void setMenu(int nBangghi, int ntrang){
		db.setMenu(nBangghi, ntrang);
	}
	public void closeConnection() {
		db.closeConnection();
	}
	
}
