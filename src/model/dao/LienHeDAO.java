package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import model.bean.LIENHE;


public class LienHeDAO {

	DataBaseDAO db = new DataBaseDAO();

	public void setMenu(int nBangghi, int ntrang) {
		// TODO Auto-generated method stub
		db.setMenu(nBangghi, ntrang);
	}
	
	public String getMenuPhanTrang(){
		return db.getMenuPhanTrang();
	}
	
	public void closeConnection() {
		db.closeConnection();
	}

	public ArrayList<LIENHE> getListLienHe(String timtheo, String find,
			int page) {
		find = DinhDangSQL.FomatSQL(find);
		String sql = "select * from lienhe "
				+ (timtheo.equals("1")?" where (idlienhe='"+find+"' or email='"+find+"' or sodienthoai like N'%"+find+"' or tennguoigui like N'%"+find+"' or tieude like N'%"+find+"%' or noidung like N'%"+find+"%')":"")
				+ (timtheo.equals("2")?" where idlienhe='"+find+"'":"")
				+ (timtheo.equals("3")?" where tennguoigui like N'%"+find+"%'":"")
				+ (timtheo.equals("4")?" where noidung like N'%"+find+"%' or tieude like N'%"+find+"%' ":"");
		sql += " order by dadoc asc, idlienhe desc ";
		db.createMenu("LienHeServlet?", 1, sql);
		ResultSet rs = db.getResultSet(sql + " limit " + (page-1)*db.getNBangGhi() +","+ db.getNBangGhi());
		ArrayList<LIENHE> list = new ArrayList<LIENHE>();
		try {
			while(rs.next()){
				LIENHE tb = new LIENHE();
				tb.setIdLienHe(rs.getInt("idlienhe") + "");
				tb.setTieuDe(DinhDangSQL.DeFomatSQL(rs.getString("tieude")));
				tb.setNoiDung(DinhDangSQL.DeFomatSQL(rs.getString("noidung")));
				tb.setDaDoc(rs.getInt("dadoc"));
				tb.setNgayGui(DinhDangSQL.DeFomatSQL(rs.getString("ngaygui")));
				tb.setHoTen(DinhDangSQL.DeFomatSQL(rs.getString("tennguoigui")));
				list.add(tb);
			}
			return list;
		} catch (SQLException e) {
			System.out.println("Lỗi hệ truy vấn dữ liệu bảng thông báo!");
		}
		return null;
	}

	public LIENHE getLienHe(String id) {
		// TODO Auto-generated method stub
		id = DinhDangSQL.FomatSQL(id);
		String sql = "select * from lienhe where idlienhe='"+id+"'";
		ResultSet rs = db.getResultSet(sql);
		try {
			if(rs.next()){
				LIENHE tb = new LIENHE();
				tb.setIdLienHe(rs.getInt("idlienhe") + "");
				tb.setTaiKhoan(DinhDangSQL.DeFomatSQL(rs.getString("taikhoan")));
				tb.setEmail(DinhDangSQL.DeFomatSQL(rs.getString("email")));
				tb.setHoTen(DinhDangSQL.DeFomatSQL(rs.getString("tennguoigui")));
				tb.setTieuDe(DinhDangSQL.DeFomatSQL(rs.getString("tieude")));
				tb.setNoiDung(DinhDangSQL.DeFomatSQL(rs.getString("noidung")));
				tb.setDaDoc(rs.getInt("dadoc"));
				tb.setNgayGui(DinhDangSQL.DeFomatSQL(rs.getString("ngaygui")));
				return tb;
			}
		} catch (SQLException e) {
			System.out.println("Lỗi hệ truy vấn dữ liệu bảng liên hệ!");
		}
		return null;
	}

	public boolean XoaLienHe(String id) {
		// TODO Auto-generated method stub
		return db.updateData("delete from lienhe where idlienhe='" + id + "'");
	}

	public void capNhat(String id) {
		// TODO Auto-generated method stub
		db.updateData("update lienhe set dadoc=1 where idlienhe='" + id + "'");
	}
public void addLienHe(String taikhoan, String hoten, String dienthoai,
			String email, String tieude, String noidung) {
		Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		taikhoan = DinhDangSQL.FomatSQL(taikhoan);
		if(taikhoan==null) taikhoan = "";
		hoten = DinhDangSQL.FomatSQL(hoten);
		dienthoai = DinhDangSQL.FomatSQL(dienthoai);
		if(dienthoai==null) dienthoai = "";
		email = DinhDangSQL.FomatSQL(email);
		tieude = DinhDangSQL.FomatSQL(tieude);
		String sql = "insert into lienhe(taikhoan, email, sodienthoai, tennguoigui, noidung, ngaygui, tieude, dadoc)"
						+ " values (N'"+taikhoan+"', N'"+email+"',N'"+dienthoai+"',"
						+ " N'"+hoten+"', N'"+noidung+"','"+sdf.format(cal.getTime())+"',N'"+tieude+"',"
						+ "'0')";
		db.updateData(sql);		
	}
	
}
