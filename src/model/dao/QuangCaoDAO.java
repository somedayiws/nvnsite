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
	/*
	 * Lấy danh sách quảng cáo sắp xếp theo vị trí return ArrayList<QUANGCAO>
	 */
	public ArrayList<QUANGCAO> getDanhSachQuangCao(int page) {
		// TODO Auto-generated method stub
		ArrayList<QUANGCAO> list = new ArrayList<QUANGCAO>();
		ResultSet rs = null;
		String sql = "select IdQuangCao, LienKet, HinhAnh, ViTri from quangcao where HienThi = 1 and TrangHienThi="+page+" order by ViTri asc";
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
		String sql2 = "";
		QUANGCAO qc = getQuangCao(idQC);
		if(hienthi.equals("1")){
			sql = "update quangcao set HienThi='0'  where IdQuangCao='"+idQC+"'";
			sql2 = "update quangcao set HienThi='1', NgayDang=CURDATE() where IdQuangCao='"+FindID(qc.getViTri(), qc.getTrangHienThi(), 0)+"'";
		}
		else {
			sql = "update quangcao set HienThi='1', NgayDang=CURDATE() where IdQuangCao='"+idQC+"'";
			sql2 = "update quangcao set HienThi='0' where IdQuangCao='"+FindID(qc.getViTri(), qc.getTrangHienThi(), 1)+"'";
		}
		return db.updateData(sql)&&db.updateData(sql2);
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
				+ company+ "', '"+sdf.format(cal.getTime())+"', '"+price+"', '"+getKichThuoc(page, position)+"', '"+email+"', '"+dienthoai+"')";
		System.out.println("SQL : " + sql);
		return db.updateData(sql);
	}

	public boolean SuaQuangCao(String id, String company, String dienthoai,
			String email, String link, String page, String position,
			String numberOfDay, String price, String image) {
		// TODO Auto-generated method stub
		String sql = "";
		sql = "update quangcao set Lienket=N'"+link+"', HinhAnh=N'"+image+"', ViTri='"+position
				+"', SoNgay='"+numberOfDay+"', TrangHienThi='"+page
				+"', DonViQuangCao=N'"+company+"', GiaQuangCao='"+price+"', KichThuoc='"+getKichThuoc(page, position)+"', Email=N'"
				+email+"', DienThoai='"+dienthoai+"' where IdQuangCao='"+id+"'";
		System.out.println("SQL : " + sql);
		return db.updateData(sql);
	}
	
	//Kích thước quảng cáo
	public String getKichThuoc(String page, String vitri){
		if(page.equals("1")){
			if(vitri.equals("3")) return "300x100";
			else if(vitri.equals("4")) return "728x90";
			else if(vitri.equals("6")) return "300x600";
			else return "300x250";
		}
		else if(page.equals("2")) return "300x250";
		return "400x100";
	}
	
	//Kiểm tra tồn tại của quảng cáo
	public boolean KiemTraTonTai(int Vitri, int Page){
		String sql = "select * from quangcao where HienThi='1' and ViTri='"+Vitri+"' and TrangHienThi='"+Page+"' and not DonViQuangCao=N'Mặc định'";
		ResultSet rs = db.getResultSet(sql);
		try {
			while(rs.next()){
				return true;
			}
		} catch (SQLException e) {
			return false;
		}
		return false;
	}
	
	//Lấy ID của quảng cáo mặt định đang ghim
	public int FindID(int vitri, int page, int hienthi){
		String sql = "select IdQuangCao from quangcao where HienThi='"+hienthi+"' and ViTri='"+vitri+"' and TrangHienThi='"+page+"' and DonViQuangCao='Mặc định'";
		ResultSet rs = db.getResultSet(sql);
		try {
			while(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			return -1;
		}
		return -1;
	}

	public void closeConnection() {
		db.closeConnection();
	}
}
