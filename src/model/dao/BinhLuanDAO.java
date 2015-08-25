package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.BINHLUAN;
import model.bean.TAIKHOAN;

public class BinhLuanDAO {

	DataBaseDAO db = new DataBaseDAO();

	public ArrayList<BINHLUAN> getListBinhLuan(String id, String nn, String vitri) {
		// TODO Auto-generated method stub
		ArrayList<BINHLUAN> list = new ArrayList<BINHLUAN>();
		String sql = "";
		if(nn != null && nn.equals("ja")){
			sql = "select PhanHoiJa, PhanHoiVi, taikhoan.IdTaiKhoan, TenTaiKhoan, MatKhau, HoTen, DiaChi, DienThoai, Email, QuyenQuanTri "
					+ "from binhluan inner join taikhoan on binhluan.IdTaiKhoan=taikhoan.IdTaiKhoan where IdBaiViet='"+id+"' "
					+ "and PhanHoiJa is not null limit "+vitri+",5";
		}else {
			sql = "select PhanHoiJa, PhanHoiVi, taikhoan.IdTaiKhoan, TenTaiKhoan, MatKhau, HoTen, DiaChi, DienThoai, Email, QuyenQuanTri "
					+ "from binhluan inner join taikhoan on binhluan.IdTaiKhoan=taikhoan.IdTaiKhoan where IdBaiViet='"+id+"' "
					+ "and PhanHoiVi is not null limit "+vitri+",5";
		}
		ResultSet rs = db.getResultSet(sql);
		try {
			while(rs.next()){
				BINHLUAN bl = new BINHLUAN();
				bl.setPhanHoiJa(DinhDangSQL.DeFomatSQL(rs.getString("PhanHoiJa")));
				bl.setPhanHoiVi(DinhDangSQL.DeFomatSQL(rs.getString("PhanHoiVi")));
				bl.setTaiKhoan(new TAIKHOAN(DinhDangSQL.DeFomatSQL(rs.getString("IdTaiKhoan")), DinhDangSQL.DeFomatSQL(rs.getString("TenTaiKhoan")), DinhDangSQL.DeFomatSQL(rs.getString("MatKhau")), DinhDangSQL.DeFomatSQL(rs.getString("HoTen")), DinhDangSQL.DeFomatSQL(rs.getString("DiaChi")), rs.getString("DienThoai"), DinhDangSQL.DeFomatSQL(rs.getString("Email")), DinhDangSQL.DeFomatSQL(rs.getString("QuyenQuanTri"))));
				list.add(bl); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public void addBinhLuanVi(String id, String idTaiKhoan, String binhluan) {
		// TODO Auto-generated method stub
		id = DinhDangSQL.FomatSQL(id);
		idTaiKhoan = DinhDangSQL.FomatSQL(idTaiKhoan);
		binhluan = DinhDangSQL.FomatSQL(binhluan);
		String sql = "insert into binhluan(IdBaiViet, IdTaiKhoan, PhanHoiVi, CoXoa) values (N'"+id+"', N'"+idTaiKhoan+"', N'"+binhluan+"', '0')";
		System.out.println("SQL : " + sql);
		db.updateData(sql);
	}

	public void addBinhLuanJa(String id, String idTaiKhoan, String binhluan) {
		// TODO Auto-generated method stub
		id = DinhDangSQL.FomatSQL(id);
		idTaiKhoan = DinhDangSQL.FomatSQL(idTaiKhoan);
		binhluan = DinhDangSQL.FomatSQL(binhluan);
		String sql = "insert into binhluan(IdBaiViet, IdTaiKhoan, PhanHoiJa, CoXoa) values (N'"+id+"', N'"+idTaiKhoan+"', N'"+binhluan+"', '0')";
		System.out.println("SQL : " + sql);
		db.updateData(sql);
	}
}
