package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;


import java.util.ArrayList;

import model.bean.TAIKHOAN;

public class ListAccountDAO {
	DataBaseDAO db = new DataBaseDAO();	
	public ArrayList<TAIKHOAN> getDataAcountInfor(int start,int limit,String status,String language)	
	{
		String sql_select_account = null;
		//Lấy các tài khoản CTV
		if(status.equals("CTV")){
			//Lấy cộng tác viên dịch bài viết có ngôn ngữ cố định
			if(!language.contains("mutilanguage")){
				sql_select_account = "SELECT IdTaiKhoan,"
										+ "TenTaiKhoan,"
										+ "MatKhau,"
										+ "HoTen,"
										+ "DiaChi,"
										+ "DienThoai,"
										+ "Email,"
										+ "QuyenQuanTri,"
										+ "NgonNgu,"
										+ "TinhTrang "
										+ "FROM taikhoan "
										+ "WHERE CoXoa = 0 AND QuyenQuanTri = 'ctv' AND NgonNgu = '"+language+"'"
										+ "limit "+start+","+limit+"";
			}
			//Lấy tất cả các cộng tác viên khi bài viết đó là song ngữ
			else{
				sql_select_account = "SELECT IdTaiKhoan,"
						+ "TenTaiKhoan,"
						+ "MatKhau,"
						+ "HoTen,"
						+ "DiaChi,"
						+ "DienThoai,"
						+ "Email,"
						+ "QuyenQuanTri,"
						+ "NgonNgu,"
						+ "TinhTrang"
						+ " FROM taikhoan "  
						+ "WHERE CoXoa = 0 AND QuyenQuanTri = 'ctv'"
						+ " limit "+start+","+limit+"";
			}
			
		}
		//Lấy tất cả tài khoản
		else{
			sql_select_account = "SELECT * FROM taikhoan WHERE CoXoa = 0 AND QuyenQuanTri != 'ctv' limit "+start+","+limit+"";
		}
		ResultSet result_select = db.getResultSet(sql_select_account);
		ArrayList<TAIKHOAN> accounts = new ArrayList<TAIKHOAN>();
		try {
			while(result_select.next())
			{
				TAIKHOAN account = new TAIKHOAN();
				account = new TAIKHOAN();
				account.setIdTaiKhoan(DinhDangSQL.DeFomatSQL(result_select.getString("IdTaiKhoan")));
				account.setTenTaiKhoan(DinhDangSQL.DeFomatSQL(result_select.getString("TenTaiKhoan")));
				account.setMatKhau(DinhDangSQL.DeFomatSQL(result_select.getString("MatKhau")));
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
	
	public int totalRecord(String status){
		int number_of_account = 0;
		String sql_count_account = null;
		if(status.equals("CTV")){
			sql_count_account = "SELECT COUNT(*) NUMBER_OF_RECORDS FROM taikhoan WHERE CoXoa = 0 AND QuyenQuanTri = 'CTV'";
		}
		else{
		/**Count total number of account*/
		sql_count_account = "SELECT COUNT(*) NUMBER_OF_RECORDS FROM taikhoan WHERE CoXoa = 0";}
		
		if(sql_count_account == null) return 0;
		ResultSet result_count = db.getResultSet(sql_count_account);
		try {
			while(result_count.next())
			{
				number_of_account = result_count.getInt("NUMBER_OF_RECORDS");
			}
			return number_of_account;
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			return 0;
		}
	}
	public String getMenuPhanTrang(){
		return db.getMenuPhanTrang();
	}
	
	public void setMenu(int nBangghi, int ntrang){
		db.setMenu(nBangghi, ntrang);
	}

	public ArrayList<TAIKHOAN> getDataAcountInfor(int page) {
		// TODO Auto-generated method stub
		
		
		int i = 0;
		String sql_select_account = "SELECT * FROM taikhoan WHERE CoXoa = 0 AND QuyenQuanTri != 'ctv' ORDER BY IdTaiKhoan DESC";
		
		//Tạo menu phân trang Url, page, sql
		ResultSet result_select;
		if(page==-1){
			System.out.println("không có trang");
			System.out.println("sql_select_account: "+sql_select_account);
			result_select = db.getResultSet(sql_select_account);
		}
		else{
			db.createMenu("ListAccountServlet?", page, sql_select_account);
			System.out.println("có trang");
			System.out.println("sql_select_account: "+sql_select_account  + " limit " + (page-1)*db.getNBangGhi() +","+ db.getNBangGhi());
			result_select = db.getResultSet(sql_select_account  + " limit " + (page-1)*db.getNBangGhi() +","+ db.getNBangGhi());
		}
		ArrayList<TAIKHOAN> accounts = new ArrayList<TAIKHOAN>();
		try {
			while(result_select.next())
			{
				TAIKHOAN account = new TAIKHOAN();				
				account.setIdTaiKhoan(DinhDangSQL.DeFomatSQL(result_select.getString("IdTaiKhoan")));
				account.setTenTaiKhoan(DinhDangSQL.DeFomatSQL(result_select.getString("TenTaiKhoan")));
				account.setMatKhau(DinhDangSQL.DeFomatSQL(result_select.getString("MatKhau")));
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
	
	
	//Lấy trạng thái của tài khoản
	public String getStatusAccount(String idAccount){
		String sql_getStatusAccount = "SELECT TinhTrang FROM taikhoan WHERE IdTaiKhoan = '"+idAccount+"' AND CoXoa = 0 ";		
		ResultSet result_getStatusAccount = db.getResultSet(sql_getStatusAccount);
		String statusAccount = null;
		try {
			while(result_getStatusAccount.next()){
				statusAccount = result_getStatusAccount.getString("TinhTrang");
			}
			return statusAccount;
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
