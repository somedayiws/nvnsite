package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.bean.TAIKHOAN;

public class TaiKhoanDAO {

	DataBaseDAO db = new DataBaseDAO();
	
	public boolean chekOk(String username, String password) {
		//Kiểm tra tồn tại của user
		username = DinhDangSQL.FomatSQL(username);
		password = DinhDangSQL.FomatSQL(password);
		
		ResultSet rs = db.getResultSet("select * from taikhoan where TenTaiKhoan='"+username+"' and MatKhau='" + password + "'");
		try {
			if(rs.next()) return true;
		} catch (SQLException e) {
			//Lỗi trả về sai
			e.printStackTrace();
			return false;
		}
		return false;
	}

	public TAIKHOAN getTaiKhoan(String username, String password) {
		//lấy tài khoản thỏa mãn
		username = DinhDangSQL.FomatSQL(username);
		password = DinhDangSQL.FomatSQL(password);
		
		ResultSet rs = db.getResultSet("select * from taikhoan where TenTaiKhoan='"+username+"' and MatKhau='" + password + "'");
		TAIKHOAN taikhoan = null;
		try {
			if(rs.next()){
				taikhoan = new TAIKHOAN(DinhDangSQL.DeFomatSQL(rs.getString("IdTaiKhoan")),DinhDangSQL.DeFomatSQL(rs.getString("TenTaiKhoan")), DinhDangSQL.DeFomatSQL(rs.getString("MatKhau")), DinhDangSQL.DeFomatSQL(rs.getString("HoTen")), DinhDangSQL.DeFomatSQL(rs.getString("DiaChi")), rs.getString("DienThoai"), DinhDangSQL.DeFomatSQL(rs.getString("Email")), DinhDangSQL.DeFomatSQL(rs.getString("QuyenQuanTri")));
				taikhoan.setNgonNgu(DinhDangSQL.DeFomatSQL(rs.getString("NgonNgu")));
				return taikhoan;
			}
		} catch (SQLException e) {
			//Lỗi trả về sai
			e.printStackTrace();
			return taikhoan;
		}
		return taikhoan;
	}

	public void UpdateThongTin(TAIKHOAN user) {
		// TODO Auto-generated method stub
		String sql = "update taikhoan set MatKhau=N'"+DinhDangSQL.FomatSQL(user.getMatKhau())
				+"', DiaChi=N'"+DinhDangSQL.FomatSQL(user.getDiaChi())
				+"', HoTen=N'"+DinhDangSQL.FomatSQL(user.getHoTen())
				+"', DienThoai='"+DinhDangSQL.FomatSQL(user.getDienThoai())
				+"', Email=N'"+DinhDangSQL.FomatSQL(user.getEmail())
				+"' where TenTaiKhoan=N'"+DinhDangSQL.FomatSQL(user.getTenTaiKhoan())+"'";
		db.updateData(sql);
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
				+ " values (N'"+getIdTaiKhoanMax()+"', N'"+taikhoan+"', N'"+matkhau+"',N'user',"
				+ " N'"+hoten+"', N'"+diachi+"', '"+dienthoai+"',"
				+ " N'"+email+"', N'"+ngonngu+"', '0', N'hoatdong')";
		db.updateData(sql);
	}
	public String getIdTaiKhoanMax(){
		String id = "US00000000";
		ResultSet rs = db.getResultSet("select IdTaiKhoan from taikhoan order by IdTaiKhoan desc limit 1");
		try {
			if(rs.next()){
				int tam = Integer.parseInt(rs.getString(1).substring(2)) + 1;
				id = id.substring(0, 10 - (tam+"").length()) + tam;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}
}
