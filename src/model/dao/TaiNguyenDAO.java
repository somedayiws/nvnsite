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

	public boolean CapNhatTaiNguyen(String soTu, String giaVN, String giaJA,
			String image, String image1) {
		// TODO Auto-generated method stub
		String sql = "update tainguyen set Value111=N'"+image+"' where IdTaiNguyen='6'";
		String sql1	= " update tainguyen set Value111=N'"+image1+"' where IdTaiNguyen='7'";
		String sql2	= " update tainguyen set Value111=N'"+soTu+"' where IdTaiNguyen='8'";
		String sql3	= " update tainguyen set Value111=N'"+giaVN+"' where IdTaiNguyen='9'";
		String sql4	= " update tainguyen set Value111=N'"+giaJA+"' where IdTaiNguyen='10'";
		return db.updateData(sql)&db.updateData(sql1)&db.updateData(sql2)&db.updateData(sql3)&db.updateData(sql4);
	}

}