package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import controller.RandomPassword;
import model.bean.TAIKHOAN;

public class TaiKhoanDAO {

	DataBaseDAO db = new DataBaseDAO();

	public boolean chekOk(String username, String password) {
		// Kiểm tra tồn tại của user
		username = DinhDangSQL.FomatSQL(username);
		password = DinhDangSQL.FomatSQL(password);
		String sql = "";
		if (password.equals("")) {
			sql = "select * from taikhoan where TenTaiKhoan=N'" + username + "'";
		} else {
			password = Utils.Utils.encryptMD5(password);
			sql = "select * from taikhoan where TenTaiKhoan=N'" + username
					+ "' and MatKhau=N'" + password + "'";
		}
		ResultSet rs = db.getResultSet(sql);
		try {
			if (rs.next())
				return true;
		} catch (SQLException e) {
			// Lỗi trả về sai
			e.printStackTrace();
			return false;
		}
		return false;
	}

	public String checkValidChangePass(String username, String oldPassword, String newPassword, String passwordAgain) {
		String resultCheck = "true";
		if(!newPassword.equals(passwordAgain))
		{
			resultCheck = "Mật khẩu lặp lại phải giống mật khẩu mới - 再入力したパスワードは必ず新しいパスワードを一致しなければならない.";
			return resultCheck;
		}
		else if(oldPassword.equals("")||newPassword.equals("")||oldPassword == null || newPassword==null)
		{
			resultCheck = "Dữ liệu không hợp lệ.";
			return resultCheck;
		}
		else if(!chekOk(username, oldPassword))
		{
			resultCheck = "Nhập sai mật khẩu cũ! Vui lòng kiểm tra lại!<br>";
			return resultCheck;
		}
		return resultCheck;
	}
	
	public boolean chekOk(String username, String password, int x) {
		// Kiểm tra tồn tại của user
		username = DinhDangSQL.FomatSQL(username);
		password = DinhDangSQL.FomatSQL(password);
		String sql = "";
		if (password.equals("")) {
			if (x == 0)
				sql = "select * from taikhoan where TenTaiKhoan=N'" + username + "'";
			else if (x == 1)
				sql = "select * from taikhoan where TenTaiKhoan=N'" + username
						+ "' and (QuyenQuanTri=N'ctv' or QuyenQuanTri=N'admin')";
			else
				sql = "select * from taikhoan where TenTaiKhoan=N'" + username
						+ "' and QuyenQuanTri=N'admin'";
		} else {
			password = Utils.Utils.encryptMD5(password);
			if (x == 0)
				sql = "select * from taikhoan where TenTaiKhoan=N'" + username
						+ "' and MatKhau=N'" + password +"'";
			else if (x == 1)
				sql = "select * from taikhoan where TenTaiKhoan=N'" + username
						+ "' and MatKhau=N'" + password
						+ "' and (QuyenQuanTri=N'ctv' or QuyenQuanTri=N'admin')";
			else
				sql = "select * from taikhoan where TenTaiKhoan=N'" + username
						+ "' and QuyenQuanTri=N'admin'";
		}
		ResultSet rs = db.getResultSet(sql);
		try {
			if (rs.next())
				return true;
		} catch (SQLException e) {
			// Lỗi trả về sai
			e.printStackTrace();
			return false;
		}
		return false;
	}

	public boolean checkLoginWithFacebook(String facebookId) {
		// Kiểm tra tồn tại của user
		facebookId = DinhDangSQL.FomatSQL(facebookId);
		facebookId = Utils.Utils.encryptMD5(facebookId);
		String sql = "";
		sql = "select * from taikhoan where FacebookID='" + facebookId + "' and CoXoa=0";
		ResultSet rs = db.getResultSet(sql);
		try {
			if (rs.next())
				return true;
		} catch (SQLException e) {
			// Lỗi trả về sai
			e.printStackTrace();
			return false;
		}
		return false;
	}

