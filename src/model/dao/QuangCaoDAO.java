package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import model.bean.BAIVIET;
import model.bean.DANHMUC;
import model.bean.QUANGCAO;
import model.bean.TAIKHOAN;

public class QuangCaoDAO {

	DataBaseDAO db = new DataBaseDAO();

	/*
	 * Lấy quang cáo có id tương ứng return QUANGCAO
	 */
	public QUANGCAO getQuangCao(String id) {
		// TODO Auto-generated method stub
		id = DinhDangSQL.FomatSQL(id);
		ResultSet rs = db
				.getResultSet("select IdQuangCao, LienKet, HinhAnh, ViTri from quangcao where IdQuangCao = "+id);
		QUANGCAO qc = null;
		try {
			if (rs.next()) {
				qc = new QUANGCAO();
				qc.setIdQuangCao(Integer.parseInt(id));
				qc.setLienKet(DinhDangSQL.DeFomatSQL(rs
						.getString("LienKet")));
				qc.setHinhAnh(DinhDangSQL.DeFomatSQL(rs
						.getString("HinhAnh")));
				qc.setViTri(rs.getInt("ViTri"));
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
}
