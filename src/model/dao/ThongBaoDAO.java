package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import model.bean.THONGBAO;

public class ThongBaoDAO {

	DataBaseDAO db = new DataBaseDAO();
	
	public ArrayList<THONGBAO> getListHienThi(String den) {
		// TODO Auto-generated method stub
		String sql = "select * from thongbao where HienThi='1'";
		if(den.equals("")){
			sql = "select * from thongbao where HienThi='1'";
		}else{
			sql = "select * from thongbao where HienThi='1' and GuiDen like N'%'";
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

	public ArrayList<THONGBAO> getListKhongHienThi(String den, String page, String top) {
		// TODO Auto-generated method stub
		String sql = "select * from thongbao where HienThi='0' limit " + Integer.parseInt(page)*Integer.parseInt(top) + ", " + top;
		if(den.equals("")){
			sql = "select * from thongbao where HienThi='0' limit " + Integer.parseInt(page)*Integer.parseInt(top) + ", " + top;
		}else{
			sql = "select * from thongbao where HienThi='0' and GuiDen like N'%' limit " + Integer.parseInt(page)*Integer.parseInt(top) + ", " + top;
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

	public THONGBAO getThongBao(String id) {
		// TODO Auto-generated method stub
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
		Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sql = "insert into thongbao(TieuDe, NoiDung, NgayDang, HienThi, GuiDen)"
				+ " values (N'"+tieude+"', N'"+noidung+"', '"+sdf.format(cal.getTime())+"', '0', N'"+guiden+"')";
		return db.updateData(sql);
	}

	public boolean SuaThongBao(String id, String tieude, String noidung,
			String guiden) {
		// TODO Auto-generated method stub
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

}