	public void registerAccountWithFacebook(String tenTaiKhoan, String facebookId,
			String facebookLink, String hoten, String email, String password) {
		// TODO Auto-generated method stub
		facebookId = DinhDangSQL.FomatSQL(facebookId);
		facebookId = Utils.Utils.encryptMD5(facebookId);
		hoten = DinhDangSQL.FomatSQL(hoten);
		facebookLink = DinhDangSQL.FomatSQL(facebookLink);
		password = Utils.Utils.encryptMD5(password);
		email = DinhDangSQL.FomatSQL(email);
		String sql = "insert into taikhoan(IdTaiKhoan, TenTaiKhoan, QuyenQuanTri, HoTen, Email, CoXoa, TinhTrang, FacebookId, FacebookLink,EditFlag,MatKhau)"
				+ " values (N'"
				+ getIdTaiKhoanMax()
				+ "', N'"
				+ tenTaiKhoan
				+ "',N'user',"
				+ " N'"
				+ hoten
				+ "',"
				+ " N'"
				+ email
				+ "','0', N'MoiTao',N'"
				+ facebookId
				+ "','"
				+ facebookLink
				+ "','11',N'"+password+"')";
		db.updateData(sql);
	}
	
	public boolean checkLoginWithGoogle(String googleId) {
		// Kiểm tra tồn tại của user
		googleId = DinhDangSQL.FomatSQL(googleId);
		googleId = Utils.Utils.encryptMD5(googleId);
		String sql = "";
		sql = "select * from taikhoan where GoogleId='" + googleId + "' and CoXoa=0";
		ResultSet rs = db.getResultSet(sql);
		try {
			if (rs.next())
				return true;
		} catch (SQLException e) {
			// Lỗi trả về sai
			e.printStackTrace();
			return false;
		}
		return false;
	}
	
	public void registerAccountWithGoogle(String tenTaiKhoan, String googleId, String hoten, String email, String password, String googleLink) {
		// TODO Auto-generated method stub
		googleId = DinhDangSQL.FomatSQL(googleId);
		googleId = Utils.Utils.encryptMD5(googleId);
		password = Utils.Utils.encryptMD5(password);
		hoten = DinhDangSQL.FomatSQL(hoten);
		email = DinhDangSQL.FomatSQL(email);
		googleLink = DinhDangSQL.FomatSQL(googleLink);
		String sql = "insert into taikhoan(IdTaiKhoan, TenTaiKhoan, QuyenQuanTri, HoTen, Email, CoXoa, TinhTrang, GoogleId, EditFlag, MatKhau, GoogleLink)"
				+ " values (N'"
				+ getIdTaiKhoanMax()
				+ "', N'"
				+ tenTaiKhoan
				+ "',N'user',"
				+ " N'"
				+ hoten
				+ "',"
				+ " N'"
				+ email
				+ "','0', N'MoiTao',N'"
				+ googleId
				+ "','10',N'"+password+"',N'"+googleLink+"')";
		db.updateData(sql);
	}

	public boolean updateAccountByEmail(TAIKHOAN user) {
		// TODO Auto-generated method stub
		String sql = "update taikhoan set FacebookId=N'" + Utils.Utils.encryptMD5(user.getFacebookID())
				+ "', FacebookLink=N'" + user.getFacebookLink()
				+ "' where Email='" + user.getEmail() + "'";
		return db.updateData(sql);
	}
	
