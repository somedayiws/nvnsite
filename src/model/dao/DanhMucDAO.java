package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.DANHMUC;

public class DanhMucDAO {

	DataBaseDAO db = new DataBaseDAO();
	
	public ArrayList<DANHMUC> getDanhSachDanhMuc(String txtFind) {
		// TODO Auto-generated method stub
		txtFind = DinhDangSQL.FomatSQL(txtFind);
		ResultSet rs = null;
		if(txtFind.equals("")) rs = db.getResultSet("select danhmuc.IdDanhMuc, TenDanhMucVi, TenDanhMucJa, HienThi, count(IdBaiViet) as SoLuongBai from danhmuc left join baiviet on danhmuc.IdDanhMuc=baiviet.IdDanhMuc  and TrangThai=N'OK' where danhmuc.CoXoa=0 group by danhmuc.IdDanhMuc order by HienThi desc");
		else rs = db.getResultSet("select danhmuc.IdDanhMuc, TenDanhMucVi, TenDanhMucJa, HienThi, count(IdBaiViet) as SoLuongBai from danhmuc left join baiviet on danhmuc.IdDanhMuc=baiviet.IdDanhMuc where danhmuc.CoXoa=0 group by danhmuc.IdDanhMuc order by HienThi desc");
		ArrayList<DANHMUC> list = new ArrayList<DANHMUC>();
		try {
			while(rs.next()){
				DANHMUC dm = new DANHMUC(DinhDangSQL.DeFomatSQL(rs.getString("IdDanhMuc")),DinhDangSQL.DeFomatSQL(rs.getString("TenDanhMucVi")), DinhDangSQL.DeFomatSQL(rs.getString("TenDanhMucJa")), rs.getInt("HienThi"));
				dm.setSoLuongBV(rs.getInt("SoLuongBai"));
				System.out.println(dm.getSoLuongBV());
				list.add(dm);
			}
			return list;
		} catch (SQLException e) {
			//Lỗi trả về sai
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<DANHMUC> getListDanhMuc(String vitri, String top) {
		// TODO Auto-generated method stub
		String sql = "select IdDanhMuc,TenDanhMucVi,TenDanhMucJa,ICon from danhmuc where danhmuc.CoXoa=0 limit "+vitri+","+top;
		System.out.println(sql);
		ResultSet rs = db.getResultSet(sql);
		ArrayList<DANHMUC> list = new ArrayList<DANHMUC>();
		BaiVietDAO baiviet = new BaiVietDAO();
		try {
			while(rs.next()){
				DANHMUC dm = new DANHMUC();
				String id = DinhDangSQL.DeFomatSQL(rs.getString("IdDanhMuc"));
				dm.setIdDanhMuc(id);
				dm.setTenDanhMucVi(DinhDangSQL.DeFomatSQL(rs.getString("TenDanhMucVi")));
				dm.setTenDanhMucJa(DinhDangSQL.DeFomatSQL(rs.getString("TenDanhMucJa")));
				dm.setIcon(DinhDangSQL.DeFomatSQL(rs.getString("ICon")));
				dm.setBaiViets(baiviet.getListBaiViet(id, "0", "4"));
				list.add(dm);
			}
			return list;
		} catch (SQLException e) {
			//Lỗi trả về sai
			e.printStackTrace();
			return null;
		}
	}
	
	public void addDanhMuc(String id, String tv, String tn, String ghim) {
		// TODO Auto-generated method stub
		id = DinhDangSQL.FomatSQL(id);
		tv = DinhDangSQL.FomatSQL(tv);
		tn = DinhDangSQL.FomatSQL(tn);
		String sql = "insert into danhmuc values (N'"+id+"', N'"+tv+"', N'"+tn+"', '"+ghim+"')";
		db.updateData(sql);
	}

	public DANHMUC getDanhMuc(String id) {
		// TODO Auto-generated method stub
		id = DinhDangSQL.FomatSQL(id);
		String sql = "select danhmuc.IdDanhMuc, TenDanhMucVi, TenDanhMucJa, HienThi, count(IdBaiViet) as SoLuongBai from danhmuc left join baiviet on danhmuc.IdDanhMuc=baiviet.IdDanhMuc and TrangThai=N'OK' where danhmuc.IdDanhMuc=N'"+id+"' and danhmuc.CoXoa=0 group by danhmuc.IdDanhMuc order by HienThi desc";
		ResultSet rs = db.getResultSet(sql);
		try {
			if(rs.next()){
				DANHMUC dm = new DANHMUC(DinhDangSQL.DeFomatSQL(rs.getString("IdDanhMuc")),DinhDangSQL.DeFomatSQL(rs.getString("TenDanhMucVi")), DinhDangSQL.DeFomatSQL(rs.getString("TenDanhMucJa")), rs.getInt("HienThi"));
				dm.setSoLuongBV(rs.getInt("SoLuongBai"));
				return dm;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public void closeConnection() {
		db.closeConnection();
	}
}
