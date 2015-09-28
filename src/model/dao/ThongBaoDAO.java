package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import model.bean.THONGBAO;

public class ThongBaoDAO {

	DataBaseDAO db = new DataBaseDAO();
	
	public ArrayList<THONGBAO> getListThongBao(String den, int page) {
		// TODO Auto-generated method stub
		String sql = "select * from thongbao where "+den+" order by HienThi desc, NgayDang desc ";
		db.createMenu("TBDenToiServlet?", 1, sql);
		ResultSet rs = db.getResultSet(sql);
		ArrayList<THONGBAO> list = new ArrayList<THONGBAO>();
		try {
			while(rs.next()){
				THONGBAO tb = new THONGBAO();
				tb.setIdThongBao(rs.getInt("IdThongBao"));
				tb.setTieuDe(DinhDangSQL.DeFomatSQL(rs.getString("TieuDe")));
				tb.setNoiDung(DinhDangSQL.DeFomatSQL(rs.getString("NoiDung")));
				tb.setHienThi(1);
				tb.setNgayDang(DinhDangSQL.DeFomatSQL(rs.getString("NgayDang")));
				tb.setGuiDen(DinhDangSQL.DeFomatSQL(rs.getString("GuiDen")));
				list.add(tb);
			}
			return list;
		} catch (SQLException e) {
			System.out.println("Lỗi hệ truy vấn dữ liệu bảng thông báo!");
		}
		return null;
	}
	
	public ArrayList<THONGBAO> getListHienThi(String den, String timtheo, String find) {
		// TODO Auto-generated method stub
		find = DinhDangSQL.FomatSQL(find);
		String sql = "select * from thongbao where HienThi='1'";
		if(den.equals("")){
			sql = "select * from thongbao where HienThi='1'"
					+ (timtheo.equals("1")?" and (IdThongBao='"+find+"' or IdThongBao='"+find+"' or GuiDen like N'%"+find+"%' or NoiDung like N'%"+find+"%')":"")
					+ (timtheo.equals("2")?" and IdThongBao='"+find+"'":"")
					+ (timtheo.equals("3")?" and GuiDen like N'%"+find+"%'":"")
					+ (timtheo.equals("4")?" and NoiDung like N'%"+find+"%'":"");
		}else{
			sql = "select * from thongbao where HienThi='1' and GuiDen like N'%'"
					+ (timtheo.equals("1")?" and (IdThongBao='"+find+"' or IdThongBao='"+find+"' or GuiDen like N'%"+find+"%' or NoiDung like N'%"+find+"%')":"")
					+ (timtheo.equals("2")?" and IdThongBao='"+find+"'":"")
					+ (timtheo.equals("3")?" and GuiDen like N'%"+find+"%'":"")
					+ (timtheo.equals("4")?" and NoiDung like N'%"+find+"%'":"");
		}
		ResultSet rs = db.getResultSet(sql);
		ArrayList<THONGBAO> list = new ArrayList<THONGBAO>();
		try {
			while(rs.next()){
				THONGBAO tb = new THONGBAO();
				tb.setIdThongBao(rs.getInt("IdThongBao"));
				tb.setTieuDe(DinhDangSQL.DeFomatSQL(rs.getString("TieuDe")));
				tb.setNoiDung(DinhDangSQL.DeFomatSQL(rs.getString("NoiDung")));
				tb.setHienThi(1);
				tb.setNgayDang(DinhDangSQL.DeFomatSQL(rs.getString("NgayDang")));
				tb.setGuiDen(DinhDangSQL.DeFomatSQL(rs.getString("GuiDen")));
				list.add(tb);
			}
			return list;
		} catch (SQLException e) {
			System.out.println("Lỗi hệ truy vấn dữ liệu bảng thông báo!");
		}
		return null;
	}