	public boolean updateAccountByEmailGoogle(TAIKHOAN user) {
		// TODO Auto-generated method stub
		String sql = "update taikhoan set GoogleId=N'" + Utils.Utils.encryptMD5(user.getGoogleID())
				+ "', GoogleLink=N'" + user.getGoogleLink()
				+ "' where Email='" + user.getEmail() + "'";
		return db.updateData(sql);
	}
	public boolean updatePasswordMd5(String idTaiKhoan, String password) {
		password = Utils.Utils.encryptMD5(password);
		String sql = "update taikhoan set MatKhau=N'" + password
				+ "' where IdTaiKhoan='" + idTaiKhoan + "'";
		return db.updateData(sql);
	}
	public boolean updateMd5Code() {
		ResultSet rs = null;
		rs = db.getResultSet("select * from taikhoan");
		TAIKHOAN taikhoan = null;
		ArrayList<TAIKHOAN> arrAccount = new ArrayList<TAIKHOAN>();
		try {
			while (rs.next()) {
				taikhoan = new TAIKHOAN();
				taikhoan.setIdTaiKhoan(DinhDangSQL.DeFomatSQL(rs
						.getString("IdTaiKhoan")));
				taikhoan.setMatKhau(DinhDangSQL.DeFomatSQL(rs
						.getString("MatKhau")));
				arrAccount.add(taikhoan);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		for(int i = 0; i < arrAccount.size(); i++)
		{
			if(!updatePassword(arrAccount.get(i).getIdTaiKhoan(), arrAccount.get(i).getMatKhau()))
				return false;
		
		}
		return true;
	}
	public TAIKHOAN getAccountByEmail(String email) {
		// lấy tài khoản thỏa mãn
		email = DinhDangSQL.FomatSQL(email);
		ResultSet rs = null;
		rs = db.getResultSet("select * from taikhoan where Email=N'" + email
				+ "'");
		TAIKHOAN taikhoan = null;
		try {
			if (rs.next()) {
				taikhoan = new TAIKHOAN(DinhDangSQL.DeFomatSQL(rs
						.getString("IdTaiKhoan")), DinhDangSQL.DeFomatSQL(rs
						.getString("TenTaiKhoan")), DinhDangSQL.DeFomatSQL(rs
						.getString("MatKhau")), DinhDangSQL.DeFomatSQL(rs
						.getString("HoTen")), DinhDangSQL.DeFomatSQL(rs
						.getString("DiaChi")), rs.getString("DienThoai"),
						DinhDangSQL.DeFomatSQL(rs.getString("Email")),
						DinhDangSQL.DeFomatSQL(rs.getString("QuyenQuanTri")));
				taikhoan.setNgonNgu(DinhDangSQL.DeFomatSQL(rs
						.getString("NgonNgu")));
				taikhoan.setEditFlag(DinhDangSQL.DeFomatSQL(rs
						.getString("EditFlag")));
				taikhoan.setFacebookLink(DinhDangSQL.DeFomatSQL(rs
						.getString("FacebookLink")));
				taikhoan.setGoogleLink(DinhDangSQL.DeFomatSQL(rs
						.getString("GoogleLink")));
				return taikhoan;
			}
		} catch (SQLException e) {
			// Lỗi trả về sai
			e.printStackTrace();
			return taikhoan;
		}
		return taikhoan;
	}
	public TAIKHOAN getAccountByIdSocial(String type, String idFind) {
		// lấy tài khoản thỏa mãn
		idFind = DinhDangSQL.FomatSQL(idFind);
		idFind = Utils.Utils.encryptMD5(idFind);
		ResultSet rs = null;
		if(type.trim().equals("google"))
			rs = db.getResultSet("select * from taikhoan where GoogleId=N'" + idFind
				+ "'");
		else
			rs = db.getResultSet("select * from taikhoan where FacebookId=N'" + idFind
				+ "'");
		TAIKHOAN taikhoan = null;
		try {
			if (rs.next()) {
				taikhoan = new TAIKHOAN(DinhDangSQL.DeFomatSQL(rs
						.getString("IdTaiKhoan")), DinhDangSQL.DeFomatSQL(rs
								.getString("TenTaiKhoan")), DinhDangSQL.DeFomatSQL(rs
										.getString("MatKhau")), DinhDangSQL.DeFomatSQL(rs
												.getString("HoTen")), DinhDangSQL.DeFomatSQL(rs
														.getString("DiaChi")), rs.getString("DienThoai"),
														DinhDangSQL.DeFomatSQL(rs.getString("Email")),
														DinhDangSQL.DeFomatSQL(rs.getString("QuyenQuanTri")));
				taikhoan.setNgonNgu(DinhDangSQL.DeFomatSQL(rs
						.getString("NgonNgu")));
				taikhoan.setEditFlag(DinhDangSQL.DeFomatSQL(rs
						.getString("EditFlag")));
				taikhoan.setFacebookLink(DinhDangSQL.DeFomatSQL(rs
						.getString("FacebookLink")));
				taikhoan.setGoogleLink(DinhDangSQL.DeFomatSQL(rs
						.getString("GoogleLink")));
				return taikhoan;
			}
		} catch (SQLException e) {
			// Lỗi trả về sai
			e.printStackTrace();
			return taikhoan;
		}
		return taikhoan;
	}

	public TAIKHOAN getAccountEmailorUserName(String guiden) {
		// lấy tài khoản thỏa mãn
		guiden = DinhDangSQL.FomatSQL(guiden);
		ResultSet rs = null;
		rs = db.getResultSet("select * from taikhoan where Email=N'" + guiden + "' or TenTaiKhoan=N'" + guiden
				+ "'");
		TAIKHOAN taikhoan = null;
		try {
			if (rs.next()) {
				taikhoan = new TAIKHOAN(DinhDangSQL.DeFomatSQL(rs
						.getString("IdTaiKhoan")), DinhDangSQL.DeFomatSQL(rs
						.getString("TenTaiKhoan")), DinhDangSQL.DeFomatSQL(rs
						.getString("MatKhau")), DinhDangSQL.DeFomatSQL(rs
						.getString("HoTen")), DinhDangSQL.DeFomatSQL(rs
						.getString("DiaChi")), rs.getString("DienThoai"),
						DinhDangSQL.DeFomatSQL(rs.getString("Email")),
						DinhDangSQL.DeFomatSQL(rs.getString("QuyenQuanTri")));
				taikhoan.setNgonNgu(DinhDangSQL.DeFomatSQL(rs
						.getString("NgonNgu")));
				taikhoan.setEditFlag(DinhDangSQL.DeFomatSQL(rs
						.getString("EditFlag")));
				taikhoan.setFacebookLink(DinhDangSQL.DeFomatSQL(rs
						.getString("FacebookLink")));
				taikhoan.setGoogleLink(DinhDangSQL.DeFomatSQL(rs
						.getString("GoogleLink")));
				return taikhoan;
			}
		} catch (SQLException e) {
			// Lỗi trả về sai
			e.printStackTrace();
			return taikhoan;
		}
		return taikhoan;
	}
	
	public boolean chekEmail(String email) {
		// Kiểm tra tồn tại của user
		email = DinhDangSQL.FomatSQL(email);

		ResultSet rs = db.getResultSet("select * from taikhoan where Email=N'"
				+ email + "'");
		try {
			if (rs.next())
				return true;
		} catch (SQLException e) {
			// Lỗi trả về sai
			e.printStackTrace();
			return false;
		}
		return false;
	}

	public TAIKHOAN getTaiKhoan(String username, String password) {
		// lấy tài khoản thỏa mãn
		username = DinhDangSQL.FomatSQL(username);
		password = DinhDangSQL.FomatSQL(password);
		ResultSet rs = null;
		if (password.equals("reset")) {
			rs = db.getResultSet("select * from taikhoan where TenTaiKhoan=N'"
					+ username + "'");
		} else {
			password = Utils.Utils.encryptMD5(password);
			rs = db.getResultSet("select * from taikhoan where TenTaiKhoan=N'"
					+ username + "' and MatKhau=N'" + password + "' and CoXoa=0");
		}
		TAIKHOAN taikhoan = null;
		try {
			if (rs.next()) {
				taikhoan = new TAIKHOAN(DinhDangSQL.DeFomatSQL(rs
						.getString("IdTaiKhoan")), DinhDangSQL.DeFomatSQL(rs
						.getString("TenTaiKhoan")), "", DinhDangSQL.DeFomatSQL(rs
						.getString("HoTen")), DinhDangSQL.DeFomatSQL(rs
						.getString("DiaChi")), rs.getString("DienThoai"),
						DinhDangSQL.DeFomatSQL(rs.getString("Email")),
						DinhDangSQL.DeFomatSQL(rs.getString("QuyenQuanTri")));
				taikhoan.setNgonNgu(DinhDangSQL.DeFomatSQL(rs
						.getString("NgonNgu")));
				taikhoan.setEditFlag(DinhDangSQL.DeFomatSQL(rs
						.getString("EditFlag")));
				taikhoan.setFacebookLink(DinhDangSQL.DeFomatSQL(rs
						.getString("FacebookLink")));
				taikhoan.setGoogleLink(DinhDangSQL.DeFomatSQL(rs
						.getString("GoogleLink")));
				return taikhoan;
			}
		} catch (SQLException e) {
			// Lỗi trả về sai
			e.printStackTrace();
			return taikhoan;
		}
		return taikhoan;
	}

	public boolean UpdateThongTin(TAIKHOAN user) {
		// TODO Auto-generated method stub
		user.setMatKhau(Utils.Utils.encryptMD5(user.getMatKhau()));
		String sql = "update taikhoan set TenTaiKhoan=N'"
				+ DinhDangSQL.FomatSQL(user.getTenTaiKhoan()) + "', DiaChi=N'"
				+ DinhDangSQL.FomatSQL(user.getDiaChi()) + "', HoTen=N'"
				+ DinhDangSQL.FomatSQL(user.getHoTen()) + "', DienThoai='"
				+ DinhDangSQL.FomatSQL(user.getDienThoai()) + "', Email=N'"
				+ DinhDangSQL.FomatSQL(user.getEmail())+ "', EditFlag='"
				+ DinhDangSQL.FomatSQL(user.getEditFlag())
				+ "' where IdTaiKhoan=N'"
				+ DinhDangSQL.FomatSQL(user.getIdTaiKhoan()) + "'";
		return db.updateData(sql);
	}
	public boolean updateUsername(String oldUsername, String newUsername) {
		// TODO Auto-generated method stub
		String sql = "update thongbao set GuiDen=N'"
				+ DinhDangSQL.FomatSQL(newUsername)
				+ "' where GuiDen=N'"
				+ DinhDangSQL.FomatSQL(oldUsername) + "'";
		return db.updateData(sql);
	}
	public boolean updatePassword(String idTaiKhoan, String password) {
		// TODO Auto-generated method stub
		if(password == null || password.trim().equals("")){
			password = RandomPassword.password(8);
		}
		password = Utils.Utils.encryptMD5(password);
		String sql = "update taikhoan set MatKhau=N'"
				+ DinhDangSQL.FomatSQL(password)
				+ "' where IdTaiKhoan=N'"
				+ DinhDangSQL.FomatSQL(idTaiKhoan) + "'";
		return db.updateData(sql);
	}
	public boolean updateEmail(String oldEmail, String newEmail) {
		// TODO Auto-generated method stub
		String sql = "update lienhe set email=N'"
				+ DinhDangSQL.FomatSQL(oldEmail)
				+ "' where email=N'"
				+ DinhDangSQL.FomatSQL(newEmail) + "'";
		return db.updateData(sql);
	}

	public void addTaiKhoan(String taikhoan, String matkhau, String hoten,
			String diachi, String dienthoai, String email, String ngonngu) {
		// TODO Auto-generated method stub
		taikhoan = DinhDangSQL.FomatSQL(taikhoan);
		matkhau = DinhDangSQL.FomatSQL(matkhau);
		matkhau = Utils.Utils.encryptMD5(matkhau);
		hoten = DinhDangSQL.FomatSQL(hoten);
		diachi = DinhDangSQL.FomatSQL(diachi);
		dienthoai = DinhDangSQL.FomatSQL(dienthoai);
		email = DinhDangSQL.FomatSQL(email);
		ngonngu = DinhDangSQL.FomatSQL(email);
		String sql = "insert into taikhoan(IdTaiKhoan, TenTaiKhoan, MatKhau, QuyenQuanTri, HoTen, DiaChi, DienThoai, Email, NgonNgu, CoXoa, TinhTrang,EditFlag)"
				+ " values (N'"
				+ getIdTaiKhoanMax()
				+ "', N'"
				+ taikhoan
				+ "', N'"
				+ matkhau
				+ "',N'user',"
				+ " N'"
				+ hoten
				+ "', N'"
				+ diachi
				+ "', '"
				+ dienthoai
				+ "',"
				+ " N'"
				+ email
				+ "', N'"
				+ ngonngu + "', '0', N'MoiTao','00')";
		db.updateData(sql);
	}

	public String getIdTaiKhoanMax() {
		String id = "TK00000000";
		ResultSet rs = db
				.getResultSet("select IdTaiKhoan from taikhoan order by IdTaiKhoan desc limit 1");
		try {
			if (rs.next()) {
				int tam = Integer.parseInt(rs.getString(1).substring(2)) + 1;
				if (tam <= 99999999)
					id = id.substring(0, 10 - (tam + "").length()) + tam;
				else
					id = "TK" + tam;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}

	public void closeConnection() {
		db.closeConnection();
	}

	public boolean kiemTraTonTai(String tk) {
		// TODO Auto-generated method stub
		String sql = "select * from taikhoan where TenTaiKhoan='" + tk
				+ "' or email = '" + tk + "' or email like '" + tk + "@%'";
		ResultSet rs = db.getResultSet(sql);
		try {
			return rs.next();
		} catch (SQLException e) {
			return false;
		}
	}
}
