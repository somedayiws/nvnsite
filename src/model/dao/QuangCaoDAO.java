package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import model.bean.QUANGCAO;

public class QuangCaoDAO {

	DataBaseDAO db = new DataBaseDAO();

	/*
	 * Lấy quang cáo có id tương ứng return QUANGCAO
	 */
	public QUANGCAO getQuangCao(String id) {
		// TODO Auto-generated method stub
		id = DinhDangSQL.FomatSQL(id);
		ResultSet rs = db
				.getResultSet("select * from quangcao where IdQuangCao = "+id);
		QUANGCAO qc = null;
		try {
			if (rs.next()) {
				qc = new QUANGCAO();
				qc.setIdQuangCao(Integer.parseInt(id));
				qc.setLienKet(DinhDangSQL.DeFomatSQL(rs.getString("LienKet")));
				qc.setHinhAnh(DinhDangSQL.DeFomatSQL(rs.getString("HinhAnh")));
				qc.setViTri(rs.getInt("ViTri"));
				qc.setHienThi(rs.getInt("HienThi"));
				qc.setSoNgay(rs.getInt("SoNgay"));
				qc.setTrangHienThi(rs.getInt("TrangHienThi"));
				qc.setDonViQuangCao(rs.getString("DonViQuangCao"));
				qc.setNgayDang(rs.getDate("NgayDang").toString());
				qc.setGiaQuangCao(rs.getString("GiaQuangCao"));
				qc.setKichThuoc(rs.getString("KichThuoc"));
				qc.setDienThoai(rs.getString("DienThoai"));
				qc.setEmail(rs.getString("Email"));
				
				return qc;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return qc;
	}

	/*
	 * Lấy danh sách quảng cáo sắp xếp theo vị trí return ArrayList<QUANGCAO>
	 */
	public ArrayList<QUANGCAO> getDanhSachQuangCao() {
		// TODO Auto-generated method stub
		ArrayList<QUANGCAO> list = new ArrayList<QUANGCAO>();
		ResultSet rs = null;
		String sql = "select IdQuangCao, LienKet, HinhAnh, ViTri from quangcao where HienThi = 1 order by ViTri asc";
		rs = db.getResultSet(sql);
		try {
			while (rs.next()) {
				QUANGCAO qc = new QUANGCAO();
				qc.setIdQuangCao(rs.getInt("IdQuangCao"));
				qc.setLienKet(DinhDangSQL.DeFomatSQL(rs
						.getString("LienKet")));
				qc.setHinhAnh(DinhDangSQL.DeFomatSQL(rs
						.getString("HinhAnh")));
				qc.setViTri(rs.getInt("ViTri"));
				list.add(qc);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public boolean xoaQuangCao(String idQC) {
		// TODO Auto-generated method stub
		String sql = "delete from quangcao where IdQuangCao='"+idQC+"'";
		return db.updateData(sql);
	}

	public boolean HienThiQuangCao(String idQC, String hienthi) {
		// TODO Auto-generated method stub
		String sql = "";
		if(hienthi.equals("1")) sql = "update quangcao set HienThi='0' where IdQuangCao='"+idQC+"'";
		else sql = "update quangcao set HienThi='1' where IdQuangCao='"+idQC+"'";
		return db.updateData(sql);
	}

	public boolean ThemQuangCao(String company, String dienthoai, String email,
			String link, String page, String position, String numberOfDay,
			String price, String image, String display) {
		// TODO Auto-generated method stub
		String sql = "";
		Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		sql = "insert into quangcao(Lienket, HinhAnh, ViTri, HienThi, SoNgay, TrangHienThi, DonViQuangCao, NgayDang, GiaQuangCao, KichThuoc, Email, DienThoai) values (N'"
				+ link + "', N'"+image+"', '"+position+"', '"+display+"', '"+numberOfDay+"', '"+page+"', N'"
				+ company+ "', '"+sdf.format(cal.getTime())+"', '"+price+"', '300x400', '"+email+"', '"+dienthoai+"')";
		System.out.println("SQL : " + sql);
		return db.updateData(sql);
	}

	public boolean SuaQuangCao(String id, String company, String dienthoai,
			String email, String link, String page, String position,
			String numberOfDay, String price, String image, String display) {
		// TODO Auto-generated method stub
		String sql = "";
		sql = "update quangcao set Lienket=N'"+link+"', HinhAnh=N'"+image+"', ViTri='"+position
				+"', HienThi='"+display+"', SoNgay='"+numberOfDay+"', TrangHienThi='"+page
				+"', DonViQuangCao=N'"+company+"', GiaQuangCao='"+price+"', KichThuoc='300x400', Email=N'"
				+email+"', DienThoai='"+dienthoai+"' where IdQuangCao='"+id+"'";
		System.out.println("SQL : " + sql);
		return db.updateData(sql);
	}
}