	public ArrayList<THONGBAO> getListKhongHienThi(String den, String timtheo, String find, int page) {
		// TODO Auto-generated method stub
		find = DinhDangSQL.FomatSQL(find);
		String sql = "select * from thongbao where HienThi='0' "
				+ (timtheo.equals("1")?" and (IdThongBao='"+find+"' or IdThongBao='"+find+"' or GuiDen like N'%"+find+"%' or NoiDung like N'%"+find+"%')":"")
				+ (timtheo.equals("2")?" and IdThongBao='"+find+"'":"")
				+ (timtheo.equals("3")?" and GuiDen like N'%"+find+"%'":"")
				+ (timtheo.equals("4")?" and NoiDung like N'%"+find+"%'":"");
		if(den.equals("")){
			sql = "select * from thongbao where HienThi='0' "
					+ (timtheo.equals("1")?" and (IdThongBao='"+find+"' or IdThongBao='"+find+"' or GuiDen like N'%"+find+"%' or NoiDung like N'%"+find+"%')":"")
					+ (timtheo.equals("2")?" and IdThongBao='"+find+"'":"")
					+ (timtheo.equals("3")?" and GuiDen like N'%"+find+"%'":"")
					+ (timtheo.equals("4")?" and NoiDung like N'%"+find+"%'":"");
		}else{
			sql = "select * from thongbao where HienThi='0' and GuiDen like N'%' "
					+ (timtheo.equals("1")?" and (IdThongBao='"+find+"' or IdThongBao='"+find+"' or GuiDen like N'%"+find+"%' or NoiDung like N'%"+find+"%')":"")
					+ (timtheo.equals("2")?" and IdThongBao='"+find+"'":"")
					+ (timtheo.equals("3")?" and GuiDen like N'%"+find+"%'":"")
					+ (timtheo.equals("4")?" and NoiDung like N'%"+find+"%'":"");
		}
		db.createMenu("ThongBaoServlet?", 1, sql);
		ResultSet rs = db.getResultSet(sql);
		ArrayList<THONGBAO> list = new ArrayList<THONGBAO>();
		try {
			while(rs.next()){
				THONGBAO tb = new THONGBAO();
				tb.setIdThongBao(rs.getInt("IdThongBao"));
				tb.setTieuDe(DinhDangSQL.DeFomatSQL(rs.getString("TieuDe")));
				tb.setNoiDung(DinhDangSQL.DeFomatSQL(rs.getString("NoiDung")));
				tb.setHienThi(1);
				tb.setNgayDang(DinhDangSQL.DeFomatSQL(rs.getString("NgayDang")));
				tb.setGuiDen(DinhDangSQL.DeFomatSQL(rs.getString("GuiDen")));
				list.add(tb);
			}
			return list;
		} catch (SQLException e) {
			System.out.println("Lỗi hệ truy vấn dữ liệu bảng thông báo!");
		}
		return null;
	}

	public THONGBAO getThongBao(String id) {
		// TODO Auto-generated method stub
		id = DinhDangSQL.FomatSQL(id);
		String sql = "select * from thongbao where IdThongBao='"+id+"'";
		ResultSet rs = db.getResultSet(sql);
		try {
			if(rs.next()){
				THONGBAO tb = new THONGBAO();
				tb.setIdThongBao(rs.getInt("IdThongBao"));
				tb.setTieuDe(DinhDangSQL.DeFomatSQL(rs.getString("TieuDe")));
				tb.setNoiDung(DinhDangSQL.DeFomatSQL(rs.getString("NoiDung")));
				tb.setHienThi(1);
				tb.setNgayDang(DinhDangSQL.DeFomatSQL(rs.getString("NgayDang")));
				tb.setGuiDen(DinhDangSQL.DeFomatSQL(rs.getString("GuiDen")));
				return tb;
			}
		} catch (SQLException e) {
			System.out.println("Lỗi hệ truy vấn dữ liệu bảng thông báo!");
		}
		return null;
	}

	public boolean ThemThongBao(String tieude, String noidung, String guiden) {
		// TODO Auto-generated method stub
		tieude = DinhDangSQL.FomatSQL(tieude);
		noidung = DinhDangSQL.FomatSQL(noidung);
		guiden = DinhDangSQL.FomatSQL(guiden);
		Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sql = "insert into thongbao(TieuDe, NoiDung, NgayDang, HienThi, GuiDen)"
				+ " values (N'"+tieude+"', N'"+noidung+"', '"+sdf.format(cal.getTime())+"', '0', N'"+guiden+"')";
		return db.updateData(sql);
	}

	public boolean SuaThongBao(String id, String tieude, String noidung,
			String guiden) {
		// TODO Auto-generated method stub
		tieude = DinhDangSQL.FomatSQL(tieude);
		noidung = DinhDangSQL.FomatSQL(noidung);
		guiden = DinhDangSQL.FomatSQL(guiden);
		String sql = "update thongbao set TieuDe=N'"+tieude+"', NoiDung=N'"+noidung+"', GuiDen=N'"+guiden+"' where IdThongBao='"+id+"'";
		return db.updateData(sql);
	}

	public boolean XoaThongBao(String id) {
		// TODO Auto-generated method stub
		String sql = "delete from thongbao where IdThongBao='"+id+"'";
		return db.updateData(sql);
	}

	public boolean SuaThongBao(String id, String hienthi) {
		// TODO Auto-generated method stub
		String sql = "update thongbao set HienThi='"+(hienthi.equals("1")?"0":"1")+"' where IdThongBao='"+id+"'";
		return db.updateData(sql);
	}

	public int CheckMail(String idtaikhoan, String tentaikhoan){
		String sql = "select count(*) from thongbao where GuiDen like N'"+idtaikhoan+"' or GuiDen like N'"+tentaikhoan+"' and HienThi='1'";
		ResultSet rs = db.getResultSet(sql);
		try {
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("Lỗi truy vấn csdl");
		}
		return 0;
	}
	
	public String getMenuPhanTrang(){
		return db.getMenuPhanTrang();
	}

	public void setMenu(int nBangghi, int ntrang) {
		// TODO Auto-generated method stub
		db.setMenu(nBangghi, ntrang);
	}
}
