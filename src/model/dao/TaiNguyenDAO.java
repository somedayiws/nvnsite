package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TaiNguyenDAO {

	DataBaseDAO db = new DataBaseDAO();
	
	public String getValue(String key) {
		String sql = "select Value111 from tainguyen where Key111=N'" + key + "'";
		ResultSet rs = db.getResultSet(sql);
		try {
			if(rs.next()){
				return rs.getString("Value111");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "";
	}

	public boolean CapNhatTaiNguyen(String soTu, String giaVN, String giaJA, String image, String image1, 
			String thongDiep, String lienHe, String dienThoai, String email, String gioiThieu, String noiQuy) {
		// TODO Auto-generated method stub
		String sql = "update tainguyen set Value111=N'"+image+"' where IdTaiNguyen='6'";
		String sql1	= " update tainguyen set Value111=N'"+image1+"' where IdTaiNguyen='7'";
		String sql2	= " update tainguyen set Value111=N'"+soTu+"' where IdTaiNguyen='8'";
		String sql3	= " update tainguyen set Value111=N'"+giaVN+"' where IdTaiNguyen='9'";
		String sql4	= " update tainguyen set Value111=N'"+giaJA+"' where IdTaiNguyen='10'";
		String sql5	= " update tainguyen set Value111=N'"+thongDiep+"' where IdTaiNguyen='11'";
		String sql6	= " update tainguyen set Value111=N'"+lienHe+"' where IdTaiNguyen='12'";
		String sql7	= " update tainguyen set Value111=N'"+dienThoai+"' where IdTaiNguyen='13'";
		String sql8	= " update tainguyen set Value111=N'"+email+"' where IdTaiNguyen='3'";
		String sql9	= " update tainguyen set Value111=N'"+gioiThieu+"' where IdTaiNguyen='14'";
		String sql10	= " update tainguyen set Value111=N'"+noiQuy+"' where IdTaiNguyen='15'";
		return db.updateData(sql)&db.updateData(sql1)&db.updateData(sql2)&db.updateData(sql3)&db.updateData(sql4)&db.updateData(sql5)&db.updateData(sql6)&db.updateData(sql7)&db.updateData(sql8)&db.updateData(sql9)&db.updateData(sql10);
	}
	public void closeConnection() {
		db.closeConnection();
	}
}
