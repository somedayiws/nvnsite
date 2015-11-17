package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.bean.TAIKHOAN;

public class TaiKhoanDAO {

	DataBaseDAO db = new DataBaseDAO();

	public boolean chekOk(String username, String password) {
		// Kiểm tra tồn tại của user
		username = DinhDangSQL.FomatSQL(username);
		password = DinhDangSQL.FomatSQL(password);
		String sql = "";
		if (password.equals("")) {
			sql = "select * from taikhoan where TenTaiKhoan=N'" + username
					+ "' and QuyenQuanTri=N'user'";
		} else {
			sql = "select * from taikhoan where TenTaiKhoan=N'" + username
					+ "' and MatKhau=N'" + password
					+ "' and QuyenQuanTri=N'user'";
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

	public boolean chekOk(String username, String password, int x) {
		// Kiểm tra tồn tại của user
		username = DinhDangSQL.FomatSQL(username);
		password = DinhDangSQL.FomatSQL(password);
		String sql = "";
		if (password.equals("")) {
			if (x == 0)
				sql = "select * from taikhoan where TenTaiKhoan=N'" + username
						+ "' and QuyenQuanTri=N'user'";
			else if (x == 1)
				sql = "select * from taikhoan where TenTaiKhoan=N'" + username
						+ "' and QuyenQuanTri=N'ctv'";
			else
				sql = "select * from taikhoan where TenTaiKhoan=N'" + username
						+ "' and QuyenQuanTri=N'admin'";
		} else {
			if (x == 0)
				sql = "select * from taikhoan where TenTaiKhoan=N'" + username
						+ "' and MatKhau=N'" + password
						+ "' and QuyenQuanTri=N'user'";
			else if (x == 1)
				sql = "select * from taikhoan where TenTaiKhoan=N'" + username
						+ "' and MatKhau=N'" + password
						+ "' and QuyenQuanTri=N'ctv'";
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
		String sql = "";
		sql = "select * from taikhoan where FacebookID='" + facebookId + "'";
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

	public void registerAccountWithFacebook(String facebookId,
			String facebookLink, String hoten, String email) {
		// TODO Auto-generated method stub
		facebookId = DinhDangSQL.FomatSQL(facebookId);
		hoten = DinhDangSQL.FomatSQL(hoten);
		facebookLink = DinhDangSQL.FomatSQL(facebookLink);
		email = DinhDangSQL.FomatSQL(email);
		String sql = "insert into taikhoan(IdTaiKhoan, TenTaiKhoan, QuyenQuanTri, HoTen, Email, CoXoa, TinhTrang, FacebookId, FacebookLink)"
				+ " values (N'"
				+ getIdTaiKhoanMax()
				+ "', N'"
				+ facebookId
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
				+ "')";
		db.updateData(sql);
	}
	
	public boolean checkLoginWithGoogle(String googleId) {
		// Kiểm tra tồn tại của user
		googleId = DinhDangSQL.FomatSQL(googleId);
		String sql = "";
		sql = "select * from taikhoan where GoogleId='" + googleId + "'";
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
	
	public void registerAccountWithGoogle(String googleId, String hoten, String email) {
		// TODO Auto-generated method stub
		googleId = DinhDangSQL.FomatSQL(googleId);
		hoten = DinhDangSQL.FomatSQL(hoten);
		email = DinhDangSQL.FomatSQL(email);
		String sql = "insert into taikhoan(IdTaiKhoan, TenTaiKhoan, QuyenQuanTri, HoTen, Email, CoXoa, TinhTrang, GoogleId)"
				+ " values (N'"
				+ getIdTaiKhoanMax()
				+ "', N'"
				+ googleId
				+ "',N'user',"
				+ " N'"
				+ hoten
				+ "',"
				+ " N'"
				+ email
				+ "','0', N'MoiTao',N'"
				+ googleId
				+ "')";
		db.updateData(sql);
	}

	public boolean updateAccountByEmail(TAIKHOAN user) {
		// TODO Auto-generated method stub
		String sql = "update taikhoan set FacebookId=N'" + user.getFacebookID()
				+ "', FacebookLink=N'" + user.getFacebookLink()
				+ "' where Email='" + user.getEmail() + "'";
		return db.updateData(sql);
	}
	
	public boolean updateAccountByEmailGoogle(TAIKHOAN user) {
		// TODO Auto-generated method stub
		String sql = "update taikhoan set GoogleId=N'" + user.getGoogleID()
				+ "' where Email='" + user.getEmail() + "'";
		return db.updateData(sql);
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
			rs = db.getResultSet("select * from taikhoan where TenTaiKhoan=N'"
					+ username + "' and MatKhau=N'" + password + "'");
		}
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
		String sql = "update taikhoan set MatKhau=N'"
				+ DinhDangSQL.FomatSQL(user.getMatKhau()) + "', DiaChi=N'"
				+ DinhDangSQL.FomatSQL(user.getDiaChi()) + "', HoTen=N'"
				+ DinhDangSQL.FomatSQL(user.getHoTen()) + "', DienThoai='"
				+ DinhDangSQL.FomatSQL(user.getDienThoai()) + "', Email=N'"
				+ DinhDangSQL.FomatSQL(user.getEmail())
				+ "' where TenTaiKhoan=N'"
				+ DinhDangSQL.FomatSQL(user.getTenTaiKhoan()) + "'";
		return db.updateData(sql);
	}

	public void addTaiKhoan(String taikhoan, String matkhau, String hoten,
			String diachi, String dienthoai, String email, String ngonngu) {
		// TODO Auto-generated method stub
		taikhoan = DinhDangSQL.FomatSQL(taikhoan);
		matkhau = DinhDangSQL.FomatSQL(matkhau);
		hoten = DinhDangSQL.FomatSQL(hoten);
		diachi = DinhDangSQL.FomatSQL(diachi);
		dienthoai = DinhDangSQL.FomatSQL(dienthoai);
		email = DinhDangSQL.FomatSQL(email);
		ngonngu = DinhDangSQL.FomatSQL(email);
		String sql = "insert into taikhoan(IdTaiKhoan, TenTaiKhoan, MatKhau, QuyenQuanTri, HoTen, DiaChi, DienThoai, Email, NgonNgu, CoXoa, TinhTrang)"
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
				+ ngonngu + "', '0', N'MoiTao')";
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
